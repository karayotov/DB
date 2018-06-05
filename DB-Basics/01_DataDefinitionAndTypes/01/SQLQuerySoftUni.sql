USE SoftUni

SELECT FirstName, LastName, Salary 
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC							--12


SELECT TOP(5) FirstName, LastName
FROM Employees
ORDER BY Salary DESC							--13


SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID NOT LIKE 4					--14


SELECT *
FROM [Employees]
ORDER BY [Salary] DESC, 
[FirstName] ASC,
[LastName] DESC,
[MiddleName] ASC								--15
GO

CREATE VIEW V_EmployeesSalaries AS
SELECT [FirstName], [LastName], [Salary]
FROM Employees									--16
GO


CREATE VIEW V_EmployeeNameJobTitle 
	AS
SELECT CONCAT([FirstName], ' ', ISNULL([MiddleName], ''), ' ',[LastName]) 
	AS [Full Name], [JobTitle]
  FROM Employees								--17


SELECT
DISTINCT JobTitle
FROM Employees									--18

  SELECT TOP(10) * 
    FROM Projects
ORDER BY [StartDate],
		 [Name]									--19


  SELECT TOP(7) [FirstName], [LastName], [HireDate]
    FROM Employees
ORDER BY [HireDate] DESC						--20


UPDATE Employees
   SET Salary *= 1.12 --INCREASE VALUE WITH 12%
 WHERE DepartmentID IN(1, 2, 4, 11) 

 SELECT Salary
 FROM Employees									--21




