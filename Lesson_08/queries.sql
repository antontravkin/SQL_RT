SELECT b.*,
       r.rating_value
FROM bookings b
LEFT JOIN ratings r ON b.booking_id = r.booking_id
WHERE r.rating_value IS NOT NULL;


SELECT r.room_number,
       c.id,
       c.first_name,
       c.last_name
FROM rooms r
FULL JOIN bookings b ON b.room_number = r.room_number
FULL JOIN clients c ON c.id = b.renter_id
ORDER BY r.room_number;


SELECT *
FROM ratings
SELECT *
FROM rooms
CROSS JOIN clients;


SELECT c.id,
       c.first_name,
       c.last_name,
       r.room_number,
       b.booking_id,
       b.check_in_date,
       b.check_out_date
FROM clients AS c
JOIN bookings AS b ON c.id = b.renter_id
JOIN rooms AS r ON b.room_number = r.room_number
WHERE r.type_name = 'Люкс'
    AND c.address LIKE '%Владимир%'
ORDER BY b.check_in_date DESC;