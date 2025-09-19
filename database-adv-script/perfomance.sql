Initial query: fetch all booking info with user, property, and payment details
SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    b.guests,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id;






EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id;
