library(dplyr)
library(tidyr)
library(reshape)

#
# Step 1; Merges the training and the test sets to create one data set.
#
# I interpretted this to also be the right time to add
# subject_id to each row
#
# I used capital X and lowercase y because this looks like logistical regression,
# where X is a matrix and y is the outputs we hope to match
#

# Run this from the "UCI HAR Dataset" directory 
# wherever you've downloaded it
# Mine was here:
#setwd("C:\\coursera\\cleaning\\UCI HAR Dataset")


# Read the train data
# which is 7352 x 561
xtrain <- read.table("train/X_train.txt")

# Attach the subject id to each row 
strain <- read.table("train/subject_train.txt")
names(strain) <- c("subject_id")
xtrain <- cbind(strain, xtrain)

# Read the test data
# which is 2947 x 561
xtest <- read.table("test/X_test.txt")

# Attach the subject id to each row
stest <- read.table("test/subject_test.txt")
names(stest) <- c("subject_id")
xtest <- cbind(stest, xtest)

# Put train and test together for X
X <- rbind(xtrain, xtest)

#Let's get y and put it together 
ytrain <- read.table("train/Y_train.txt")
ytest <- read.table("test/Y_test.txt")
ydf <- rbind(ytrain, ytest)
# We want y as a vector, but rbind has given us a data frame
# so we need to de-list it.
y <- ydf[[1]]

# Step 1 completed.
# x is 10299 x 562, y is 10299 x 1


#
# I know this seems out of order, but...
#
# Step 4: Appropriately labels the data set with descriptive variable names. 
#
# We need to look at the Column meanings (features) to determine
# what to keep for Step 2, so why not apply the variable/column names 
# as soon as we know them?
#
# I did come up with an alternative way to do Step 2 first using grep to get a 
# list of feature numbers that corresponded to column numbers in the dataset, 
# but it was not as elegant as using "select".
#
# We can get column names for x
# by taking the meanings of the columns out of features.txt
# and getting rid of punctuation, which doesn't 
# make good column names

f <- read.table("features.txt")
n_feat <- nrow(f)

clean <- rep(0, n_feat)
for (i in 1:n_feat) {
    # The punctuations we need to remove are parens and comma
    a        <- gsub("(", "", f[i,2], fixed = TRUE)
    b        <- gsub(")", "",  a, fixed = TRUE)
    c        <- gsub("-", ".", b, fixed = TRUE)
    clean[i] <- gsub(",", "",  c, fixed = TRUE)
}

# Let's label our overall x dataset
# The first column is the subject_id we pasted on
# The rest are the cleaned up names we made above
colnames(X) <- c("subject_id",clean)

#
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#
# I interpreted this to mean features that ended in -mean() or -std(), but *not* -meanFreq()
#
# Since we did step 4 already, we can now use select:
#

X_trimmed <- select(X, matches("subject_id"), contains("mean"), contains("std"), -contains("meanFreq"))


#
# Step 3: Uses descriptive activity names to name the activities in the data set
# 
# I took this to mean, translate the numerical 1-6 in y_train and y_test, 
# which stands for which physical activity, 
# into the word for what the subject was doing
#
# activity_labels.txt is described as "Links the class labels with their activity name."
# which means it is a 6 x 2 matrix of which the first column is a number 
# and the second column is the name of the activity which that number indicates
# when it shows up in y.  Thus y_meanings$V2[y] maps each number in y to the 
# matching activity description.
#

y_meanings <- read.table("activity_labels.txt")

y_desc <- data.frame(y_meanings$V2[y])
names(y_desc) <- "activity"

# The rows of y_desc go with the rows of the dataset
# As we have not changed row order
dataset <- cbind(X_trimmed, y_desc)

#We have now completed Step 1 - 4
write.csv(dataset, "step4.csv")



#
# Step 5: From the data set in step 4, creates a second, independent 
#  tidy data set with the average of each variable for each activity and each subject.
#
#  Now we get to the real tidying!
#

molten_data <- melt(dataset,id.vars=c("subject_id","activity"))

mean_values <- molten_data %>% group_by(subject_id, activity, variable) %>% summarise(mean(value))

write.table(mean_values, "tidy.txt", row.names = FALSE)
