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

SELECT * FROM Employees AS E
	JOIN EmployeesProjects AS E
	ON 