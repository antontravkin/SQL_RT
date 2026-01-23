-- HW 01

SELECT *
FROM bookings
LIMIT 60;

-- HW 02

SELECT *
FROM rooms
ORDER BY room_size_sqm DESC
LIMIT 20;

-- HW 03

SELECT *
FROM rooms
ORDER BY price_per_night
LIMIT 10;

-- HW 04

SELECT DISTINCT type_name
FROM rooms
ORDER BY type_name DESC;

-- HW 05

SELECT payment_id,
       amount_paid,
       payment_date
FROM payments
ORDER BY payment_date,
         amount_paid
LIMIT 30;