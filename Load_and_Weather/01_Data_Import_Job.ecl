IMPORT Constants;
IMPORT STD;

STD.File.SprayDelimited(Constants.server_address,
       Constants.load_lz_file_path,
       ,,,, 
       'mythor',
       Constants.load_raw_file_path,
       -1,
       'http://' + Constants.server_address + ':8010/FileSpray',,TRUE);

STD.File.SprayDelimited(Constants.server_address,
       Constants.weather_lz_file_path,
       ,,,, 
       'mythor',
       Constants.weather_raw_file_path,
       -1,
       'http://' + Constants.server_address + ':8010/FileSpray',,TRUE);