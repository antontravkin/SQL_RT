SELECT renter_id,
       booking_id
FROM bookings
WHERE check_in_date =
        (SELECT MIN(check_in_date)
         FROM bookings);

/* подзапрос */
SELECT MIN(check_in_date)
FROM bookings;

/* Найдите все бронирования (booking_id), рейтинг которых выше среднего рейтинга по всей таблице ratings. */
SELECT booking_id
FROM ratings
WHERE rating_value >
        (SELECT AVG(rating_value)
         FROM ratings);

/* Найдите id бронирований, где сумма оплаты равняется минимальной цене комнаты. */
SELECT booking_id
FROM payments
WHERE amount_paid =
        (SELECT MIN(price_per_night)
         FROM rooms);