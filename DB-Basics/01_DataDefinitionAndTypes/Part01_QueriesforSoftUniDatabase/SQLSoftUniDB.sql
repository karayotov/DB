

SELECT FirstName, LastName 
FROM Employees
WHERE FirstName LIKE 'SA%'				--01

SELECT FirstName, LastName 
FROM Employees
WHERE LastName LIKE '%ei%'				--02

SELECT FirstName
FROM Employees
WHERE DepartmentID IN(3, 10) AND YEAR(HireDate) BETWEEN 1995 AND 2005				--03
GO

SELECT FirstName, LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'				--04




SELECT [Name] FROM Towns
WHERE LEN([Name]) = 5 OR LEN([Name]) = 6
ORDER BY [Name]										--05

SELECT * FROM Towns
WHERE [Name] LIKE 'M%' OR [Name] LIKE 'K%' OR [Name] LIKE 'B%' OR [Name] LIKE 'E%'
ORDER BY [Name]										--06

SELECT * FROM Towns
WHERE [Name] NOT LIKE 'R%' AND [Name] NOT LIKE 'B%' AND [Name] NOT LIKE 'D%'
ORDER BY [Name]										--07
GO

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
FROM Employees
WHERE YEAR(HireDate) >= 2001										--08
GO

SELECT FirstName, LastName FROM Employees
WHERE LEN(LastName) = 5										--09
GO

