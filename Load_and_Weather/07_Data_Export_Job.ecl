IMPORT STD;
IMPORT Constants;
IMPORT Load;
IMPORT Weather;

combined_ds := DATASET(Constants.combined_data_file_path, Constants.combined_layout, THOR); 
OUTPUT(combined_ds,, Constants.combined_data_csv_file_path, CSV, OVERWRITE);

STD.File.DeSpray(Constants.combined_data_file_path,
    Constants.server_address,
    Constants.combined_data_lz_file_path,
    -1,
    'http://' + Constants.server_address + ':8010/FileSpray');