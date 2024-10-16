select * 
from CrimeEvents;

SELECT  top 1 TimeOfDay      
from CrimeEvents;

--- top 3 st�der med brott
SELECT TOP 3 Location,
       AVG(CrimeID) AS AvgCrimeID
FROM CrimeEvents
GROUP BY Location
ORDER BY AvgCrimeID DESC;
--- top 5 brott category med pltas och tid 
SELECT top 5 CrimeCategory, 
      Location,
	  TimeOfDay,
	  EventName
from CrimeEvents
order by Location DESC;
--- vilken tid �r som vanligast att p�g�r brott.
SELECT DATEPART(HOUR, EventDate) AS HourOfDay, COUNT(CrimeID) AS TotalCrimes
FROM CrimeEvents
GROUP BY DATEPART(HOUR, EventDate)
ORDER BY TotalCrimes DESC;

--- dag trend 
SELECT day(EventDate) AS day, MONTH(EventDate) AS Month, COUNT(CrimeID) AS TotalCrimes
FROM CrimeEvents
GROUP BY day(EventDate), MONTH(EventDate)
ORDER BY day, Month;
--- vad �r mest catgorey brott om h�nder. 
SELECT CrimeCategory, COUNT(CrimeID) AS TotalCrimes
	   from CrimeEvents
	  GROUP BY CrimeCategory
ORDER BY TotalCrimes DESC;
--- TOP 20 MEST BROTT I  VILKEN ST�DER
SELECT  TOP 10 Location, TimeOfDay, CrimeCategory, 
        EventName, COUNT(CrimeID) AS totalCrimes        
from CrimeEvents
GROUP BY Location, TimeOfDay, CrimeCategory, EventName
order by totalCrimes DESC;









