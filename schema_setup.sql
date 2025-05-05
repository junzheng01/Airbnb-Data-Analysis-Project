-- Create tables for normalized schema
CREATE TABLE neighborhoods (
    neighborhood_id SERIAL PRIMARY KEY,
    neighborhood_name VARCHAR(100) UNIQUE,
    borough VARCHAR(50)
);

CREATE TABLE hosts (
    host_id VARCHAR(20) PRIMARY KEY,
    host_name VARCHAR(100),
    host_since DATE,
    host_response_time VARCHAR(50),
    host_response_rate VARCHAR(10),
    host_is_superhost BOOLEAN
);

CREATE TABLE listings (
    listing_id VARCHAR(20) PRIMARY KEY,
    name TEXT,
    host_id VARCHAR(20) REFERENCES hosts(host_id),
    neighborhood_id INTEGER REFERENCES neighborhoods(neighborhood_id),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    room_type VARCHAR(50),
    price DECIMAL(10, 2),
    minimum_nights INTEGER,
    number_of_reviews INTEGER,
    last_review DATE,
    reviews_per_month DECIMAL(4, 2),
    availability_365 INTEGER
);
