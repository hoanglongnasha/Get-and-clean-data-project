# The Codebook

This codebook contains information about all the objects created in the making of the final `tidydataset.txt` dataset, listed in conjunction with the steps explained in `README.md`. 

### **Load activity labels and feature names**
=====================================================

1. `activity`: a character vector containing 6 elements describing the activities
2. `features`: a character vector containing 561 elements referring to the 561 variables measured for the data set

### **Load data for training and test**
======================================================

3. `x_train`: a (7352 x 561) data frame containing data of the variables of `features` for the training set
4. `x_test` : a (2947 x 561) data frame containing data of the variables of `features` for the test set
5. `y_train`: a (7352 x 1) data frame containing the index number of the activity for the training set
6. `y_test` : a (2947 x 1) data frame containing the index number of the activity for the test set
7. `subject_train`: a (7352 x 1) data frame containing the index number of the subject participated in the training
8. `subject_test` : a (2947 x 1) data frame containing the index number of the subject participated in the test
9. `train_joint`  : a (7352 x 563) data frame containing all data for the training data set
10. `test_joint`  : a (2947 x 563) data frame containing all data for the test data set

### **Combining and filter the dataset**
=======================================================

11. `joint_dat`: a (10299 x 563) data frame containing all data for both the training and test data set with variables' names
12. `sort_dat` : a (10299 x 81) tibble containing the data of the mean and standard deviation for each measurement

### **Summarise the dataset**
========================================================

13. `my_summary`: a custom function to summarize the data by group of subject and activity with custom ouput variable names
14. `summary`: a (180 x 81) data frame containing the calculated average of each variable for each activity and each subject
