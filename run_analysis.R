library(dplyr)
library(stringr)
library(data.table)

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

##Create a data frame for activities
activities <- scan("UCI HAR Dataset/activity_labels.txt", what="", sep="\n") %>% 
                    str_trim %>% 
                    str_split("[[:space:]]+")

activities_df <- data.frame(matrix(unlist(activities), nrow=6, byrow=T))

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



##Combine training and test data frames
all_data_df <- rbind(training_df, test_df)

##Summmarize as means for all the variables, grouped by subject and activity
tidy_data_set <- all_data_df %>% group_by(Subject,Activity) %>% summarize_all(funs(mean))
