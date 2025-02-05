/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Booking_ID]
  FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']

  -- Q1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS total_reservations
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$'];
-- The answer is 700

-- Q2. Which meal plan is the most popular among guests?
SELECT TOP 1
    type_of_meal_plan, 
    COUNT(*) AS count
FROM 
    [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
GROUP BY 
    type_of_meal_plan
ORDER BY 
    count DESC;
-- The Most popular meal is the "Meal Plan 1" with count 527

-- Q3. What is the average price per room for reservations involving children?
SELECT 
    AVG(avg_price_per_room) AS average_price_per_room
FROM 
    [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE 
    no_of_children > 0;
-- The average price per room for reservations involving children is 144.5683

-- Q4. How many reservations were made for the year 20XX (replace XX with the desired year(2018))?
SELECT COUNT(*)
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE SUBSTRING(arrival_date, 7, 4) = '2018'; 
-- The number of reservations made in 2018 = 359

-- Q5. What is the most commonly booked room type?
SELECT TOP 1 room_type_reserved, COUNT(*) AS booking_count
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
GROUP BY room_type_reserved
ORDER BY booking_count DESC;
-- The Most popular meal is the "Room Type 1" with count 534

--Q6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*)
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE no_of_weekend_nights > 0;
-- The number of reservations fall on a weekend = 383

--Q7. What is the highest and lowest lead time for reservations?
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM 
    [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$'];
-- The highest lead time is 443 and the Lowesest Lead time is 0 

--Q8. What is the most common market segment type for reservations?
SELECT TOP 1 
market_segment_type, COUNT(*) AS segment_count
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
GROUP BY market_segment_type
ORDER BY segment_count DESC
-- The most common market segment in Online = 518

--Q9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS confirmed_reservations
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE booking_status = 'Not_Canceled';
--The Number of booking status confirmed (Not_Canceled) = 493

--Q10. What is the total number of adults and children across all reservations?
SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM 
   [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$'];
--The Total numbers of adults = 1316
--The Total numbers of childrens = 69

--Q11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE no_of_children > 0;
-- the average number of weekend nights for reservations involving children = 1

--Q12.How many reservations were made in each month of the year?
SELECT
    MONTH(CONVERT(DATE, arrival_date, 103)) AS month,
    COUNT(*) AS reservations_count
FROM
    [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE
    ISDATE(arrival_date) = 1 
GROUP BY
    MONTH(CONVERT(DATE, arrival_date, 103))
ORDER BY
    month;
--It gives us how many reservations are made every month of the year

--Q13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT 
    room_type_reserved AS Room_Type,
    AVG(no_of_weekend_nights + no_of_week_nights) AS Avg_Nights
FROM 
    [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
GROUP BY 
    room_type_reserved;
-- it gives me the result of each room type with its average number of nights

--Q14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT TOP 1 room_type_reserved AS most_common_room_type, 
       AVG(avg_price_per_room) AS average_price
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC;
-- The most common room type involving children ia Room Type 1 and its average price = 123.1229

--Q15. Find the market segment type that generates the highest average price per room.
SELECT TOP 1 market_segment_type, AVG(avg_price_per_room) AS average_price_per_room
FROM [Hotel Reservation Analysis with SQL].[dbo].['Hotel Reservation Dataset$']
GROUP BY market_segment_type
ORDER BY average_price_per_room DESC;
-- The market segment type that generates the highest average price per room is the Online and its average price per room = 112.455

