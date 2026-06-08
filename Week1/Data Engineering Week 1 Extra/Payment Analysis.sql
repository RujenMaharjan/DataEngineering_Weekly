/* Payment Analysis */

--Payment method popularity
SELECT
	payment_method,
	count(*) AS count_of_payment
FROM
	rides
WHERE
	ride_status = 'completed'
	GROUP BY payment_method
ORDER BY
	count_of_payment DESC

	
--Revenue by payment method
SELECT
	payment_method,
	sum(fare_amount ) AS revenue
FROM
	rides
WHERE
	ride_status = 'completed'
	GROUP BY payment_method
ORDER BY
	revenue 	
	
--Most used payment method per city
SELECT
	DISTINCT ON
	(pickup_city) pickup_city,
	payment_method,
	count(*) AS total
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	pickup_city,
	payment_method
ORDER BY
	pickup_city,
	total DESC;
	
--Cash vs non-cash ride count
SELECT
	CASE
		WHEN payment_method = 'cash' THEN 'Cash'
		ELSE 'Non-Cash'
	END AS payment_type,
	Count(*) AS total_rides
FROM
	rides
WHERE
	payment_method IS NOT NULL
GROUP BY
	payment_type
