-- B(PART)----1
CREATE FUNCTION LastNameFirst4
(
    @LastName VARCHAR(50),
    @FirstName VARCHAR(50)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FullName VARCHAR(100)
    SELECT @FullName = RTRIM(@LastName) + ',' + ' ' + RTRIM(@FirstName)
    RETURN @FullName
END;
GO

-- B--Q2---
CREATE VIEW EmployeesMedicalConcerns 
AS
SELECT dbo.LastNameFirst4(ES.LName, ES.FName) AS EmployeeName, A.AllergyName 
FROM Employees ES
JOIN EmployeePersonal EP ON ES.EmployeeID = EP.EmployeeID
JOIN EmployeeAllergy EA ON EP.PersonalID = EA.PersonalID
JOIN Allergy A ON EA.AllergyID = A.AllergyID;
GO

-- B---4---
ALTER TABLE Employees
ALTER COLUMN Salary CHAR(21);

CREATE PROCEDURE TransformSalary
(
    @InputEmployeeID INT
)
AS
BEGIN
    DECLARE @IntSalary INT
    DECLARE @OutputSalary CHAR(21)

    SELECT @IntSalary = Salary FROM Employees WHERE EmployeeID = @InputEmployeeID;
    SET @OutputSalary = '$' + CONVERT(CHAR(20), @IntSalary)
    UPDATE Employees SET Salary = @OutputSalary WHERE EmployeeID = @InputEmployeeID;
END;
GO

-- Execute the stored procedure
EXECUTE TransformSalary 1168;

SELECT * FROM Employees;
