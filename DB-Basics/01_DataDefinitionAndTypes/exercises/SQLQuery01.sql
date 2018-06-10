CREATE DATABASE TableRelations

USE TableRelations

CREATE TABLE Persons(
	PersonID INT NOT NULL,
	FirstName VARCHAR(32),
	Salary DECIMAL(7, 2),
	PassportID INT
)

CREATE TABLE Passports(
	PassportID INT NOT NULL,
	PassportNumber VARCHAR(8)
)

INSERT INTO Persons VALUES
	(1, 'Roberto', 43300.00, 102),
	(2, 'Tom', 56100.00, 103),
	(3, 'Yana', 60200.00, 101)


INSERT INTO Passports VALUES
	(101, 'N34FG21B'),
	(102, 'K65LO4R7'),
	(103, 'ZE657QP2')

ALTER TABLE Passports
	ADD CONSTRAINT PK_Passports
	PRIMARY KEY(PassportID)

ALTER TABLE Persons
	ADD CONSTRAINT PK_Persons
	PRIMARY KEY (PersonID)

ALTER TABLE Persons
	ADD CONSTRAINT FK_Persons
	FOREIGN KEY (PassportID)
	REFERENCES Passports(PassportID)
--------------------------------------------------------------01

CREATE TABLE Models(
	ModelID INT NOT NULL,
	[Name] VARCHAR(32),
	ManufacturerID INT NOT NULL
)

CREATE TABLE Manufacturers(
	ManufacturerID INT NOT NULL,
	[Name] VARCHAR(8),
	EstablishedOn DATE
)

INSERT INTO Manufacturers VALUES
	(1, 'BMW', '07/03/1916'),
	(2, 'Tesla', '01/01/2003'),
	(3, 'Lada', '01/05/1966')

INSERT INTO Models VALUES
	(101, 'X6', 1),
	(102, 'i6', 1),
	(103, 'Model S', 2),
	(104, 'Model X', 2),
	(105, 'Model 3', 2),
	(106, 'Nova', 3)


ALTER TABLE Manufacturers
	ADD CONSTRAINT PK_Manufacturers
	PRIMARY KEY (ManufacturerID)
	
ALTER TABLE Models
	ADD CONSTRAINT PK_Models
	PRIMARY KEY (ModelID)

ALTER TABLE Models
	ADD CONSTRAINT FK_ModelsManufacturer
	FOREIGN KEY (ManufacturerID)
	REFERENCES Manufacturers(ManufacturerID)

-------------------------------------------------------------------------02

CREATE TABLE Students(
	StudentID INT NOT NULL,
	[Name] VARCHAR(32)
)

CREATE TABLE Exams(
	ExamID INT NOT NULL,
	[Name] VARCHAR(32)
)

CREATE TABLE StudentsExams(
	StudentID INT NOT NULL,
	ExamID INT NOT NULL
)


INSERT INTO Students VALUES
	(1, 'Mila'),
	(2, 'Toni'),
	(3, 'Ron')

INSERT INTO Exams VALUES
	(101, 'SpringMVC'),
	(102, 'Neo4j'),
	(103, 'Oracle 11g')

ALTER TABLE Students
	ADD CONSTRAINT PK_Students
	PRIMARY KEY (StudentID)

ALTER TABLE Exams
	ADD CONSTRAINT PK_Exams
	PRIMARY KEY (ExamID)

ALTER TABLE StudentsExams
	ADD CONSTRAINT PK_StudentsExams
	PRIMARY KEY (StudentID, ExamID)

ALTER TABLE StudentsExams
	ADD CONSTRAINT FK_Students
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID)

ALTER TABLE StudentsExams
	ADD CONSTRAINT FK_Exams
	FOREIGN KEY (ExamID)
	REFERENCES Exams(ExamID)

INSERT INTO StudentsExams VALUES
	(1, 101),
	(1, 102),
	(2, 101),
	(3, 103),
	(2, 102),
	(2, 103)
-----------------------------------------------------------03

CREATE TABLE Teachers(
	TeacherID INT NOT NULL,
	[Name] VARCHAR(32),
	ManagerID INT
)

INSERT INTO Teachers VALUES
	(101, 'John', NULL),
	(102, 'Maya', 106),
	(103, 'Silvia', 106),
	(104, 'Ted', 105),
	(105, 'Mark', 101),
	(106, 'Greta', 101)


ALTER TABLE Teachers
	ADD CONSTRAINT PK_Teachers
	PRIMARY KEY (TeacherID)

ALTER TABLE Teachers
	ADD CONSTRAINT FK_Teachers
		FOREIGN KEY (ManagerID)
		REFERENCES Teachers(TeacherID)

