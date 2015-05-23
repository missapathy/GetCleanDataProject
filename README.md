For this project, we combined two data sets from the Human Activity Recognition database. These data sets contained the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. 30% of the subjects were selected to generate test data (contained in the first data set), 70% of the subjects were selected to generate training data (contained in the second data set). Once these data sets were combined, we found the mean of each variable for each subject and activity. Before applying the mean, the variables were normalized and bounded between [-1, 1].

More information can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

STEPS:
1. Import the needed labels. Having the right number of labels and determining the position of relevant columns will make importing the data faster and use less memory. When the labels are imported from the features.txt file, the imported list has twice as many items as necessary -- column number and title are seperate items, so we remove the numbers but leave the text labels. Next, we determine and make a list of the positions in the list of the labels (and thus the columns in our data) that we want, namely those of the mean and standard deviation.
2. Next, we import the data and add our labels vector as the header for both the test and the train data frames. We remove unnecessary columns using the subset function and our vector of the position of necessary columns.
3. We import the coded subject and then add the subject data each to a column at the front of the test and train data frames. 
4. We import the activity data. It's original form is numbers 1-6, so we recode them to descriptive labels according to the codebook. Once they have been recoded, we add an activity column to the front of each data frame.
5. Add a dummy column at the front of each of the data frames to note whether train(1) or test(0). 
6. Now we merge the two data frames into one data frame, with the test rows at the top and the train rows appended to the bottom.
7. Finally, we make a new data frame with the means of each variable for each activity and subject. We do this using the ddply function in the plyr package. We also change the column names to reflect that they are now means.

The resulting data is tidy, meaning that there are headings for each column, all variables are in different columns, and no column is duplicated.

VARIABLE NAMES:
1. "Subject"
      This variable contains the subject indicator. Each subject was assigned a unique number between 1 and 30.  
2. "Activity" 
      This variable indicated the activity performed by the subject.
      There were six activities:
            Walking
            Walking_Upstairs
            Walking_Downstairs
            Sitting
            Standing
            Laying
3. "TestTrain"
      This variable indicates whether the subject was part of the testing group or the training group. 
      Testing group = 0
      Training group = 1

The remaining variables are means of normalized and bounded [-1, 1] variables.
4. "mean_tBodyAcc-mean()-X"
5. "mean_tBodyAcc-mean()-Y"
6. "mean_tBodyAcc-mean()-Z"          
7. "mean_tGravityAcc-mean()-X"
8. "mean_tGravityAcc-mean()-Y"
9. "mean_tGravityAcc-mean()-Z"       
10. "mean_tBodyAccJerk-mean()-X"
11. "mean_tBodyAccJerk-mean()-Y"
12. "mean_tBodyAccJerk-mean()-Z"      
13. "mean_tBodyGyro-mean()-X"
14. "mean_tBodyGyro-mean()-Y"
15. "mean_tBodyGyro-mean()-Z"         
16. "mean_tBodyGyroJerk-mean()-X"
17. "mean_tBodyGyroJerk-mean()-Y"
18. "mean_tBodyGyroJerk-mean()-Z"     
19. "mean_tBodyAccMag-mean()"
20. "mean_tGravityAccMag-mean()"
21. "mean_tBodyAccJerkMag-mean()"     
22. "mean_tBodyGyroMag-mean()"
23. "mean_tBodyGyroJerkMag-mean()"
24. "mean_fBodyAcc-mean()-X"          
25. "mean_fBodyAcc-mean()-Y"
26. "mean_fBodyAcc-mean()-Z"
27. "mean_fBodyAccJerk-mean()-X"      
28. "mean_fBodyAccJerk-mean()-Y"
29. "mean_fBodyAccJerk-mean()-Z"
30. "mean_fBodyGyro-mean()-X"         
31. "mean_fBodyGyro-mean()-Y"
32. "mean_fBodyGyro-mean()-Z"
33. "mean_fBodyAccMag-mean()"         
34. "mean_fBodyBodyAccJerkMag-mean()"
35. "mean_fBodyBodyGyroMag-mean()"
36. "mean_fBodyBodyGyroJerkMag-mean()"
37. "mean_tBodyAcc-std()-X"
38. "mean_tBodyAcc-std()-Y"
39. "mean_tBodyAcc-std()-Z"           
40. "mean_tGravityAcc-std()-X"
41. "mean_tGravityAcc-std()-Y"
42. "mean_tGravityAcc-std()-Z"        
43. "mean_tBodyAccJerk-std()-X"
44. "mean_tBodyAccJerk-std()-Y"
45. "mean_tBodyAccJerk-std()-Z"       
46. "mean_tBodyGyro-std()-X"
47. "mean_tBodyGyro-std()-Y"
48. "mean_tBodyGyro-std()-Z"          
49. "mean_tBodyGyroJerk-std()-X"
50. "mean_tBodyGyroJerk-std()-Y"
51. "mean_tBodyGyroJerk-std()-Z"      
52. "mean_tBodyAccMag-std()"
53. "mean_tGravityAccMag-std()"
54. "mean_tBodyAccJerkMag-std()"      
55. "mean_tBodyGyroMag-std()"
56. "mean_tBodyGyroJerkMag-std()"
57. "mean_fBodyAcc-std()-X"           
58. "mean_fBodyAcc-std()-Y"
59. "mean_fBodyAcc-std()-Z"
60. "mean_fBodyAccJerk-std()-X"       
61. "mean_fBodyAccJerk-std()-Y"
62. "mean_fBodyAccJerk-std()-Z"
63. "mean_fBodyGyro-std()-X"          
64. "mean_fBodyGyro-std()-Y"
65. "mean_fBodyGyro-std()-Z"
66. "mean_fBodyAccMag-std()"          
67. "mean_fBodyBodyAccJerkMag-std()"
68. "mean_fBodyBodyGyroMag-std()"
69. "mean_fBodyBodyGyroJerkMag-std()" 
> 