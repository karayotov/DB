SELECT TOP(5) E.EmployeeID, E.JobTitle, E.AddressID, A.AddressText
	FROM Employees AS E
	JOIN Addresses AS A
	ON E.AddressID = A.AddressID
	ORDER BY AddressID
-------------------------------------------------------------01

SELECT TOP(50) FirstName, LastName, Name, AddressText 
	FROM Employees AS E
	JOIN Addresses AS A
	ON E.AddressID = A.AddressID
	JOIN Towns AS T
	ON A.TownID = T.TownID
	ORDER BY FirstName, LastName

-------------------------------------------------------------02

SELECT E.EmployeeID, E.FirstName, E.LastName, D.Name AS DepartmentID
	FROM Employees AS E
	JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
	WHERE D.Name LIKE 'Sales'
	ORDER BY E.EmployeeID

------------------------------------------------------------03

SELECT TOP(5) E.EmployeeID, E.FirstName, E.Salary, D.Name AS DepartmentName
	FROM Employees AS E
	LEFT JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
	WHERE E.Salary > 15000
	ORDER BY E.DepartmentID

-------------------------------------------------------------04

SELECT TOP(3) E.EmployeeID, E.FirstName FROM Employees AS E
	LEFT JOIN EmployeesProjects AS EP
	ON EP.EmployeeID = E.EmployeeID
	WHERE EP.ProjectID IS NULL
	ORDER BY E.EmployeeID

-------------------------------------------------------------05

SELECT E.FirstName, E.LastName, E.HireDate, D.Name AS DeptName
	FROM Employees AS E
	JOIN Departments AS D
	ON D.DepartmentID = E.DepartmentID
	WHERE (D.Name LIKE 'Sales' OR D.Name LIKE 'Finance') AND HireDate > '01/01/1999'
	ORDER BY HireDate

-------------------------------------------------------------06

SELECT TOP(5) E.EmployeeID, E.FirstName, P.Name AS ProjectName
	FROM Employees AS E
	JOIN EmployeesProjects AS EP
	ON EP.EmployeeID = E.EmployeeID
	JOIN Projects AS P
	ON EP.ProjectID = P.ProjectID
	WHERE P.StartDate > '08/13/2002' AND P.EndDate IS NULL
	ORDER BY E.EmployeeID
-------------------------------------------------------------07

SELECT E.EmployeeID, E.FirstName,
	CASE
		WHEN P.StartDate > '01/01/2005' THEN NULL
		ELSE P.Name
	END AS ProjectName
	FROM Employees AS E
	INNER JOIN EmployeesProjects AS EP
	ON EP.EmployeeID = E.EmployeeID
	INNER JOIN Projects AS P
	ON P.ProjectID = EP.ProjectID
	WHERE E.EmployeeID LIKE 24
	GO
-------------------------------------------------------------08

WITH CTE_Managers
	(ManagerID, ManagerName)
	AS
	(
		SELECT EmployeeID, FirstName
			FROM Employees
			WHERE EmployeeID LIKE 3 OR EmployeeID = 7
	)

SELECT E.EmployeeID, E.FirstName, C.ManagerID, C.ManagerName 
	FROM Employees AS E
	JOIN CTE_Managers AS C
	ON C.ManagerID = E.ManagerID
	ORDER BY EmployeeID
