1️⃣ Identify high-usage columns

Think about which columns are frequently used in queries:

Table	High-usage columns
User	user_id (JOIN with Booking), email (WHERE search)
Booking	booking_id (primary), user_id (JOIN), property_id (JOIN), check_in / check_out (WHERE, ORDER BY)
Property	property_id (JOIN), location (WHERE search), price_per_night (WHERE, ORDER BY)

These are the best candidates for indexing.

2️⃣ Create indexes

Save the following in database_index.sql:

-- User table
CREATE INDEX idx_user_email ON user(email);

-- Booking table
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_check_in ON booking(check_in);
CREATE INDEX idx_booking_check_out ON booking(check_out);

-- Property table
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(price_per_night);


✅ Notes:

Primary keys (user_id, booking_id, property_id) are already indexed automatically.

Use single-column indexes for columns frequently used in WHERE or JOIN.

If queries filter on multiple columns together often, consider composite indexes.

3️⃣ Measure query performance

Before creating indexes:

EXPLAIN SELECT * 
FROM booking b 
JOIN user u ON b.user_id = u.user_id 
WHERE b.check_in >= '2025-10-01';


After creating indexes:

EXPLAIN SELECT * 
FROM booking b 
JOIN user u ON b.user_id = u.user_id 
WHERE b.check_in >= '2025-10-01';
