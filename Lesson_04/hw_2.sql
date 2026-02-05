SELECT booking_id,
       COUNT(*) AS booking_count
FROM clients
GROUP BY booking_id
ORDER BY booking_count DESC,
         booking_id ASC
LIMIT 3;


SELECT renter_id,
       COUNT(*) AS booking_count
FROM bookings
GROUP BY renter_id
ORDER BY booking_count DESC,
         renter_id ASC
LIMIT 3;


SELECT *
FROM bookings
SELECT payment_method,
       AVG(amount_paid) AS avg_payment_amount
FROM payments
GROUP BY payment_method;


SELECT type_name,
       COUNT(*) AS number_of_rooms
FROM rooms
GROUP BY type_name;


SELECT COUNT(id) AS clients_without_numbers
FROM clients
WHERE phone_number IS NULL
    OR phone_number = '';


SELECT COUNT(booking_id) AS bookings_paid_sbp
FROM payments
WHERE payment_method = 'СБП';


SELECT COUNT(room_number) AS num_large_rooms
FROM rooms
WHERE room_size_sqm > 40;


SELECT COUNT(DISTINCT type_name) AS num_room_types
FROM rooms;


SELECT SUM(amount_paid) AS total_amount_paid
FROM payments;


SELECT MAX(max_occupancy) AS max_room_occupancy
FROM rooms;


SELECT AVG(price_per_night) AS avg_price_per_night
FROM rooms;


SELECT COUNT (payment_method) AS avg_price_per_night
FROM payments
WHERE payment_method <> ''
    SELECT *
    FROM payments;


SELECT *
FROM clients