/* Calculate the mean of ride_length. */
SELECT CAST(AVG(CAST(DateDiff(mi, started_at, ended_at) as DECIMAL(8,2))) as DECIMAL(4,2)) AS "Mean ride_length"
	FROM [bike_data].[dbo].[bike_data2];

/* Calculate the max ride_length. */
SELECT MAX(ride_length) AS "Maximum ride_length"
	FROM [bike_data].[dbo].[bike_data2];

/* Calculate the mode of day of week. */
SELECT TOP 1 day_of_week AS "Days by popularity",
	COUNT(*) AS "Count"
	FROM [bike_data].[dbo].[bike_data2]
	GROUP BY day_of_week
	ORDER BY COUNT(*) DESC;

/* Calculate the average ride_length for members and casual riders. */
SELECT CAST(AVG(CAST(DateDiff(mi, started_at, ended_at) as DECIMAL(7,2))) AS DECIMAL(4,2)) AS "Average ride_length",
member_casual
	FROM [bike_data].[dbo].[bike_data2]
	GROUP BY member_casual;


/* Calculute the average ride_length for users by day_of_week. */

SELECT CAST(AVG(CAST(DateDiff(mi, started_at, ended_at) as DECIMAL(7,2))) AS DECIMAL(4,2)) AS "Average ride_length",
day_of_week
	FROM [bike_data].[dbo].[bike_data2]
	GROUP BY day_of_week;

/* Calculate average ride-Length for users by day_of week and member_casual.*/

SELECT CAST(AVG(CAST(DateDiff(mi, started_at, ended_at) as DECIMAL(7,2))) AS DECIMAL(4,2)) AS "Average ride_length",
day_of_week,
member_casual
	FROM [bike_data].[dbo].[bike_data2]
	GROUP BY member_casual, day_of_week
	ORDER BY member_casual;

/* Calculate the number of rides for users by day_of_week by adding Count of trip_id to Values.*/
SELECT day_of_week,
	count(*) AS "Number of rides"
	FROM [bike_data].[dbo].[bike_data2]
	GROUP BY day_of_week;
