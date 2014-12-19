## Getting and Cleaning Data Course Project

setwd("./Coursera/3_Getting_and_Cleaning_Data/Project/UCI_HAR_Dataset")

# 1. Merging test and training sets

# Reading test dataset
x_test <- read.table("x_test.txt", sep = "", fill = F, strip.white = T)
names(x_test) <- feat$V2
y_test <- read.table("y_test.txt", sep = "", fill = F, strip.white = T)
subject_test <- read.table("subject_test.txt", fill  = F, strip.white = T)
test <- cbind(subject_test, y_test, x_test)
names(test)[1] <- "subject"
names(test)[2] <- "activity"
save(test, file = "test.Rda")

# Reading train dataset
x_train <- read.table("x_train.txt", sep = "", fill = F, strip.white = T)
feat <- read.table("features.txt", sep = "", strip.white = F); names(x_train) <- feat$V2
y_train <- read.table("y_train.txt", sep = "", fill = F, strip.white = T)
subject_train <- read.table("subject_train.txt", fill = F, strip.white = T)
train <- cbind(subject_train, y_train, x_train)
names(train)[1] <- "subject"
names(train)[2] <- "activity"
save(train, file = "train.Rda")

# Merging
load("test.Rda")
load("train.Rda")
allData <- rbind(test, train)
save(allData, file = "allData.Rda")

# 2. Extracting the measurements (mean and std) for each measurement
names(allData)
firstCol <- allData[, c(1, 2)]
mean_std <- grep(".*mean.*|.*std.*", names(allData))
mean_std <- allData[, mean_std]
measures <- cbind(firstCol, mean_std)
save(measures, file = "measures.Rda")

# 3. Naming the activities
measures$activity <- factor(measures$activity, levels = c(1, 2, 3, 4, 5, 6),
                            labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                                       "SITTING", "STANDING", "LAYING"))

# 4. Labeling the data set with descriptive variable names
varNames <- names(measures[3:81])
varNames <- gsub("^t", "Time", varNames)
varNames <- gsub("^f", "Freq", varNames)
varNames <- gsub("-?mean[(][)]-?", "Mean", varNames)
varNames <- gsub("-?std[()][)]-?", "Std", varNames)
varNames <- gsub("-?meanFreq[()][)]-?", "MeanFreq", varNames)
varNames <- gsub("BodyBody", "Body", varNames)
names(measures)[3:81] <- varNames

# 5. Creating an independent tidy data set with the average of 
# each variable for each activity and each subject
tidy = aggregate(measures, 
                 by=list(subject=measures$subject, 
                         activity = measures$activity), 
                 mean)
tidy[1:4] <- list(NULL)
save(tidy, file = "tidy.Rda")
write.table(tidy, "tidy.txt", sep = " ", row.names = F)


