SELECT b.booking_id,
       b.renter_id,
       b.room_number,
       b.check_in_date,
       b.check_out_date
FROM bookings AS b
JOIN clients AS c ON b.renter_id = c.id
WHERE c.first_name = 'Иван'
ORDER BY b.booking_id ASC;


SELECT r.room_number
FROM rooms AS r
LEFT JOIN bookings AS b ON r.room_number = b.room_number
WHERE b.booking_id IS NULL
ORDER BY r.room_number;


SELECT b.*
FROM bookings AS b
JOIN payments AS p ON b.booking_id = p.booking_id
WHERE p.payment_date BETWEEN '2020-01-01' AND '2020-03-31'
ORDER BY b.booking_id
LIMIT 50;


SELECT c.id,
       c.first_name,
       c.last_name
FROM clients c
LEFT JOIN bookings b ON c.id = b.renter_id
WHERE b.booking_id IS NULL
ORDER BY c.id ASC
LIMIT 50;


SELECT DISTINCT c.id,
                c.first_name,
                c.last_name
FROM clients c
JOIN bookings b ON c.id = b.renter_id
JOIN rooms r ON b.room_number = r.room_number
WHERE r.price_per_night > 15000
ORDER BY c.id ASC
LIMIT 50;


SELECT id
FROM
    (SELECT c.id,
            EXTRACT(EPOCH
                    FROM (b.check_out_date - b.check_in_date))/86400 AS stay_length
     FROM clients c
     JOIN bookings b ON c.id = b.renter_id
     ORDER BY stay_length DESC) AS t
GROUP BY id
ORDER BY id ASC
LIMIT 50;


SELECT renter_id
FROM
    (SELECT renter_id
     FROM bookings
     GROUP BY renter_id
     ORDER BY MAX(JULIANDAY(check_out_date) - JULIANDAY(check_in_date)) DESC
     LIMIT 50)
ORDER BY renter_id ASC;


SELECT DISTINCT b.renter_id
FROM bookings b
JOIN rooms r ON b.room_number = r.room_number
WHERE r.price_per_night >
        (SELECT AVG(price_per_night)
         FROM rooms)
ORDER BY b.renter_id ASC
LIMIT 50;


SELECT COUNT(DISTINCT b.renter_id) AS lux_cnt
FROM bookings b
JOIN rooms r ON b.room_number = r.room_number
WHERE r.type_name = 'Люкс';


SELECT booking_id
FROM ratings
WHERE rating_value =
        (SELECT MAX(rating_value)
         FROM ratings)
ORDER BY booking_id
LIMIT 50;


SELECT *
FROM bookings
WHERE (check_out_date - check_in_date) <=
        (SELECT AVG(check_out_date - check_in_date)
         FROM bookings)
ORDER BY booking_id
LIMIT 50;


SELECT DISTINCT b.renter_id
FROM bookings b
WHERE NOT EXISTS
        (SELECT 1
         FROM bookings b2
         JOIN rooms r2 ON b2.room_number = r2.room_number
         WHERE b2.renter_id = b.renter_id
             AND r2.max_occupancy <
                 (SELECT MAX(max_occupancy)
                  FROM rooms) )
ORDER BY b.renter_id
LIMIT 50;


SELECT DISTINCT room_number
FROM bookings
WHERE payment_method = 'спб'
    AND room_number IN
        (SELECT room_number
         FROM rooms
         WHERE room_type = 'Люкс' )
ORDER BY room_number ASC;


SELECT room_number,
       room_rank
FROM
    (SELECT room_number,
            room_rank,
            DENSE_RANK() OVER (
                               ORDER BY room_size_sqm DESC) AS rank_area
     FROM rooms) sub
WHERE rank_area <= 3
ORDER BY rank_area,
         room_number;


SELECT room_number
FROM bookings
WHERE payment_method = 'СБП'
    AND room_number IN
        (SELECT room_number
         FROM rooms
         WHERE room_type = 'Люкс' )
ORDER BY room_number ASC;


SELECT *
FROM rooms
select *
from bookings
where
        (select (JULIANDAY(check_out_date) - JULIANDAY(check_in_date))
         from bookings) <
        (select avg (JULIANDAY(check_out_date) - JULIANDAY(check_in_date))
         from bookings)
order by booking_id
limit 50;


SELECT DISTINCT r.room_number
FROM rooms r
JOIN bookings b ON r.room_number = b.room_number
JOIN payments p ON b.booking_id = p.booking_id
WHERE p.payment_method = 'СБП'
    AND r.type_name = 'Люкс'
ORDER BY r.room_number ASC;