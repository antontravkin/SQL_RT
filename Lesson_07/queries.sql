SELECT room_number,
       check_in_date,
       check_out_date,
       payment_date,
       amount_paid
FROM bookings
JOIN payments ON bookings.booking_id = payments.booking_id;


SELECT room_number,
       check_in_date,
       check_out_date,
       payment_date,
       amount_paid
FROM payments
JOIN bookings ON bookings.booking_id = payments.booking_id;


SELECT *
FROM bookings
LIMIT 1;


SELECT *
FROM clients
LIMIT 1;


SELECT *
FROM payments
LIMIT 1;


SELECT *
FROM ratings
LIMIT 1;


SELECT *
FROM rooms
LIMIT 1;


SELECT payment_id rating_id
FROM payments p
JOIN bookings b ON b.booking_id = p.booking_id
JOIN clients c ON c.id = b.renter_id;


SELECT b.booking_id,
       b.room_number,
       b.check_in_date,
       b.check_out_date,
       p.payment_date,
       p.amount_paid
FROM bookings b
JOIN payments p ON b.booking_id = p.booking_id
AND p.payment_date < b.check_in_date;


SELECT c.id,
       c.first_name,
       c.last_name
FROM bookings b
JOIN clients c ON c.id = b.renter_id
AND b.check_in_date < '2018-01-02'
AND b.check_out_date >= '2018-01-01';