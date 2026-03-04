SELECT b.booking_id,
       b.check_in_date,
       b.check_out_date,
       r.rating_value
FROM bookings b
JOIN ratings r ON b.booking_id = r.booking_id
WHERE r.rating_value = 5
ORDER BY b.booking_id
LIMIT 50;


SELECT b.booking_id,
       b.check_in_date,
       b.check_out_date,
       c.first_name,
       c.last_name,
       c.phone_number
FROM bookings b
JOIN clients c ON b.renter_id = c.id
WHERE c.phone_number LIKE '8910%'
ORDER BY b.booking_id;


SELECT c.id AS id,
       c.last_name,
       c.first_name,
       c.phone_number,
       b.room_number
FROM bookings b
JOIN clients c ON b.renter_id = c.id
JOIN ratings r ON b.booking_id = r.booking_id
WHERE r.rating_value < 4
ORDER BY c.id
LIMIT 50;


SELECT c.id,
       c.first_name,
       c.last_name,
       b.booking_id,
       b.check_in_date,
       b.check_out_date
FROM clients c
JOIN bookings b ON c.id = b.renter_id
JOIN rooms r ON b.room_number = r.room_number
WHERE r.type_name = 'Люкс'
    AND c.address LIKE '%Рязань%'
ORDER BY c.id,
         b.booking_id;

SELECT b.room_number,
       c.id,
       c.first_name,
       c.last_name
FROM bookings b
JOIN clients c ON b.renter_id = c.id
JOIN rooms r ON b.room_number = r.room_number
WHERE b.check_in_date > '2022-03-01'
    AND b.check_out_date < '2022-03-16'
    AND r.price_per_night > 20000
    AND r.has_minibar = 1
ORDER BY b.room_number,
         c.id;


SELECT c.first_name,
       c.last_name,
       b.booking_id,
       p.amount_paid,
       p.payment_date
FROM clients c
JOIN bookings b ON c.id = b.renter_id
JOIN payments p ON b.booking_id = p.booking_id
WHERE p.payment_method = 'СБП'
ORDER BY p.amount_paid DESC,
         p.payment_date ASC
LIMIT 50;


SELECT b.booking_id,
       b.check_in_date,
       r.type_name
FROM bookings b
JOIN ratings rt ON b.booking_id = rt.booking_id
JOIN rooms r ON b.room_number = r.room_number
WHERE rt.rating_value = 5
ORDER BY b.booking_id
LIMIT 50;

SELECT b.room_number,
       b.check_in_date,
       b.check_out_date,
       c.id AS renter_id,
       c.first_name,
       c.last_name,
       r.rating_value
FROM bookings b
JOIN clients c ON b.renter_id = c.id
JOIN ratings r ON b.booking_id = r.booking_id
WHERE b.check_in_date >= '2021-02-10'
    AND b.check_out_date <= '2021-04-15'
    AND r.rating_value > 4
ORDER BY b.room_number,
         b.check_in_date;


SELECT b.room_number,
       b.check_in_date,
       b.check_out_date,
       c.id AS renter_id,
       r.rating_value,
       c.last_name,
       c.first_name
FROM bookings b
JOIN clients c ON b.renter_id = c.id
JOIN ratings r ON b.booking_id = r.booking_id
WHERE b.check_in_date >= '2021-02-10'
    AND b.check_out_date <= '2021-04-15'
    AND r.rating_value > 4
ORDER BY b.room_number,
         b.check_in_date,
         c.last_name,
         c.first_name;


SELECT b.booking_id,
       b.check_in_date,
       b.check_out_date,
       r.type_name,
       p.amount_paid
FROM bookings b
JOIN clients c ON b.renter_id = c.id
JOIN rooms r ON b.room_number = r.room_number
JOIN payments p ON b.booking_id = p.booking_id
WHERE c.address LIKE '%Москва%'
ORDER BY p.amount_paid,
         b.booking_id
LIMIT 20;

SELECT * FROM clients;
