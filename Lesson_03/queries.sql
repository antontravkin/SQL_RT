SELECT *
FROM rooms
WHERE type_name = 'Люкс';


SELECT *
FROM rooms
WHERE rooms.max_occupancy = 3;

-- коммент

SELECT *
FROM rooms
WHERE rooms.max_occupancy > 3;


SELECT *
FROM rooms
WHERE payment_option = 'на месте'
    AND (price_per_night < 150
         OR price_per_night > 10000);


SELECT *
FROM rooms
WHERE max_occupancy BETWEEN 2 AND 4;-- вместимость от 2 до 4


SELECT *
FROM clients
WHERE last_name ILIKE 'С%'
    AND first_name ILIKE 'К%';


SELECT *
FROM clients
WHERE address ILIKE '%бул.%'; -- бульвар в адресе


SELECT *
FROM rooms
WHERE max_occupancy IN (1,
                        4); -- 1 или 4 гостя


SELECT *
FROM rooms
WHERE max_occupancy NOT IN (1,
                            2,
                            3);


SELECT *
FROM bookings
WHERE booking_id IN
        (SELECT booking_id
         FROM ratings
         WHERE rating_value = 5);


SELECT *
FROM clients
WHERE id IN
        (SELECT renter_id
         FROM bookings
         WHERE room_number = 10);


SELECT *
FROM bookings
WHERE room_number IN
        (SELECT room_number
         FROM rooms
         WHERE price_per_night > 10000);


SELECT *
FROM clients
WHERE email IS NULL; -- проверка на NULL
