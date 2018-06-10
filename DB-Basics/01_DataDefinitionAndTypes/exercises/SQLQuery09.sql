--MountainID = 17

SELECT 'Rila' AS MountainRange, PeakName, Elevation
FROM Peaks
WHERE MountainId LIKE 17
ORDER BY Elevation DESC