-- Returns the table
SELECT *
FROM Mens_1500;

-- Gets the median athlete's data
SELECT Position, FullName, RawTime, School, Date, Meet 
From Mens_1500
WHERE Position = 
  (SELECT AVG(Position)
  From Mens_1500);

-- Returns all athletes' data with the first name of Bradley
SELECT *
FROM Mens_1500
WHERE FirstName = 'Bradley';

-- Calculates the average 1500m time (in seconds)
SELECT AVG(time) AS 'Average 1500m time (in seconds)'
FROM Mens_1500;

-- Calculates the average 1500m time and the number of performances at the Bryan Clay Invitational 
SELECT COUNT(*) AS 'Number of Runners', CONCAT(AVG(Time)/60, ':',AVG(Time)%60.00) AS 'Average 1500m timeat the Bryan Clay Invitational'
FROM Mens_1500
WHERE Meet = '2024 Bryan Clay Invitational';

-- Returns the number of freshman with a time less than 4:00
SELECT COUNT(*) AS 'Freshman under 3:50'
FROM Mens_1500
WHERE Year = 'Fr' AND Time < 230;

-- Returns the names of the juniors at Harvard or Yale
SELECT FullName, RawTime
FROM Mens_1500
WHERE Year = 'Jr' AND (School = 'Harvard' OR School = 'Yale');

-- Returns the name and school of each athlete where their ranking is divisible by lcd(3,13) = 39
-- 11232 just happens to be divisible by 39 lol
SELECT Position, FullName, School, RawTime
FROM Mens_1500
WHERE Position%(3*13) = 0;

-- Returns athletes with the ranking between 1100 and 1748 who are sophomores and who's last name starts with F
SELECT Position, FullName, RawTime
FROM Mens_1500
WHERE (Position >= 1100 AND Position <= 1748) AND (Year = 'So') AND (LastName LIKE 'F%');

-- Returns all athletes that have a first name longer than 4 letters and ran their personal best during the month of March
SELECT *
FROM Mens_1500
WHERE LEN(FirstName) >= 5 AND (Date LIKE 'March%');

-- Only returns schools that have start with 'University' (most of these are club teams)
SELECT School
FROM Mens_1500
WHERE School LIKE 'University%';

-- Returns a count of all athletes that their converted mile times is under 4:00
SELECT COUNT(*) AS 'Basically sub-4 milers'
FROM Mens_1500
WHERE Time < 240*(1500/1609.344);
