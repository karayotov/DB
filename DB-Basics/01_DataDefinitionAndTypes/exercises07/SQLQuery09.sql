USE Bank
GO

CREATE PROC USP_GetHoldersFullName
AS
	SELECT FirstName + ' ' + LastName AS FullName
	FROM AccountHolders

--------------------------------------------------------------------09

SELECT FirstName, LastName, Balance
	FROM AccountHolders AS AH
	JOIN Accounts AS A
	ON A.AccountHolderId = AH.Id