USE [Geography]

SELECT [PeakName]
FROM [Peaks]
ORDER BY [PeakName]							--22


   SELECT TOP(30)  [CountryName], [Population]
     FROM Countries
    WHERE ContinentCode = (SELECT ContinentCode
					    	 FROM Continents
					        WHERE ContinentName = 'Europe')
 ORDER BY [Population] DESC, [CountryName]						--23


  SELECT [CountryName], [CountryCode], [Currency] =
    CASE CurrencyCode
		WHEN 'EUR' THEN 'Euro'
		ELSE 'Not Euro'
     END
    FROM Countries
ORDER BY CountryName											--24



