CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
	SELECT FirstName, LastName
		FROM Employees
		WHERE Salary > 35000
		GO
-------------------------------------------------------------------01


CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@number DECIMAL(18,4))
AS
	SELECT FirstName, LastName
		FROM Employees
		WHERE Salary >= @number
		GO
-------------------------------------------------------------------02

CREATE PROCEDURE usp_GetTownsStartingWith(@string VARCHAR(16))
AS
	SELECT [Name]
		FROM Towns
		WHERE LEFT(Name, LEN(@string)) = @string
		GO
-------------------------------------------------------------------03

CREATE PROCEDURE usp_GetEmployeesFromTown(@townName VARCHAR(16))
AS
	SELECT FirstName, LastName
		FROM Employees AS E
		JOIN Addresses AS A
		ON A.AddressID = E.AddressID
		JOIN Towns AS T
		ON T.TownID = A.TownID
		WHERE T.Name LIKE @townName
GO
-------------------------------------------------------------------04

CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(16)
AS
	BEGIN
		DECLARE @salaryLevel VARCHAR(7)
		IF(@salary > 50000)
		BEGIN
			SET @salaryLevel = 'High'
		END
		ELSE IF(@salary >= 30000)
		BEGIN
			SET @salaryLevel = 'Average'
		END
		ELSE
		BEGIN
			SET @salaryLevel = 'Low'
		END

		RETURN @salaryLevel
	END
	GO
-------------------------------------------------------------------05

CREATE PROCEDURE usp_EmployeesBySalaryLevel(@receivedLevel VARCHAR(16))
AS
	SELECT E.FirstName, E.LastName
	FROM Employees AS E
	WHERE @receivedLevel = dbo.ufn_GetSalaryLevel(E.Salary)
	GO
-------------------------------------------------------------------06

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
	BEGIN
		DECLARE @characterCounter INT = 0;
		DECLARE @loopCounter INT = @setOfLetters
		
		WHILE (@loopCounter - 1) != 0
		BEGIN
			
		END
	END