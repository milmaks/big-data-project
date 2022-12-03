IMPORT STD;
IMPORT Constants;
IMPORT Weather;
IMPORT Load;

date := '01-01-2016';

date_to_search := STD.Date.FromStringToDate(date, '%d-%m-%Y');

Constants.combined_layout select_by_date(Constants.combined_layout colective_data) := TRANSFORM
    SELF.date := IF(colective_data.date = date_to_search, colective_data.date, SKIP);
    SELF.time := IF(colective_data.date = date_to_search, colective_data.time, SKIP);
    SELF.temperature := IF(colective_data.date = date_to_search, colective_data.temperature, SKIP);
    SELF.relative_humidity := IF(colective_data.date = date_to_search, colective_data.relative_humidity, SKIP);
    SELF.wind_speed := IF(colective_data.date = date_to_search, colective_data.wind_speed, SKIP);
    SELF.wind_direction := IF(colective_data.date = date_to_search, colective_data.wind_direction, SKIP);
    SELF.load := IF(colective_data.date = date_to_search, colective_data.load, SKIP);
END;

combined_ds := DATASET(Constants.combined_data_file_path, Constants.combined_layout, THOR); 
show_data := PROJECT(combined_ds, select_by_date(LEFT));

OUTPUT(show_data,,Constants.show_data_file_path,
        THOR, COMPRESSED, OVERWRITE); 
OUTPUT(show_data,, Constants.show_data_csv_file_path, CSV, OVERWRITE);

STD.File.DeSpray(Constants.show_data_file_path,
    Constants.server_address,
    Constants.show_data_lz_file_path,
    -1,
    'http://' + Constants.server_address + ':8010/FileSpray');