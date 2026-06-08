/* Data Quality Check */

--Check for duplicate ride_ids
SELECT ride_id, COUNT(*) FROM rides GROUP BY ride_id  HAVING COUNT(*)>1

--Rides with NULL payment method
SELECT ride_id,payment_method FROM rides WHERE payment_method IS NULL

--Rides with NULL rating
SELECT ride_id, rating FROM rides WHERE rating IS NULL 

--Rides with NULL completed_at
SELECT ride_id,completed_at FROM rides WHERE completed_at IS NULL

--Rides where pickup_city = dropoff_city
SELECT ride_id, pickup_city AS same_city_rides FROM rides WHERE pickup_city=dropoff_city

--Rides with suspiciously high/low fare
SELECT ride_id, fare_amount FROM rides WHERE fare_amount<60 OR fare_amount>2500

--Rides with suspiciously high/low distance
SELECT ride_id, ride_distance_km FROM rides WHERE ride_distance_km<4 OR ride_distance_km>40

--Cancelled rides with a rating
SELECT ride_id, ride_status, rating FROM rides WHERE ride_status<>'completed' AND rating IS NOT NULL

--Completed rides without completed_at
SELECT ride_id, ride_status, completed_at FROM rides WHERE ride_status='completed' AND completed_at IS NULL

---Rideses where completed_at < requested_at
SELECT ride_id, requested_at, completed_at FROM rides WHERE completed_at<requested_at

--Rides where ride status is no_show or cancelled but payment_method is not null
SELECT ride_id, ride_status, payment_method FROM rides WHERE ride_status<>'completed' AND payment_method IS NOT NULL

--Leading/trailing spaces in names
SELECT * FROM rides WHERE driver_name <> TRIM(driver_name) OR passanger_name <> TRIM(passanger_name) 

