--
COPY neighborhoods(neighborhood_name, borough)
FROM '/data/raw/neighborhoods_clean.csv' DELIMITER ',' CSV HEADER;

-- Handle missing values
UPDATE listings 
SET reviews_per_month = 0 
WHERE reviews_per_month IS NULL;

-- Standardize prices (remove $ and convert to numeric)
UPDATE listings
SET price = CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS DECIMAL(10,2));
