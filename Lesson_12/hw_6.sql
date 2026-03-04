SELECT b.renter_id,
       COUNT(*) AS minibar_stays
FROM bookings b
JOIN rooms r ON b.room_number = r.room_number
WHERE r.has_minibar = 1
GROUP BY b.renter_id
HAVING COUNT(*) > 2
ORDER BY b.renter_id;


WITH cash_payments AS
    (SELECT booking_id,
            amount_paid
     FROM payments
     WHERE payment_method ='наличными'),
     avg_payment AS
    (SELECT AVG(amount_paid) AS avg_amount
     FROM payments)
SELECT DISTINCT room_number
FROM bookings
WHERE booking_id IN
        (SELECT booking_id
         FROM cash_payments
         WHERE amount_paid >
                 (SELECT avg_amount
                  FROM avg_payment))


SELECT month,
       AVG(monthly_bookings) AS overall_avg_monthly_bookings
FROM
    (SELECT strftime('%m', check_in_date) AS month,
            strftime('%Y', check_in_date) AS year,
            COUNT(*) AS monthly_bookings
     FROM bookings
     GROUP BY year,
              month)
GROUP BY month
ORDER BY overall_avg_monthly_bookings DESC;


WITH bookings_per_day AS
    (SELECT strftime('%w', check_in_date) AS day_of_week,
            COUNT(*) AS booking_count
     FROM bookings
     GROUP BY day_of_week)
SELECT day_of_week,
       booking_count,
       DENSE_RANK() OVER (
                          ORDER BY booking_count DESC) AS rank
FROM bookings_per_day
ORDER BY rank ASC;