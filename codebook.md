Codebook for run\_analysis.R
================

This codebook describes the analysis performed for the course project
for the course *Getting and Cleaning Data* from the John Hopkins
University on Coursera. The analysis can be found in run\_analysis.R.
Please read the README.Rmd which explains the orginal data used in this
project and the purpose of this project.

The assignment is divided into five steps which are mirrored in the
analysis script. An additional step is performed to pre-process the
data.

#### Step 0: Libraries and downloading

Here, the necessary libraries are loaded and the data set is downloaded
from
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
The scripts checks if the file is already downloaded and unzipped.

#### Step 1: Reading and combining

The original data set contains a training and a test set. In this step,
both data are read and combined to one data set. The original data comes
with different files needed for the further analysis:

  - *activity\_labels.txt* — linking (numeric) activities labels with
    their names. Dimension: 6 x x 2.

  - *features.txt* — linking (numeric) feature (i.e., variables) labels
    with their names. Dimension: 561 x 2.

  - *\[train|test\]/X\_\[train|test\].txt* — the actual data set
    containing aggregated features (i.e., variables) from the raw data
    set. \[train|test\] means either train or test, i.e.,
    train/X\_train.txt and test/X\_test.txt. Dimension: 7352 x 561
    (train/X\_train.txt) and 2947 x 561 (test/X\_test.txt).

  - *\[train|test\]/y\_\[train|test\].txt* — activities labels for
    X\_\[train|test\].txt. Dimension: 7352 x 2 (train/y\_train.txt) and
    2947 x 2 (test/y\_test.txt)

  - *\[train|test\]/subject\_\[train|test\].txt* — subject labels
    indicating who performed the activity. Dimension: 7352 x 2
    (train/subject\_train.txt) and 2947 x 2 (test/subject\_test.txt)

In this step, the data are read. First, the features, subjects and
activities labels are combined for the training and test data
separately. Hence, two data frame are created `data_test` and
`data_training`. In a second step, those both data frames are combined
(i.e., via `rbind`) to one big data set `data_TestAndTraining`.
Additonally, unnecessary data is deleted to free space.

#### Step 2: Extracting variables

Here, only features (i.e., variables) aggregated by mean or standard
deviation are extracted. A regular expression is performed looking for
either `-mean()` or `-std()` in the column names. The resulting columns
(and the columns Subject and Activity) are extracted and stored in the
data frame `MeanStd_TestAndTraining`.

#### Step 3: Renaming activities

In this step, the activity column is linked to the activity labels. A
factor containing the names of the activities is created and returned to
the data frame. Hence, now the actitivty column shows no longer numbers,
but names the actual activity (e.g., WALKING, SITTING).

#### Step 4: Renaming variables

Here, the variables (i.e., column) names are renamed to more descriptive
names. First, the variables names are converted to CamelCase (using the
rapportools-library). Secondly, a leading t describes that the variable
is derived in time, hence, it is expaned to Time. Similarly, a leading f
indicate a frequency domain signal and is expanded to Frequency. E.g,
`tBodyAcc-mean()-Y` is converted to `TimeBodyAccMeanY` and
`fBodyGyro-std()-Z` is converted to `FrequencyBodyGyroStdZ`.

#### Step 5: Creating a tidied data set

In this step, a tidied data set is created. For each activity and
subject the features (i.e., variables) are averaged creating a 180 x 68
data frame. First, the data is grouped by subject and activity and then
each variable is averaged according to the aforemtioned groups. This
step uses the dplyr-library. Finally, the created data is written to a
file (`AveragedDataset_Step5.txt`). To read this data set, use
`read.tables('AveragedDataset_Step5.txt')`.
