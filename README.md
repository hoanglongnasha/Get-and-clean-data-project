# Get and clean data project





## **Code Explanation**
Please **download everything in the repository including the dataset folder**, or alternatively, you can **put the analysis.R file into the same folder as the dataset folder already unzipped** as in the repository.

The run_analysis.R script requires dplyr package and it will check at the beginning before moving on. If the dplyr package hasn't been loaded or downloaded yet, the script will automatically download and load the package for you.

### **Load activity labels and feature names**
=====================================================

Activity labels and Features will be loaded as character first. They will then be renamed as deemed appropriate. Data for these 2 will be stored in `activity` object and `features` object.


### **Load data set for training and test**
======================================================

Data for training will be loaded next, into 3 following objects: `x_train`, `y_train` and `subject_train`. They are then combined to make one data set for training data called `train_joint`. The same procedure applies to the test data, creating `x_test`, `y_test`, and `subject_test` objects then combining them into one data frame object `test_joint`.


### **Combining and filter the dataset**
=======================================================

The two data frames `train_joint` and `test_joint` are then combined into one to create a full set of data called `joint_dat`. Column names are set afterward according to their respective orders: subject, activity, and then feature names. Data of variables containing `mean` and `std` will be extracted from `joint_dat` to create `sort_dat`. 

