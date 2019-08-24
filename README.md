# Get and clean data project
This is the submission by **Pham Phu Chau** _(hoanglongnasha)_ for the Project in Week 4 of Getting and Cleaning Data course by Johns Hopkins University offered on coursera.org. The aim of this project is to produce a tidy data set from the original data set on [_Human Activity Recognition Using Smartphones_](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## **Files content**
1. `README.md`: explain the project, files content and code explanation
2. `CodeBook.md`: a detailed description on the variables created while running the script
3. `run_analysis.R`: the script to clean and tidy the data set
4. `tidydataset.txt`: the cleaned and tidied data set 

## **Code Explanation**
Please **download everything in the repository including the dataset folder**, or alternatively, you can **put the analysis.R file into the same folder as the dataset folder already unzipped** as in the repository.

The run_analysis.R script requires dplyr package and it will check at the beginning before moving on. If the dplyr package hasn't been loaded or downloaded yet, the script will automatically download and load the package for you. The version of the dplyr package used in the script is `0.8.3`.

### **Load activity labels and feature names**
=====================================================

Activity labels and Features will be loaded as character first. They will then be renamed as deemed appropriate. Data for these 2 will be stored in `activity` object and `features` object.


### **Load data for training and test**
======================================================

Data for training will be loaded next, into 3 following objects: `x_train`, `y_train` and `subject_train`. They are then combined to make one data set for training data called `train_joint`. The same procedure applies to the test data, creating `x_test`, `y_test`, and `subject_test` objects then combining them into one data frame object `test_joint`.


### **Combining and filter the dataset**
=======================================================

The two data frames `train_joint` and `test_joint` are then combined into one to create a full set of data called `joint_dat`. Column names are set afterward according to their respective orders: subject, activity, and then feature names. Data of variables containing `mean` and `std` will be extracted from `joint_dat` to create `sort_dat`. 

### **Renaming variables**
========================================================

The column names are then renamed to make them more descriptive, i.e. from `tBodyAcc-mean-X` to `TimeBodyAccelerometer-mean-X`.

### **Summarise the dataset**
========================================================

The last bit of code from line 41 to line 54 will summarise the data set, i.e. finding the mean for each variable by subject and activity. This requires some knowledge in `quosure` to understand. Please refer to the vignette `Programming with dplyr` by using the code `vignette("programming", package = "dplyr")` for more information.
The 3 final lines of code of the script are commented out. If you want to reproduce the `tidydataset.txt`, please feel free to uncomment them.

