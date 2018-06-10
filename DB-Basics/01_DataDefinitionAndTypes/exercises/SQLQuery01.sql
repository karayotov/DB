
USE Diablo

CREATE TABLE [Persons](
	[PersonID] INT NOT NULL,
	[FirstName] VARCHAR(64),
	[Salary] DECIMAL(15,2),
	[PassportID] INT
)


CREATE TABLE [Passports](
	[PassportID] INT NOT NULL,
	[PassportNumber] VARCHAR(8),
)

INSERT INTO [Persons] VALUES

(1, 'Roberto', 43300.00, 102),
(2, 'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101)



INSERT INTO [Passports] VALUES

(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2')


ALTER TABLE Passports
ADD CONSTRAINT PK_PassportID
PRIMARY KEY (PassportID)


ALTER TABLE Persons
ADD CONSTRAINT PK_PersonID
PRIMARY KEY(PersonID)

ALTER TABLE Persons
ADD CONSTRAINT FK_PersonsPassport
FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)
----------------------------------------------------------------------------01

CREATE TABLE Manufacturers(
	ManufacturerID INT NOT NULL,
	[Name] VARCHAR(32),
	EstablishedOn DATE
)

CREATE TABLE Models(
	ModelID INT NOT NULL,
	[Name] VARCHAR(64),
	ManufacturerID INT NOT NULL
)

INSERT INTO Models VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3)


INSERT INTO Manufacturers VALUES

(1, 'BMW', '07/03/1916'),
(2, 'Tesla', '01/01/2003'),
(3, 'Lada', '01/05/1966')


ALTER TABLE Models
ADD CONSTRAINT PK_ModelsID
PRIMARY KEY (ModelID)


ALTER TABLE Manufacturers
ADD CONSTRAINT PK_ManufacturerID
PRIMARY KEY (ManufacturerID)

ALTER TABLE Models
ADD CONSTRAINT FK_ModelsManufacturers
FOREIGN KEY(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)

---------------------------------------------------------------------------02

CREATE TABLE Students(
	StudentID INT NOT NULL,
	[Name] VARCHAR(50)
)

CREATE TABLE Exams(
	ExamID INT NOT NULL,
	[Name] NVARCHAR(32)
)


ALTER TABLE Exams
	ADD CONSTRAINT PK_ExamID
	PRIMARY KEY (ExamID)

ALTER TABLE Students
	ADD CONSTRAINT PK_StudentId
	PRIMARY KEY (StudentID)
	
	 

CREATE TABLE StudentsExams(
	StudentId INT NOT NULL,
	ExamID INT NOT NULL
)


ALTER TABLE StudentsExams
	ADD CONSTRAINT PK_StudentsExamsID
	PRIMARY KEY (StudentID, ExamID)


ALTER TABLE StudentsExams
	ADD CONSTRAINT FK_Students 
	FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID) 

ALTER TABLE StudentsExams
	ADD CONSTRAINT FK_Exams 
	FOREIGN KEY (ExamID)
	REFERENCES Exams(ExamID)


INSERT INTO Students VALUES

	(1, 'Mila'),
	(2, 'Toni'),
	(3, 'Ron')

INSERT INTO Exams VALUES
	(101, 'SpringMVC'),
	(102, 'Neo4j'),
	(103, 'Oracle 11g')


INSERT INTO StudentsExams VALUES

	(1, 101),
	(1, 102), 
	(2, 101),
	(3, 103),
	(2, 102),
	(2, 103)

------------------------------------------------------------------------------------03
------------------------------------------------------------------------------------04

