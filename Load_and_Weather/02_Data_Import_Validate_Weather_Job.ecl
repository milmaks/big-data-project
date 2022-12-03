IMPORT STD;
IMPORT Constants;
IMPORT Weather;

weather_raw_ds := DATASET(Constants.weather_raw_file_path, Weather.weather_raw_layout, CSV(HEADING(1)));

OUTPUT(STD.File.GetLogicalFileAttribute(Constants.weather_raw_file_path,'size'),NAMED('Weather_File_Size'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.weather_raw_file_path,'clusterName'),NAMED('Weather_Cluster_Name'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.weather_raw_file_path,'directory'),NAMED('Weather_Directory'));
OUTPUT(STD.File.GetLogicalFileAttribute(Constants.weather_raw_file_path,'numparts'),NAMED('Weather_Data_Parts'));

OUTPUT(weather_raw_ds,,NAMED('Raw_Weather_Data'));