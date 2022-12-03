IMPORT STD;
IMPORT Constants;
IMPORT Load;
IMPORT Weather;

combinedData := DENORMALIZE(
    Load.load_clean_ds, Weather.weather_clean_ds,
    (LEFT.date=RIGHT.date) AND (LEFT.time_from=RIGHT.time),
    GROUP,
    TRANSFORM(Constants.combined_layout,
    SELF.date := RIGHT.date,
    SELF.time := RIGHT.time,
    SELF.temperature := RIGHT.temperature,
    SELF.relative_humidity := RIGHT.relative_humidity,
    SELF.wind_speed := RIGHT.wind_speed,
    SELF.wind_direction := RIGHT.wind_direction,
    SELF.load := LEFT.load));

OUTPUT(combinedData,,Constants.combined_data_file_path,
        THOR, COMPRESSED, OVERWRITE); 