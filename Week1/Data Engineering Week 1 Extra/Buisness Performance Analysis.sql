/* Business Performance Analysis */


--Total revenue
SELECT
	sum(fare_amount) AS total_revenue
FROM
	rides
	
	
--Average fare per ride
SELECT
	sum(fare_amount)/ count(*) AS average_revenue_per_ride
FROM
	rides
	
	
--Revenue by month
SELECT
	EXTRACT(MONTH FROM requested_at) AS months,
	sum(fare_amount) AS Revenue_per_month
FROM
	rides
GROUP BY
	months
ORDER BY
	months
	
	
--Revenue by city
SELECT
	pickup_city AS city,
	sum(fare_amount) AS total_revenue
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	city
ORDER BY
	city
	
	
--Revenue by route
SELECT
	pickup_city || '_' || dropoff_city AS route,
	sum(fare_amount) AS total_revenue_per_route
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	route
ORDER BY
	total_revenue_per_route DESC
	
	
--Revenue by payment method
SELECT
	payment_method,
	sum(fare_amount) AS total_revenue
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	payment_method
ORDER BY
	total_revenue
	
	
--Revenue by ride status
SELECT
	ride_status,
	sum(fare_amount) AS total_revenue
FROM
	rides
GROUP BY
	ride_status
	
	
--Daily revenue trend
SELECT
	date(requested_at) AS DAY,
	sum(fare_amount) AS total_revenue_per_day
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	DAY
	
--Lost revenue due to no show or cancellation
SELECT 
	ride_status,
	sum(fare_amount) AS lost_revenue
FROM 
	rides
WHERE 
	ride_status IN ('no_show','cancelled')
GROUP BY 
	ride_status
	
--Percentage of revenue from each city
SELECT 
	pickup_city AS city,
	sum(fare_amount) AS revenue_per_city,
	Round(sum(fare_amount)*100/sum(sum(fare_amount)) over(),2) AS revenue_percentage
FROM 
	rides
WHERE 
	ride_status ='completed'
GROUP BY 
	city
ORDER BY
	revenue_percentage 