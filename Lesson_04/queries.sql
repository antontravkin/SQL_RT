SELECT payment_id,
       amount_paid,
       CASE
           WHEN amount_paid > 50000 THEN 'Важный клиент'
           WHEN amount_paid > 10000 THEN 'Обычный клиент'
           ELSE 'Невыгодный клиент'
       END AS category
FROM payments;


SELECT room_number,
       price_per_night,
       CASE
           WHEN price_per_night > 5000 THEN 'Дорогой номер'
           WHEN price_per_night > 2500
                AND price_per_night <= 5000 THEN 'Нормальный номер'
           ELSE 'Дeшевый номер'
       END AS room_price_category
FROM rooms