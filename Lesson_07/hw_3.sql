/* SQLite */
SELECT booking_id,
       check_in_date,
       check_out_date,
       DATE(check_out_date) - DATE(check_in_date) AS stay_time
FROM bookings
WHERE DATE(check_out_date) - DATE(check_in_date) > 20;


SELECT room_number,
       type_name,
       max_occupancy,
       AVG(max_occupancy) OVER (PARTITION BY type_name) AS avg_occupancy
FROM rooms
ORDER BY avg_occupancy DESC;


SELECT room_number,
       room_size_sqm,
       max_occupancy,
       AVG(room_size_sqm) OVER (PARTITION BY max_occupancy) AS avg_size_for_occupancy
FROM rooms;


SELECT payment_id,
       payment_date,
       SUM(amount_paid) OVER (PARTITION BY DATE(payment_date)) AS total_payments_per_day
FROM payments
WHERE strftime('%Y', payment_date) = '2017';


SELECT payment_id,
       payment_date,
       SUM(amount_paid) OVER (PARTITION BY DATE(payment_date)) AS total_payments_per_day
FROM payments
WHERE EXTRACT(YEAR
              FROM payment_date) = 2017;


SELECT booking_id,
       renter_id,
       COUNT(*) OVER (PARTITION BY renter_id) AS bookings_count
FROM bookings
WHERE renter_id BETWEEN 1 AND 60
ORDER BY booking_id;


SELECT payment_id,
       payment_method,
       amount_paid,
       100.0 * amount_paid / SUM(amount_paid) OVER (PARTITION BY payment_method) AS payment_percentage
FROM payments
WHERE amount_paid > 200000;


SELECT room_number,
       type_name,
       price_per_night,
       price_per_night - AVG(price_per_night) OVER (PARTITION BY type_name) AS price_difference
FROM rooms;


SELECT room_number,
       type_name,
       room_size_sqm,
       AVG(room_size_sqm) OVER (PARTITION BY type_name) AS avg_room_size_sqm
FROM rooms;


SELECT room_number,
       type_name,
       room_size_sqm,
       ROUND(100.0 * (room_size_sqm - AVG(room_size_sqm) OVER (PARTITION BY type_name)) / AVG(room_size_sqm) OVER (PARTITION BY type_name), 2) AS size_difference_percentage
FROM rooms;


SELECT payment_id,
       payment_method,
       amount_paid,
       AVG(amount_paid) OVER (PARTITION BY payment_method) AS avg_amount_paid
FROM payments
WHERE amount_paid > 200000;


SELECT payment_id,
       payment_method,
       amount_paid,
       ROUND(100.0 * (amount_paid - AVG(amount_paid) OVER (PARTITION BY payment_method)) / AVG(amount_paid) OVER (PARTITION BY payment_method), 2) AS percentage_difference
FROM payments
WHERE amount_paid BETWEEN 10000 AND 20000;


SELECT room_number,
       type_name,
       price_per_night,
       ROW_NUMBER() OVER (PARTITION BY type_name
                          ORDER BY price_per_night ASC) AS row_number
FROM rooms;


SELECT payment_id,
       amount_paid,
       payment_method,
       ROW_NUMBER() OVER (PARTITION BY payment_method
                          ORDER BY amount_paid DESC) AS row_number
FROM payments
WHERE amount_paid > 200000;


SELECT room_number,
       type_name,
       room_size_sqm,
       DENSE_RANK() OVER (PARTITION BY type_name
                          ORDER BY room_size_sqm DESC) AS sqm_rank
FROM rooms;


SELECT payment_id,
       payment_method,
       amount_paid,
       RANK() OVER (PARTITION BY payment_method
                    ORDER BY amount_paid ASC) AS amount_rank
FROM payments
WHERE amount_paid > 200000;


SELECT room_number,
       type_name,
       price_per_night,
       LEAD(price_per_night) OVER (PARTITION BY type_name
                                   ORDER BY price_per_night DESC) AS next_price,
       LAG(price_per_night) OVER (PARTITION BY type_name
                                  ORDER BY price_per_night DESC) AS prev_price
FROM rooms;


SELECT payment_id,
       payment_method,
       amount_paid,
       payment_date,
       LEAD(amount_paid) OVER (PARTITION BY payment_method
                               ORDER BY payment_date ASC) AS next_amount_paid
FROM payments
WHERE amount_paid > 200000;


SELECT booking_id,
       renter_id,
       check_in_date,
       LAG(booking_id) OVER (PARTITION BY renter_id
                             ORDER BY check_in_date ASC) AS previous_booking_id,
       check_in_date - LAG(check_in_date) OVER (PARTITION BY renter_id
                                                ORDER BY check_in_date ASC) AS days_since_last_booking
FROM bookings
WHERE renter_id BETWEEN 1 AND 100
ORDER BY renter_id,
         check_in_date;


SELECT type_name,
       ROUND(COUNT(*) * 100.0 /
                 (SELECT COUNT(*)
                  FROM rooms), 2) AS percentage
FROM rooms
GROUP BY type_name;


SELECT type_name,
       MAX(price) - MIN(price) AS price_range
FROM rooms
GROUP BY type_name
ORDER BY price_range DESC
LIMIT 1;


SELECT *
FROM rooms