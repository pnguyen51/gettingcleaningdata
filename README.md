# Course Project

Run ```run_analysis.R``` in the ```UCI HAR Dataset``` folder

-```features.txt``` is read in, feature names are modified for readability, and the indices of the columns of interest are extracted and stored in ```meanSDFeatures```.

-```train/X_train.txt``` and ```test/X_test.txt``` are read in, and the relevant columns are extracted using the indices in ```meanSDFeatures```. The data sets are merged and stored in ```xData```.

-```activityLabels.txt``` is read in, activity names are modified for readability, and results are stored in ```activityLabels```.

-```train/X_train.txt``` and ```test/X_test.txt``` are read in, and numbers are replaced with corresponding strings from ```activityLabels```. The data sets are merged and stored in ```yData```.

-```train\subjectTrain.txt``` and ```test\subjectTest.txt``` are read in, merged, and stored in ```subjectData```

-```tidyData``` is created from ```xData``` by using ```yData``` and ```subjectData``` to subset the dataframe and compute column statistics.