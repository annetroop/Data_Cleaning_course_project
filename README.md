How my run_analysis.R works
===========================

Step 1
------
My run_analysis.R reads in the subject_id's from the train/subject_train.txt and the data from the train/X_train.txt file and column binds them so that we keep the subject_id with the data it matches.  This creates the x_test data frame.

run_analysis.R does the same for the files in the test directory to create an x_test data frame. 

It row binds the X test and X train data together.

It then reads in and row binds the Y test and Y train together. 

Then we have:

* one big X  of the total number of rows (10299) and the same number of columns as the original plus one for the subject_id: 562.
* one big y vector that's 10299 long.


I considered reading in from the "Inertial Signals" subdirectories,
but it looks like these are background, not needed in final tidy data.
They have already been used to produce the values in X.


Step 2 (and 4)
------

For step 2, we were supposed to select columns that had to do with means or standard deviation.

The column meanings are described in features.txt.

I interpreted "means or standard deviation" to mean those ending with -mean() or -std(). The only places the string "mean" occurred other than as -mean() was -meanFreq() which I didn't think was what we wanted, as wasn't the mean of a variable.
 
So long as I was parsing through features.txt to find those, I also cleaned them up a bit to use as column names in Step 4.  The names in features.txt seemed pretty good to me, but punctuation doesn't work well in column names, so I stripped out parens and commas using gsub.

It was then easier to apply the column names first (completing Step 4) in order to use select on the column names to select the columns which contained mean or std but not meanFreq (which was the only way I saw mean used other than in -mean().)


Step 3
------

Apply descriptive activity names.  The activities are coded in y as numerical values in the range 1-6. The file activity_labels.txt maps those numbers to the name of the activity.  I read activity_labels.txt into an yt_meanings array and took advantage of the fact that yt_meanings[i,2] was the description that matched the number i.  I used this to make a vector y_desc containing the names instead of the numbers, and used rbind to attach it to the trimmed X (X_trimmed).  This was reasonable because the order of the rows had not been changed for either X or y.  At this point we have all the data we're interested in, in a single data frame.

Step 4
------

Apply meaningful column names: already done as part of Step 2.

Step 5
------

Make a tidy data set containing the mean of the variables, for each subject_id, activity, and variable in our selected list.  For this I melted the data.  It was now a large tidy data set of all the observations.  I then grouped by subject_id, activity, and variable so that I could summarize with mean(value) for all rows matching a given (subject_id, activity, and variable) triplet.  This gave me a smaller data set with the forth column mean(value).  I believe this is tidy because it consists of 3 id variables (subject_id, activity, and variable from the original set) and 1 measurement variable (the mean of the observations of the given variable for that subject during that activity.)

 

