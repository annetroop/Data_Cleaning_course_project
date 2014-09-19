How my run_analysis.R works
===========================

Step 1
------
It reads in the X and Y files from train
and from test
row binds the X test and X train together
row binds the Y test and Y train together 

Then we have one big X and one big Y of the total number of rows and the same number of columns as the original.

I then column bind the subject_id to the left so that we can keep track of that, and the Y to the right of the X so that we have everything in a single data frame.