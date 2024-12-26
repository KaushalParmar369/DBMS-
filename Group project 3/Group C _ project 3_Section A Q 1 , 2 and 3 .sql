Q1----A(Part)----
CREATE TABLE Allergy (
    AllergyID INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    AllergyName VARCHAR(100) NULL,
    AllergyDescription VARCHAR(255) NULL
);

CREATE TABLE Employee (
    EmployeeID INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    -- Add other employee details as needed
);
----STEP 2----
CREATE TABLE EmployeeAllergy (
    EmployeeAllergyID INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    EmployeeID INTEGER NOT NULL,
    AllergyID INTEGER NOT NULL,
    EpiPen BIT NOT NULL, -- Assuming EpiPen is represented as a binary (1 or 0)
    -- Add other relevant fields as needed

    CONSTRAINT FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT FK_Allergy FOREIGN KEY (AllergyID) REFERENCES Allergy(AllergyID)
);



-- Step 3. Insert Allergy with Allergy data from EmployeePersonal table 
INSERT INTO Allergy(AllergyName, AllergyDescription)
SELECT DISTINCT AllergyName, AllergyDescription 
FROM EmployeePersonal
WHERE AllergyName IS NOT NULL
AND AllergyName NOT IN (SELECT AllergyName FROM Allergy);

-- Step 4. Insert records into EmployeeAllergy with original relationship between employee and their allergy
INSERT INTO EmployeeAllergy(PersonalID, AllergyID)
SELECT E.PersonalID, A.AllergyID 
FROM EmployeePersonal E
JOIN Allergy A ON E.AllergyName = A.AllergyName
WHERE E.AllergyName IS NOT NULL;

--Setp 5. Drop Allergy column in table EmployeePersonal 

ALTER TABLE EmployeePersonal
DROP COLUMN AllergyName, AllergyDescription

