-- Top performing hosts
SELECT 
    h.host_id,
    h.host_name,
    COUNT(l.listing_id) as listing_count,
    AVG(l.price) as avg_price,
    SUM(l.price * l.availability_365) as estimated_revenue
FROM listings l
JOIN hosts h ON l.host_id = h.host_id
GROUP BY h.host_id, h.host_name
ORDER BY estimated_revenue DESC
LIMIT 20;

-- Host growth 
SELECT 
    DATE_TRUNC('year', host_since) as year,
    COUNT(host_id) as new_hosts
FROM hosts
WHERE host_since IS NOT NULL
GROUP BY year
ORDER BY year;
