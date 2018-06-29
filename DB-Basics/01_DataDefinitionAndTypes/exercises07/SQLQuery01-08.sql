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

CREATE OR ALTER FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
	BEGIN
		DECLARE @index INT = 1;
		DECLARE @currentChar CHAR(1)
		DECLARE @isComprised INT
		
		WHILE (@index <= LEN(@word))
		BEGIN
			SET @currentChar = SUBSTRING(@word, @index, 1)
			SET @isComprised = CHARINDEX(@currentChar, @setOfLetters)

			IF (@isComprised = 0)
			BEGIN
				RETURN 0
			END
			
			SET @index += 1
		END

		RETURN 1
	END
	GO
----------------------------------------------------------------------07


CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentID INT) AS
BEGIN
	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN 
	(
		SELECT EmployeeID
			FROM Employees
			WHERE DepartmentID = @departmentID
	)

	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT

	UPDATE Employees
		SET ManagerID = NULL
		WHERE ManagerID IN 
		(
			SELECT EmployeeID
				FROM Employees
				WHERE DepartmentID = @departmentID
		)
	UPDATE Departments
		SET ManagerID = NULL
		WHERE ManagerID IN 
		(
			SELECT EmployeeID
				FROM Employees
				WHERE DepartmentID = @departmentID
		)
	DELETE 
		FROM Employees
		WHERE DepartmentID = @departmentID

	DELETE
		FROM  Departments
		WHERE DepartmentID = @departmentID
	SELECT COUNT(*)
		FROM Employees
		WHERE DepartmentID = @departmentID
  
END

-----------------------------------------------------------------08

