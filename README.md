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
  
  Function filterFeatures() is used as a helper function to achieve this.
* Read in the activities labels and store it in a data frame
* Prepare the training data as follows:
  * Read in the training data and filter out the unwanted variables using feature index
  * Read in the activity training data and map to the label(using getLabel())
  * Read in the subject training data
  * Merge training, activity and subject data to form the complete training data frame
* Prepare the test data as follows:
  * Read in the test data and filter out the unwanted variables using feature index
  * Read in the activity test data and map to the label(using getLabel())
  * Read in the subject test data
  * Merge test, activity and subject data to form the complete test data frame  
* Merge the training and test data frame into a data frame with complete data
* Create another data set out of the generated data set by grouping over subject and activity and taking means of all variables.
* The resulting data set has one observation per row and one variable per column, one observational unit in a table, hence fulfilling the requirements of a tidy data set.
