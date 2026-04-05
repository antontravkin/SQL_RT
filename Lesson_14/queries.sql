SELECT first_name
FROM clients
WHERE first_name = 'Иван';


SELECT table_name,
       column_name,
       data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name,
         ordinal_position;


SELECT r.name,
       r.last_name,
       SUM(b.total_spent) as total_spent
FROM clients r
RIGHT JOIN bookings b ON r.id = b.renter_id
GROUP BY r.name,
         r.last_name
ORDER BY total_spent DESC
LIMIT 5;


SELECT r.first_name,
       r.last_name,
       SUM(b.amount_paid) as total_spent
FROM clients r
RIGHT JOIN bookings b ON r.id = b.renter_id
GROUP BY r.first_name,
         r.last_name
ORDER BY total_spent DESC
LIMIT 5;

WITH client_spending AS
    (SELECT renter_id,
            SUM(amount_paid) AS total_spent
     FROM bookings
     JOIN payments USING (booking_id)
     GROUP BY renter_id)
SELECT c.first_name,
       c.last_name,
       total_spent
FROM client_spending cs
JOIN clients c ON cs.renter_id = c.id
ORDER BY total_spent DESC
LIMIT 10;


SELECT type_name,
       AVG(rating_value) OVER (PARTITION BY type_name) AS avg_rating,
       RANK() OVER (PARTITION BY type_name
                    ORDER BY AVG(rating_value) OVER (PARTITION BY type_name) DESC) AS rank_per_type
FROM bookings
JOIN rooms USING (room_number)
JOIN ratings USING (booking_id);


SELECT booking_id,
       amount_paid
FROM payments
WHERE amount_paid <= 0;


SELECT renter_id,
       AVG(julianday(check_out_date) - julianday(check_in_date)) AS avg_days
FROM bookings
GROUP BY renter_id
ORDER BY avg_days DESC;


SELECT room_number,
       COUNT(*) AS bookings_count
FROM bookings
GROUP BY room_number
ORDER BY bookings_count DESC
LIMIT 10;

WITH room_stats AS
    (SELECT room_number,
            COUNT(*) AS bookings_count
     FROM bookings
     GROUP BY room_number)
SELECT room_number,
       bookings_count,
       RANK() OVER (
                    ORDER BY bookings_count DESC) AS rank
FROM room_stats;



SELECT r.id, res.name AS restaurant, r.reservation_time
FROM reservations r
JOIN tables t ON t.id = r.table_id
JOIN restaurants res ON res.id = t.restaurant_id
WHERE r.user_id = 12;


SELECT COUNT(*) AS reservations_count
FROM reservations
WHERE reservation_time::date = '2026-05-01'
    AND table_id IN (
        SELECT id FROM tables WHERE restaurant_id = 5



CREATE INDEX idx_reservations_table_time
    ON reservations(table_id, reservation_time);

