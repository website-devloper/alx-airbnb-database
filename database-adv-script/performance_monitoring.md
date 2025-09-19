-- Example: fetch bookings for 2025 with user details
EXPLAIN ANALYZE
SELECT b.booking_id, b.check_in, b.check_out,
       u.user_id, u.name AS user_name
FROM booking b
JOIN user u ON b.user_id = u.user_id
WHERE b.check_in BETWEEN '2025-01-01' AND '2025-12-31';




   -- Enable profiling
SET profiling = 1;

-- Run a query
SELECT * FROM booking WHERE check_in >= '2025-01-01';

-- Show profile
SHOW PROFILE FOR QUERY 1;




-- Indexes
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_check_in ON booking(check_in);
CREATE INDEX idx_payment_booking ON payment(booking_id);



# Database Performance Monitoring Report

## Objective
Continuously monitor and refine query performance using EXPLAIN ANALYZE and profiling.

## Queries Monitored
1. Fetch bookings by date range with user details
2. Fetch bookings by property with payment details
3. Count bookings per user

## Observed Bottlenecks
- Full table scans on booking table
- Joins on unindexed columns
- Filters on `check_in` were slow

## Improvements Implemented
- Added indexes:
  - `booking.user_id`
  - `booking.check_in`
  - `payment.booking_id`
- Considered partitioning for large datasets (RANGE partition on `check_in`)

## Performance After Changes
- EXPLAIN ANALYZE showed:
  - Reduced rows scanned
  - Join operations now using indexed columns
  - Execution time significantly lower
- Query scaling improved for larger datasets

## Conclusion
Continuous monitoring and targeted schema adjustments improved query efficiency and reduced execution time.

