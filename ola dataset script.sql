Create Database Ola;
Use Ola;
# Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status='Success';

SELECT * FROM Successful_Bookings;
 #Find the average ride distance for each vehicle type:
 Create View ride_distance_for_each_vehicle  As
 SELECT Vehicle_Type, AVG(Ride_Distance)
 as avg_distance FROM bookings
 GROUP BY Vehicle_Type;
SELECT * FROM  ride_distance_for_each_vehicle ;

#. Get the total number of cancelled rides by customers:
Create View Canceled_rides_by_Customer  As
SELECT COUNT(*) FROM bookings
WHERE Booking_Status='Canceled by Customer';
SELECT * FROM Canceled_rides_by_Customer ;

# List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers  As
SELECT Customer_ID,COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM Top_5_Customers ;

#Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_Canceled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver ='Personal & Car related issue';

#Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type ='Prime Sedan';

#. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method='UPI';

#Find the average customer rating per vehicle type:
Create View AVG_CUST_Rating as
SELECT Vehicle_Type,AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY   Vehicle_Type;



# Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value  as
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status='Success';

#List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason  as 
SELECT Booking_ID,Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides='Yes';








 