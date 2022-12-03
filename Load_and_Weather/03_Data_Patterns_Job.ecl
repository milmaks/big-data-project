IMPORT Constants;
IMPORT DataPatterns;
IMPORT Load;
IMPORT Weather;

rawLoadData := Load.load_raw_ds;
OUTPUT(rawLoadData, NAMED('rawLoadDataSample'));

rawLoadProfileResults := DataPatterns.Profile(rawLoadData, 
             features := 'fill_rate,cardinality,best_ecl_types,lengths,patterns,modes');
OUTPUT(rawLoadProfileResults,, Constants.load_data_patterns_raw_file_path, OVERWRITE);

rawWeatherData := Weather.weather_raw_ds;
OUTPUT(rawWeatherData, NAMED('rawWeatherDataSample'));

rawWeatherProfileResults := DataPatterns.Profile(rawWeatherData, 
             features := 'fill_rate,cardinality,best_ecl_types,lengths,patterns,modes');
OUTPUT(rawWeatherProfileResults,, Constants.weather_data_patterns_raw_file_path, OVERWRITE);