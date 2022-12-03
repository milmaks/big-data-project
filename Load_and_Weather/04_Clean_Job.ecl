IMPORT STD;
IMPORT Constants;
IMPORT Load;
IMPORT Weather;

Load.load_clean_layout clean_load(Load.load_raw_layout raw) := TRANSFORM
    SELF.date := STD.Date.FromStringToDate(raw.date, '%m/%d/%Y');
    SELF.time_from := Std.Date.FromStringToTime(raw.time_from, '%H:%M');
    SELF.time_to := Std.Date.FromStringToTime(raw.time_to, '%H:%M');
    SELF.load := (UNSIGNED3)raw.load;
END;

cleaned_load := PROJECT(Load.load_raw_ds, clean_load(LEFT));

Weather.weather_clean_layout clean_weather(Weather.weather_raw_layout raw) := TRANSFORM
    SELF.date := STD.Date.FromStringToDate(raw.local_time[..10], '%d.%m.%Y');
    SELF.time := STD.Date.FromStringToTime(raw.local_time[12..], '%H:%M');
    SELF.temperature := (REAL4)raw.temperature;
    SELF.atmospheric_pressure := (REAL4)raw.atmospheric_pressure;
    SELF.relative_humidity := (UNSIGNED2)raw.relative_humidity;
    SELF.wind_speed := (UNSIGNED1)raw.mean_wind_speed;
    SELF.wind_direction := IF(SELF.wind_speed > 0, raw.mean_wind_direction[22..], 'no-wind');
END;

cleaned_weather := PROJECT(Weather.weather_raw_ds, clean_weather(LEFT));

OUTPUT(cleaned_load,,Constants.load_clean_file_path, THOR, COMPRESSED, OVERWRITE);
OUTPUT(cleaned_weather,,Constants.weather_clean_file_path, THOR, COMPRESSED, OVERWRITE);
