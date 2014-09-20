#
# Step 1: Merge train and test into one data sets
#

setwd("C:\\coursera\\cleaning\\UCI HAR Dataset")

# Read the train data
xtrain <- read.table("train/X_train.txt")
# is 7352 x 561
# Attach the subject id to each row in train, too
strain <- read.table("train/subject_train.txt")
names(strain) <- c("subject_id")
xtrain <- cbind(strain, xtrain)

# Read the test data
xtest <- read.table("test/X_test.txt")
# is 2947 x 561
# Attach the subject id to each row
stest <- read.table("test/subject_test.txt")
names(stest) <- c("subject_id")
xtest <- cbind(stest, xtest)

# Now let's put train and test together
xt <- rbind(xtrain, xtest)


ytrain <- read.table("train/Y_train.txt")
# is 7352 x 1 
ytest <- read.table("test/Y_test.txt")
# is 2947 x 1 
# For logistical regression, this would be the desired outputs
ytl <- rbind(ytrain, ytest)
# We want y as a vector, but rbind has given us a data frame
# so we need to de-list it.
yt <- ytl[[1]]

# Step 1 completed.
# xt is 10299 x 562, yt is 10299 x 1


#
# --------
# Step 2: Take only the columns that are mean or std deviation
#

f <- read.table("features.txt")

# We really only want certain features,
# those with -mean() or -std() in the name.
# use is a list of the numbers of the columns of X 
# that we want to use
use <- sort(union(grep("-mean\\()", f[, 2]), grep("-std\\()", f[, 2])))




# Step 4: Meaningful Column Names
# because we need to look at the Column meanings to determine
# what to keep for Step 2, so why not apply the variable/column names 
# as soon as we know them?

# Let's get the column names for X_test.txt
# by taking the meanings out of features.txt
# and getting rid of punctuation, which doesn't 
# make good column names


clean <- rep(0, 561)
for (i in 1:561) {
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


# AMT -- LOOKUP regmatches
# I really wanted to match on -mean(), which because -mean at 
# the very end of the name, but grep treated $ like a fixed
# despite fixed = FALSE 
#m <- regexec("mean$",foobar)
#regmatches(foobar, m)

# All the rows have moved over 1 for subject, so, 
# add 1 to everything in use
use <- use + 1

# In addition to the columns we just chose, we also want
# to include the subjectId, column 1.
xTrim <-xt[ ,c(1, use)]
# We're trimming columns of xt, not rows, so we don't need to trim yt

#we do not need to do this, having put names on xt already
#LOOK UP: names vs colnames
# names(xTrim) <- c("subject_id", clean[c(use)])

#oh... should we just wait until here to add the rbind'ed subject_id's?

#
# --------
# Step 3: Put meaningful labels on activities
# I took this to mean, translate the numerical 1-6 for which 
# physical activity, into the word for what the subjeect
# was doing

setwd("C:\\coursera\\cleaning\\UCI HAR Dataset")
# activity_labels.txt: "Links the class labels with their activity name."
y_meanings <- read.table("activity_labels.txt")

yt_desc <- data.frame(y_meanings$V2[yt])
names(ytl) <- "numericActivity"
names(yt_desc) <- "Activity"

# The rows of yt_desc go with the rows of the dataset
# As we have not changed row order
dataset <- cbind(xTrim, ytl, yt_desc)

#We have now completed Step 1 - 4
write.csv(dataset, "step4.csv")

#ii <- interaction(dataset$subject_id, dataset$numericActivity)
#s <- split(dataset,ii)
numericDataset <- cbind(xTrim, ytl)
s <- split(numericDataset,list(dataset$subject_id, dataset$numericActivity))
datameans <- t(sapply(s, colMeans))
#Ugh, adding the Activity which is strings screws up colMeans
# but now I've doubled our memory usage 
# and I still have to reapply the Activity names

xX <- xtabs(tBodyAcc.mean.X ~ subject_id + Activity, data = dataset)
colMeans(xX)
xZ <- xtabs(tBodyAcc.mean.Z ~ subject_id + Activity, data = dataset)
colMeans(xZ)
