/* Driver Analysis */

--Top 5 earning drivers
SELECT 
	 driver_name,
	 sum(fare_amount) AS total_revenue
FROM
	rides
WHERE
	ride_status ='completed'
GROUP BY
	driver_name 
ORDER BY 
	total_revenue DESC
LIMIT 
	5
	
	
--Most active drivers (by ride count)
SELECT
	driver_name,
	count(driver_name) AS number_of_active_rides
FROM
	rides
WHERE
	ride_status ='completed'
GROUP BY 
	driver_name
ORDER BY 
	number_of_active_rides DESC

	
--Best rated drivers
SELECT 
	driver_name,
	Round(AVG(rating),2) AS average_rating
FROM 	
	rides
WHERE 
	rating IS NOT NULL
GROUP BY
	driver_name 
ORDER BY
	average_rating desc

	
--Drivers with most cancellations
SELECT 
	driver_name,
	count(driver_name) AS number_of_cancelled_rides
FROM 
	rides
WHERE 
	ride_status ='cancelled'
GROUP BY
	driver_name 
ORDER BY 
	number_of_cancelled_rides  DESC
	
	
--Average fare per driver
SELECT 
	driver_name,
	Round(avg(fare_amount),2) AS average_fare
FROM 
	rides 
WHERE 
	ride_status ='completed'
GROUP BY 
	driver_name
ORDER BY
	average_fare desc
	
--Average distance per driver
SELECT
	driver_name,
	Round(avg(ride_distance_km)) AS average_distance_travelled
FROM
	rides
WHERE
	ride_status='completed'
GROUP BY
	driver_name
ORDER BY
	average_distance_travelled DESC
	
--Drivers with rides in most cities
SELECT
	driver_name,
	count(DISTINCT pickup_city) AS number_of_cities
FROM
	rides
WHERE 
	ride_status='completed'
GROUP BY
	driver_name
ORDER BY
	number_of_cities desc
	