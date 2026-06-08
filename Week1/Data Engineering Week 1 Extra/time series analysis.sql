/* Time Analysis */

--Rides per month
SELECT
	EXTRACT (MONTH
FROM
	requested_at) AS months,
	count(*) AS num_of_rides
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	months
ORDER BY
	months

--Rides per day of week
SELECT
	to_char(requested_at, 'Day') AS day_of_week,
	count(*) AS total_rides
FROM
	rides
GROUP BY
	day_of_week
ORDER BY
	total_rides DESC

--Peak hours of the day
SELECT
	EXTRACT(HOUR FROM requested_at) AS hour_,
	count(*)
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	hour_
ORDER BY
	hour_

--Busiest month by revenue
SELECT
	EXTRACT(MONTH FROM requested_at) AS month_,
	sum(fare_amount) AS total_revenue
FROM
	rides
WHERE
	ride_status = 'completed'
GROUP BY
	month_
ORDER BY
	month_
	
--Average ride duration by city
SELECT
	pickup_city ,
	avg(DATE_trunc('minute', completed_at-requested_at)) AS Time_difference
FROM
	rides
WHERE
	completed_at IS NOT NULL
GROUP BY
	pickup_city
ORDER BY
	time_difference DESC
	
	
--Longest rides by duration
SELECT
	pickup_city ,
	max(DATE_trunc('minute', completed_at-requested_at)) AS maximum_time
FROM
	rides
WHERE
	completed_at IS NOT NULL
GROUP BY
	pickup_city
ORDER BY
	maximum_time DESC
