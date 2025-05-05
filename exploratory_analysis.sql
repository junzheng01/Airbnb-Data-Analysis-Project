-- Basic statistics
SELECT 
    COUNT(DISTINCT host_id) as total_hosts,
    COUNT(DISTINCT neighborhood_id) as neighborhoods,
    AVG(price) as avg_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) as median_price
FROM listings;

-- Price distribution by room type
SELECT 
    room_type,
    MIN(price) as min_price,
    AVG(price) as avg_price,
    MAX(price) as max_price
FROM listings
GROUP BY room_type;

-- Top 10 most reviewed listings
SELECT 
    listing_id,
    name,
    number_of_reviews,
    reviews_per_month
FROM listings
ORDER BY number_of_reviews DESC
LIMIT 10;
