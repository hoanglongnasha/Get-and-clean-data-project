require(dplyr)

##Read and rename activity and features
activity <- readLines("UCI HAR Dataset/activity_labels.txt")
activity <- sub("[1-6] ", "", activity)
activity <- sub("_", " ", activity)
features <- readLines("UCI HAR Dataset/features.txt")
features <- sub("[1-9]?[0-9]?[0-9]? ", "", features)
features <- sub("\\()", "", features)

##Make a dataset for train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_joint <- subject_train %>% cbind(y_train, x_train) 

##Make a dataset for test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_joint <- subject_test %>% cbind(y_test, x_test) 

##Combine 2 dataset into one, rename, and filter for mean & std
joint_dat <- as.data.frame(Map(c, test_joint, train_joint))
names(joint_dat) <- c("subject", "activity", features)
for(i in 1:nrow(joint_dat)) {
    num <- as.numeric(joint_dat[i,2])
    joint_dat[i,2] <- activity[num]
}
sort_dat <- tbl_df(joint_dat[c(1:2,grep("mean|std", names(joint_dat)))])

##Rename the variables
temp <- sub("^t", "Time", names(sort_dat))
temp <- sub("^f", "Fourier", temp)
temp <- sub("Acc", "Accelerometer", temp)
temp <- sub("Gyro", "Gyrometer", temp)
temp <- sub("Mag", "Magnitude", temp)
names(sort_dat) <- temp

##Summarise the dataset
summary <- data.frame()
my_summary <- function(x) {
    mean_grp <- paste("Average of", names(sort_dat)[x])
    expr <- sym(names(sort_dat)[x])
    summary <<- sort_dat %>%
        group_by(subject, activity) %>%
        summarise(!! mean_grp := mean(!! expr))
    return(summary)
}

for(i in 3:length(sort_dat)) {
    if(i == 3) my_summary(i)
    else summary <- cbind(as.data.frame(summary), my_summary(i)[,3])
}

View(summary) 

##The last line of this script will write the table and output the data set as text file
##write.table(summary, file = "tidydataset.txt", row.names = FALSE)
##To read the data set, use command `read.table("tidydataset.txt", header = TRUE)`