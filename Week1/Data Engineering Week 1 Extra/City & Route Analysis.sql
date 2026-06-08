/* City & Route Analysis*/

--Most popular pickup cities
SELECT
	pickup_city AS Most_popular_pickup_city
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	pickup_city
ORDER BY
	count(pickup_city) DESC

--Most popular dropoff cities
SELECT
	dropoff_city AS Most_popular_dropoff_city
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	dropoff_city
ORDER BY
	count(dropoff_city) DESC

--Most popular routes
SELECT
	pickup_city || '_' || dropoff_city AS routes,
	count(*) AS num_of_rides
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	routes
ORDER BY
	num_of_rides DESC


--Highest revenue routes
SELECT
	pickup_city || '_' || dropoff_city AS routes,
	sum(fare_amount) AS Total_revenue
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	routes
ORDER BY
	Total_revenue DESC

--Cities with most cancellations
SELECT
	pickup_city,
	count(*) AS Number_of_cancellations
FROM
	rides
WHERE
	ride_status = 'cancelled'
	OR ride_status = 'no_show'
GROUP BY
	pickup_city
ORDER BY
	number_of_cancellations DESC

--Cities with highest average fare
SELECT
	pickup_city,
	ROUND(avg(fare_amount),2) AS average_fare
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	pickup_city
ORDER BY
	average_fare DESC