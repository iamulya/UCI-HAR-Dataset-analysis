# UCI-HAR-Dataset-analysis
Files in this repo:
* README.md - Explanation of the analysis 
* Codebook.md - Contains all the variables and summaries calculated, along with units, and any other relevant information.
* run_analysis.R - R code for analysis

Libraries used:
* dplyr
* stringr
* data.table

Analysis plan:
* At first the features are read in and and filtered out based on the following criteria. 
  * Features need to be descriptive.
  * Only the ones pertaining to mean and sort should be included
  * Make the filtered features available as their names and index
  

```R
## Filter out the features. Features need to be descriptive and only the ones pertaining to 
## mean and sort should be included
featuresIndex <- numeric()
featuresNames <- character()

#helper function to filter the features
filterFeatures <- function(x) {
    if(grepl("mean|std",x[2]) == TRUE) {
        featuresIndex <<- c(featuresIndex, as.numeric(x[1]))
        
        name <- x[2]
        name <- sub("-X", " in x", name)
        name <- sub("-Y", " in y", name)
        name <- sub("-Z", " in z", name)
        name <- sub("meanFreq", "mean frequency", name)
        name <- gsub("[()]", "", name)
        name <- gsub("-", " ", name)
        
        featuresNames <<- c(featuresNames, name)
    }
}

scan("UCI HAR Dataset/features.txt", what="", sep="\n") %>% 
                    str_split("[[:space:]]+") %>%
                    lapply(filterFeatures)
```
  
  Function filterFeatures() is used as a helper function to achieve this.
* Read in the activities labels and store it in a data frame
```R
##Create a data frame for activities
activities <- scan("UCI HAR Dataset/activity_labels.txt", what="", sep="\n") %>% 
                    str_trim %>% 
                    str_split("[[:space:]]+")

activities_df <- data.frame(matrix(unlist(activities), nrow=6, byrow=T))
```
* Prepare the training data as follows:
  * Read in the training data and filter out the unwanted variables using feature index
  * Read in the activity training data and map to the label(using getLabel())
  * Read in the subject training data
  * Merge training, activity and subject data to form the complete training data frame
  
```R
#Helper function to get the Activity string
getLabel <- function(code) {
    act <- activities_df %>% filter(X1 == code) %>% select(X2)
    lbl = as.character(act$X2)[1]
    gsub("_", " ", lbl)
}

##Prepare the training data - as data frame

training_data <- scan("UCI HAR Dataset/train/X_train.txt", what="", sep="\n") %>% 
                    str_trim %>% 
                    str_split("[[:space:]]+") %>% 
                    lapply(`[`, featuresIndex) %>%
                    lapply(as.numeric)

activities_train <- scan("UCI HAR Dataset/train/y_train.txt", what="", sep="\n") %>% 
                    lapply(getLabel)

subject_train <- scan("UCI HAR Dataset/train/subject_train.txt", what="", sep="\n") %>%
                    lapply(as.numeric)

subject_train_df <- data.frame(matrix(unlist(subject_train), nrow=length(subject_train), byrow=T))

colnames(subject_train_df) <- "Subject"

training_data_df <- data.frame(matrix(unlist(training_data), nrow=length(training_data), byrow=T))

colnames(training_data_df) <- featuresNames

activities_train_df <- data.frame(matrix(unlist(activities_train), nrow=length(activities_train), byrow=T))

colnames(activities_train_df) <- "Activity"

training_df <- cbind(training_data_df, subject_train_df, activities_train_df)



```
* Prepare the test data as follows:
  * Read in the test data and filter out the unwanted variables using feature index
  * Read in the activity test data and map to the label(using getLabel())
  * Read in the subject test data
  * Merge test, activity and subject data to form the complete test data frame  
  
```R
##Prepare the test data - as data frame

test_data <- scan("UCI HAR Dataset/test/X_test.txt", what="", sep="\n") %>% 
                    str_trim %>% 
                    str_split("[[:space:]]+") %>% 
                    lapply(`[`, featuresIndex) %>%
                    lapply(as.numeric)

activities_test <- scan("UCI HAR Dataset/test/y_test.txt", what="", sep="\n") %>% 
                    lapply(getLabel)

subject_test <- scan("UCI HAR Dataset/test/subject_test.txt", what="", sep="\n") %>%
                    lapply(as.numeric)

subject_test_df <- data.frame(matrix(unlist(subject_test), nrow=length(subject_test), byrow=T))

colnames(subject_test_df) <- "Subject"

test_data_df <- data.frame(matrix(unlist(test_data), nrow=length(test_data), byrow=T))

colnames(test_data_df) <- featuresNames

activities_test_df <- data.frame(matrix(unlist(activities_test), nrow=length(activities_test), byrow=T))

colnames(activities_test_df) <- "Activity"

test_df <- cbind(test_data_df, subject_test_df, activities_test_df)

```

* Merge the training and test data frame into a data frame with complete data

```R
##Combine training and test data frames
all_data_df <- rbind(training_df, test_df)
```
* Create another data set out of the generated data set by grouping over subject and activity and taking means of all variables.

```R
##Summmarize as means for all the variables, grouped by subject and activity
tidy_data_set <- all_data_df %>% group_by(Subject,Activity) %>% summarize_all(funs(mean))
```
* The resulting data set has one observation per row and one variable per column, one observational unit in a table, hence fulfilling the requirements of a tidy data set.
