

EXPLAIN ANALYZE
SELECT * 
FROM booking b
JOIN user u ON b.user_id = u.user_id
WHERE b.check_in >= '2025-10-01';



CREATE INDEX idx_user_email ON user(email);

-- Booking table
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_check_in ON booking(check_in);
CREATE INDEX idx_booking_check_out ON booking(check_out);

-- Property table
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(price_per_night);


EXPLAIN ANALYZE
SELECT * 
FROM booking b
JOIN user u ON b.user_id = u.user_id
WHERE b.check_in >= '2025-10-01';

