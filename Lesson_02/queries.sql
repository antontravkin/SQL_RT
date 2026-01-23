SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';


SELECT column_name,
       data_type,
       is_nullable,
       column_default
FROM information_schema.columns
WHERE table_name = 'ratings'
ORDER BY ordinal_position;


SELECT 2 + 4;


SELECT *
FROM rooms;


SELECT payments_id,
       payment_date/75
FROM payments;


SELECT DISTINCT type_name
FROM rooms;


SELECT DISTINCT type_name AS t,
                room_number AS r
FROM rooms;


SELECT *
FROM clients
ORDER BY last_name DESC
LIMIT 10;


SELECT *
FROM bookings
ORDER BY check_in_date
LIMIT 5;


SELECT DISTINCT payment_method
FROM payments
ORDER BY payment_method;

-- Введите только номера комнат и их цены за ночь.
-- Переменуйте столбец цены за ночь в price_per_night.

SELECT room_number,
       price_per_night AS price_per_night
FROM rooms;

--Выведите все типы номеров вместе с ценой за ночь и признаком мини-бара.
--Отсортируйте по типу номера, затем по цене по возрастанию.

SELECT type_name,
       price_per_night,
       has_minibar
FROM rooms
ORDER BY type_name,
         price_per_night;