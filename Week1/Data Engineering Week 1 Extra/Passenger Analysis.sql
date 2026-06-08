/* Rider Analysis */

--Most frequent riders
SELECT
	passanger_name,
	count(passanger_name) AS count_of_rides_booked
FROM
	rides
GROUP BY 
	passanger_name
ORDER BY 	
	count_of_rides_booked desc

--Highest spending riders
SELECT 	
	passanger_name,
	sum(fare_amount) AS Total_spent
FROM 
	rides
WHERE 
	ride_status = 'completed'
GROUP BY 
	passanger_name 
ORDER BY
	total_spent DESC
	
	
--Riders with most cancellations
SELECT 
	passanger_name,
	count(passanger_name) AS total_cancellations
FROM 
	rides
WHERE 
	ride_status = 'cancelled'
GROUP BY 
	passanger_name 
ORDER BY 
	total_cancellations DESC 
	
--Average spend per rider
SELECT 
	passanger_name,
	Round(sum(fare_amount)/count(passanger_name),2) AS average_spent
FROM 
	rides
WHERE 
	ride_status = 'cancelled'
GROUP BY 
	passanger_name 
ORDER BY 
	average_spent DESC 
	
	
--Riders who never rated
SELECT
	passanger_name
FROM
	rides
GROUP BY
	passanger_name
HAVING
	count(rating)= 0