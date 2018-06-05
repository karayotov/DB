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