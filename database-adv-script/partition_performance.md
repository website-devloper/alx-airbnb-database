# Partitioning Performance Report

## Objective
Optimize queries on the Booking table using partitioning on the `check_in` column.

## Implementation
- Created `booking_partitioned` table partitioned by RANGE on `YEAR(check_in)`.
- Migrated existing data from `booking` into `booking_partitioned`.
- Primary key includes `booking_id` and `check_in`.

## Performance Testing
1. Query: fetch bookings for 2025
   - Before partitioning: full table scan on Booking table
   - After partitioning: only partition `p2025` scanned

2. Query: fetch bookings for user_id = 101 in June 2025
   - Before partitioning: full scan of Booking table
   - After partitioning: scanned only relevant partition, reducing rows

## Observations
- Partition pruning significantly reduced the number of rows scanned.
- Execution time improved for date-based queries.
- Queries on specific date ranges scale better as dataset grows.

