CREATE TABLE Users(
Id BIGINT PRIMARY KEY IDENTITY,
Username VARCHAR(30) NOT NULL UNIQUE,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(MAX),
LastLoginTime DATETIME,
IsDeleted BIT,
)

INSERT INTO Users (Username, [Password], ProfilePicture,
 LastLoginTime, IsDeleted) VALUES
('Stamat', '123', NULL, CONVERT(datetime,'22-05-2018', 103), 0),
('Gosho', '1234', NULL, CONVERT(datetime,'12-05-2018', 103), 0),
('Pesho', '543', NULL, CONVERT(datetime,'22-06-2018', 103), 0),
('Vankata', '12345', NULL, CONVERT(datetime,'01-05-2018', 103), 0),
('Kircata', '6543', NULL, CONVERT(datetime,'22-03-2018', 103), 0)

ALTER TABLE Users
ADD CONSTRAINT CHK_ProfilePicture CHECK (DATALENGTH(ProfilePicture) <= 900 * 1024)

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC074EBEAEA2

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id, Username)

ALTER TABLE Users
ADD DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT CHK_UsernameLength CHECK (LEN(Username) >= 3)