CREATE DATABASE Minions

USE Minions
GO

CREATE TABLE Minions(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
Age INT NOT NULL
)
GO

CREATE TABLE Towns(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL
)
GO

ALTER TABLE dbo.Minions 
ADD CONSTRAINT FK_Town FOREIGN KEY (TownId)
REFERENCES Towns(Id)
GO

ALTER procedure [dbo].[spInsertDeletedIntoTBLContent]
@ContentID int, 
SET IDENTITY_INSERT tbl_content ON
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')
SET IDENTITY_INSERT tbl_content OFF
GO