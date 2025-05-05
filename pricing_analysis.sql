-- Price premium for superhosts
WITH host_stats AS (
    SELECT 
        h.host_is_superhost,
        AVG(l.price) as avg_price,
        COUNT(l.listing_id) as listing_count
    FROM listings l
    JOIN hosts h ON l.host_id = h.host_id
    GROUP BY h.host_is_superhost
)
SELECT * FROM host_stats;

-- Neighborhood comparison
SELECT 
    n.neighborhood_name,
    n.borough,
    COUNT(l.listing_id) as listing_count,
    AVG(l.price) as avg_price,
    SUM(l.price * l.availability_365) as estimated_revenue
FROM listings l
JOIN neighborhoods n ON l.neighborhood_id = n.neighborhood_id
GROUP BY n.neighborhood_name, n.borough
HAVING COUNT(l.listing_id) > 50
ORDER BY avg_price DESC
LIMIT 10;
