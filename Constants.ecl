EXPORT Constants := MODULE
    IMPORT STD;

    EXPORT server_address := '192.168.56.101';
    EXPORT file_scope := '~projekat-samples';
    EXPORT project_scope := 'load-and-weather';
    EXPORT in_files_scope := 'in';
    EXPORT out_files_scope := 'out';

    EXPORT load_lz_file_path := '/var/lib/HPCCSystems/mydropzone/load_data.csv';
    EXPORT weather_lz_file_path := '/var/lib/HPCCSystems/mydropzone/weather_data.csv';

    EXPORT load_raw_file_path := file_scope + '::' + project_scope + '::' + in_files_scope + '::load.csv';
    EXPORT weather_raw_file_path := file_scope + '::' + project_scope + '::' + in_files_scope + '::weather.csv';

    EXPORT load_data_patterns_raw_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::load_raw_data_patterns.thor';
    EXPORT weather_data_patterns_raw_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::weather_raw_data_patterns.thor';

    EXPORT load_clean_file_path := file_scope + '::' + project_scope + '::' + out_files_scope + '::load_data_clean.thor';
    EXPORT weather_clean_file_path := file_scope + '::' + project_scope + '::' + out_files_scope + '::weather_data_clean.thor';

    EXPORT load_enrich_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::load_enriched.thor';
    EXPORT weather_enrich_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::weather_enriched.thor';

    EXPORT combined_data_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::combined_data.thor';

    EXPORT combined_layout := RECORD
        STD.Date.Date_t date;
        STD.Date.Time_t time;
        REAL4 temperature;
        UNSIGNED2 relative_humidity;
        UNSIGNED1 wind_speed;
        STRING37 wind_direction;
        UNSIGNED3 load;
    END;

    EXPORT combined_data_lz_file_path := '/var/lib/HPCCSystems/mydropzone/combined_data.csv';  
    EXPORT combined_data_csv_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::combined_data.csv';

    EXPORT show_data_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::show_data.thor';
    EXPORT show_data_lz_file_path := '/var/lib/HPCCSystems/mydropzone/show_data.csv';  
    EXPORT show_data_csv_file_path := file_scope + '::' + project_scope + '::' + out_files_scope +  '::show_data.csv';

   EXPORT main := '';
END;