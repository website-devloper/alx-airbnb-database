CREATE TABLE Message ( message_id PK, INDEXED, sender_id FK(user_id), REFERENCE, recipient_id FK(user_id) , REFERENCE, message_body TEXT, NOT NULL, sent_at TIMESTAMP, DEFAULT_CURRENT );

CREATE TABLE Booking ( booking_id PK, indexed, property_id FK(property_id) reference, indexed, user_id FK(user_id), reference, start_date DATE, NOT NULL, end_date DATE, NOT NULL, total_price DECIMAL, NOT NULL, status STATUS, NOT NULL (pending, confirmed, canceled), created_at TIMESTAMP, DEFAULT_CURRENT );

CREATE TABLE User ( user_id PK, indexed, first_name VARCHAR, NOT NULL, email VARCHAR, NOT NULL UNIQUE, indexed, last_name VARCHAR ,NOT NULL, password_hash VARCHAR, NOT NULL, phone_number VARCHAR, NULL, role ENUM, NOT NULL, created_at TIMESTAMP , DEFAULT CURRENT );

CREATE TABLE Payment ( payment_id PK, INDEXED, booking_id FK(booking_id), REFERENCE, indexed, amount DECIMAL, NOT NULL, payment_date TIMESTAMP , DEFAULT CURRENT , payment_method ENUM, NOT NULL );

CREATE TABLE Property ( property_id PK, indexed, host_id FK(user_id), name VARCHAR, NOT NULL, description TEXT, NOT NULL, location VARCHAR, NOT NULL, pricepernight DECIMAL, NOT NULL, created_at TIMESTAMP,DEFAULT_CURRENT, updated_at TIMESTAMP, ON UPDATE CURRENT );

CREATE TABLE Review ( review_id PK INDEXED, property_id FK(property_id), REFERENCE, user_id FK(user_id), REFERENCE, rating INTEGER(1,5), NOT NULL , created_at TIMESTAMP, DEFAULT CURRENT, comment TEXT, NOT NULL );
