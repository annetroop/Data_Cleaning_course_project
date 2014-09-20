How my run_analysis.R works
===========================

Step 1
------
It reads in the subject_id's from the train/subject_train.txt and the data from the train/X_train.txt file and column binds them so that we keep the subject_id with the data it matches.  This creates the x_test data frame.

run_analysis.R does the same for the files in the test directory to create an x_test data frame. 

It row binds the X test and X train data together.

It then reads in and row binds the Y test and Y train together. 

Then we have one big X and one big Y of the total number of rows (10299) and the same number of columns as the original (plus one for the subject_id): 562.

It column binds the Y to the right of the X so that we have everything in a single data frame.


I considered reading in from the "Inertial Signals" subdirectories,
but it looks like these are background, not needed in final tidy data.
They have already been used to produce the values in X.


Step 2
------

For step 2, we were supposed to select columns that had to do with means or standard deviation.

The column meanings are described in features.txt.

I interpreted "means or standard deviation" to mean those ending with -mean() or -std(). 

So long as I was parsing through features.txt to find those, I also cleaned them up a bit to use as column names in Step 5.


# Let's get the column names for X_test.txt
# by taking the meanings out of features.txt
# and getting rid of punctuation, which doesn't 
# make good column names
