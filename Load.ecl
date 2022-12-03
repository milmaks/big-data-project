EXPORT Load := MODULE
  IMPORT STD;
  IMPORT Constants;

    EXPORT load_raw_layout := RECORD
      STRING date;
      STRING time_from;
      STRING time_to;
      STRING load;
    END;

    EXPORT load_raw_ds := DATASET(Constants.load_raw_file_path, load_raw_layout, CSV(HEADING(1)));

    EXPORT load_clean_layout := RECORD
      STD.Date.Date_t date;
      STD.Date.Time_t time_from;
      STD.Date.Time_t time_to;
      UNSIGNED3 load;
    END;

    EXPORT load_clean_ds := DATASET(Constants.load_clean_file_path, load_clean_layout, THOR);

    EXPORT load_enrich_layout := RECORD
      load_clean_layout;

      UNSIGNED2 day_of_week;
    END;

    EXPORT load_enrich_ds := DATASET(Constants.load_enrich_file_path, load_enrich_layout, THOR);

  EXPORT main := '';
END;

