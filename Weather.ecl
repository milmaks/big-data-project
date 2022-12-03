EXPORT Weather := MODULE
  IMPORT STD;
  IMPORT Constants;

    EXPORT weather_raw_layout := RECORD
      STRING local_time;
      STRING temperature;
      STRING atmospheric_pressure;
      STRING P;
      STRING pressure_tendency;
      STRING relative_humidity;
      STRING mean_wind_direction;
      STRING mean_wind_speed;
      STRING ff10;
      STRING ff3;
      STRING N;
      STRING WW;
      STRING W1;
      STRING W2;
      STRING Tn;
      STRING Tx;
      STRING Cl;
      STRING Nh;
      STRING H;
      STRING Cm;
      STRING Ch;
      STRING VV;
      STRING Td;
      STRING RRR;
      STRING tR;
      STRING E;
      STRING Tg;
      STRING E1;
      STRING sss;
    END;

    EXPORT weather_raw_ds := DATASET(Constants.weather_raw_file_path, weather_raw_layout, CSV(HEADING(1)));

    EXPORT weather_clean_layout := RECORD
      STD.Date.Date_t date;
      STD.Date.Time_t time;
      REAL4 temperature;
      REAL4 atmospheric_pressure;
      UNSIGNED2 relative_humidity;
      UNSIGNED1 wind_speed;
      STRING37 wind_direction;
    END;

    EXPORT weather_clean_ds := DATASET(Constants.weather_clean_file_path, weather_clean_layout, THOR);

    EXPORT weather_enrich_layout := RECORD
      weather_clean_layout;

      UNSIGNED2 day_of_week;
    END;

    EXPORT weather_enrich_ds := DATASET(Constants.weather_enrich_file_path, weather_enrich_layout, THOR);

  EXPORT main := '';
END;