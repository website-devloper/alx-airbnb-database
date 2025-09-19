# Booking Query Optimization Report

## Initial Query
- Retrieved all bookings along with user, property, and payment details.
- Used multiple joins without indexing.

## Performance Analysis (Before Indexes)
- Full table scans observed on booking, user, property, and payment tables.
- High execution time due to large datasets.
- EXPLAIN ANALYZE showed type = ALL for some joins.

## Optimization Steps
1. Added indexes on:
   - `booking.user_id`
   - `booking.property_id`
   - `payment.booking_id`
2. Reduced columns selected to only necessary fields.

## Refactored Query
- Used indexed columns for joins.
- Minimized selected columns.
- Resulted in fewer rows scanned and lower execution time.

## Performance Analysis (After Indexes)
- EXPLAIN ANALYZE showed `ref` usage instead of `ALL`.
- Execution time reduced significantly.
- Query scales better for large datasets.

