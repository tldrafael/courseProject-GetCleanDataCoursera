**The Data:**

The raw dataset is the join of the test files (test\X_test.txt, test\y_test.txt, test\subject_test.txt)  and the train files (test\X_train.txt, test\y_train.txt, test\subject_train.txt).

  * the X_*.txt file represents the features observartions
  * the y_*.txt file represents the activity values of each observation
  * the subject_*.txt represents the volunteers represented in each observation

There's two more file auxiliary file from the data downloaded
  * the features.txt contains the names of each feature represented by the columns of the data.
  * the activity_labels.txt contains the label of the activity value.


**The Variables:**

The row variables are the subject and the activity label. The subject is scoped between 1 and 30, each number denotes a volunteer; The activity label presents six variables (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING).

The column variables are signs colected on activities like *tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyAccMag and others* estimated with statistic metrics *mean() "Mean value", std() "Standard deviation", mad() "Median absolute deviation", max() "Largest value in array" and others*.

To the tidy data the only statistic metrics important are the mean and the standard deviation.

**The Transformations:**

Important notes:

  1. to merge the data are used *rbind* and *cbind* functions.
  2. to filter the column measurements is used the *grep* function, which indicates where is the desired fields.
  3. the activity labels replaces the values of the activity column on dataset with a *for loop*.
 



