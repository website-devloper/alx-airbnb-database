
SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name;







SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY property_rank;


SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY property_rank;



