-- partitioning.sql

-- Step 0: Optional: Drop the partitioned table if it exists
DROP TABLE IF EXISTS booking_partitioned;

-- Step 1: Create a partitioned table
CREATE TABLE booking_partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    guests INT,
    total_price DECIMAL(10,2),
    status VARCHAR(20),
    PRIMARY KEY (booking_id, check_in)
)
PARTITION BY RANGE (YEAR(check_in)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pMax VALUES LESS THAN MAXVALUE
);

-- Step 2: Insert existing data from Booking table
INSERT INTO booking_partitioned
SELECT * FROM booking;

-- Step 3: Test performance: fetch bookings for 2025
EXPLAIN ANALYZE
SELECT *
FROM booking_partitioned
WHERE check_in BETWEEN '2025-01-01' AND '2025-12-31';

-- Step 4: Test performance: fetch bookings for a user in June 2025
EXPLAIN ANALYZE
SELECT *
FROM booking_partitioned
WHERE user_id = 101
AND check_in BETWEEN '2025-06-01' AND '2025-06-30';

