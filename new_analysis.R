library(dplyr)
library(tidyr)
#
# Step 1; Merges the training and the test sets to create one data set.


# Step 4: Appropriately labels the data set with descriptive variable names. 
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Step 3: Uses descriptive activity names to name the activities in the data set


#
# I interpretted this to also be the right time to add
# subject_id to each row
#

setwd("C:\\coursera\\cleaning\\UCI HAR Dataset")

# Read the train data
# is 7352 x 561
xtrain <- read.table("train/X_train.txt")
# Attach the subject id to each row in train, too
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

# Now let's put train and test together
xt <- rbind(xtrain, xtest)

ytrain <- read.table("train/Y_train.txt")
# ytrain is 7352 x 1 
ytest <- read.table("test/Y_test.txt")
# ytest is 2947 x 1 

ytl <- rbind(ytrain, ytest)
# We want y as a vector, but rbind has given us a data frame
# so we need to de-list it.
yt <- ytl[[1]]

# Step 1 completed.
# xt is 10299 x 562, yt is 10299 x 1



#
## Step 4: Meaningful Column Names
# because we need to look at the Column meanings to determine
# what to keep for Step 2, so why not apply the variable/column names 
# as soon as we know them?

# Let's get the column names for xt
# by taking the meanings out of features.txt
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

# Let's label our overall xt dataset
# The first column is the subject_id we pasted on
# The rest are the cleaned up names we made above
colnames(xt) <- c("subject_id",clean)


#
# Step 2
#
# Since we did step 4 already, we can now use select:
#

X <- tbl_df(xt %>% select(contains("mean"), contains("std"), -contains("meanFreq")))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

