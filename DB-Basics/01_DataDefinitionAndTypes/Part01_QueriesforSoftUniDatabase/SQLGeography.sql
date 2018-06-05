
USE [Geography]
GO

SELECT CountryName, IsoCode
FROM Countries
WHERE CountryName LIKE '%A%A%A%'
ORDER BY IsoCode						--10


SELECT PeakName, RiverName,
LOWER(LEFT(PeakName, LEN(PeakName)-1) + RiverName) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(PeakName,1) = LEFT(RiverName,1)
ORDER BY Mix
GO



SELECT PeakName, RiverName,
LOWER(CONCAT(LEFT(PeakName, LEN(PeakName) - 1), RiverName)) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix
