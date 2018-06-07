USE Gringotts

SELECT *
FROM [WizzardDeposits]

SELECT COUNT([Id]) AS [Count]
FROM [WizzardDeposits]						--01


SELECT TOP(1) MAX([MagicWandSize]) AS [LongestMagicWand]
  FROM [WizzardDeposits] 
GROUP BY [MagicWandSize]
ORDER BY [MagicWandSize] DESC				--02


SELECT [DepositGroup], MAX([MagicWandSize]) AS [LongestMagicWand]
  FROM [WizzardDeposits]
GROUP BY [DepositGroup]						--03


SELECT TOP(2)[DepositGroup]
  FROM [WizzardDeposits]
GROUP BY [DepositGroup]
ORDER BY AVG([MagicWandSize])				--04


SELECT [DepositGroup], SUM([DepositAmount]) AS [TotalSum]
  FROM [WizzardDeposits]
  GROUP BY [DepositGroup]					--05



SELECT [DepositGroup], SUM([DepositAmount]) AS [TotalSum]
  FROM [WizzardDeposits]
  WHERE [MagicWandCreator] LIKE 'Ollivander family'
  GROUP BY [DepositGroup]					--06



   SELECT [DepositGroup], SUM([DepositAmount]) AS [TotalSum]
     FROM [WizzardDeposits]
    WHERE [MagicWandCreator] LIKE 'Ollivander family'
 GROUP BY [DepositGroup]
   HAVING SUM([DepositAmount]) < 150000
 ORDER BY [TotalSum] DESC					--07



	SELECT [DepositGroup], 
	       [MagicWandCreator], 
	       MIN([DepositCharge]) AS[MinDepositCharge]
	  FROM [WizzardDeposits]  
  GROUP BY [DepositGroup], [MagicWandCreator]			--08




    SELECT DISTINCT
		CASE
			WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
			WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
			WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
			WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
			WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
			WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
			WHEN [Age] > 60 THEN '[61+]'
		END AS [AgeGroup], COUNT(*) AS [WizardCount]
    FROM [WizzardDeposits]
GROUP BY (
		CASE
			WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
			WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
			WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
			WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
			WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
			WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
			WHEN [Age] > 60 THEN '[61+]'
		END
		)												--09



	SELECT LEFT([FirstName], 1) AS [FirstLetter]
	 FROM [WizzardDeposits]
	WHERE [DepositGroup] LIKE 'Troll Chest'
 GROUP BY LEFT([FirstName], 1)						--10


	SELECT [DepositGroup], [IsDepositExpired], AVG([DepositInterest]) AS [AverageInterest]
	  FROM [WizzardDeposits]
	 WHERE [DepositStartDate] > '1985/01/01'
  GROUP BY [DepositGroup], [IsDepositExpired]
  ORDER BY [DepositGroup] DESC, [IsDepositExpired]		--11


