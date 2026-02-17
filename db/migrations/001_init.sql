CREATE TABLE IF NOT EXISTS weather_observations (
  id BIGSERIAL PRIMARY KEY,

  location TEXT NOT NULL,

  observed_at TIMESTAMPTZ NOT NULL,
  ingested_at TIMESTAMPTZ NOT NULL DEFAULT now(),

  temp_c REAL,
  feelslike_c REAL,
  humidity SMALLINT,
  pressure_mb REAL,
  precip_mm REAL,

  wind_kph REAL,
  wind_degree SMALLINT,
  wind_dir TEXT,
  gust_kph REAL,

  cloud SMALLINT,
  uv REAL,
  vis_km REAL,

  is_day SMALLINT,

  condition_text TEXT,
  condition_code INTEGER,
  condition_icon TEXT,

  raw JSONB,

  UNIQUE (location, observed_at)
);

CREATE INDEX IF NOT EXISTS idx_weather_obs_location_time
ON weather_observations (location, observed_at DESC);