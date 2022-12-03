IMPORT STD;
IMPORT Constants;
IMPORT Weather;
IMPORT Load;

Weather.weather_enrich_layout enrich_weather(Weather.weather_clean_layout clean) := TRANSFORM
    SELF := clean;
    SELF.day_of_week := STD.Date.DayOfWeek(SELF.date);
END;

enriched_weather := PROJECT(Weather.weather_clean_ds, enrich_weather(LEFT));

Load.load_enrich_layout enrich_load(Load.load_clean_layout clean) := TRANSFORM
    SELF := clean;
    SELF.day_of_week := STD.Date.DayOfWeek(SELF.date);
END;

enriched_load := PROJECT(Load.load_clean_ds, enrich_load(LEFT));

OUTPUT(enriched_weather,,Constants.weather_enrich_file_path, THOR, COMPRESSED, OVERWRITE);
OUTPUT(enriched_load,,Constants.load_enrich_file_path, THOR, COMPRESSED, OVERWRITE);