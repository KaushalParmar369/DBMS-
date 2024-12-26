
CREATE DATABASE EMPLOYEES
GO

USE EMPLOYEES
GO

DROP DATABASE EMPLOYEES

---Question 2
CREATE TABLE Roles (
    RoleID INT NOT NULL PRIMARY KEY,
    PositionTitle VARCHAR(100),
    PositionDescription VARCHAR(255),
    ProbationLength NUMERIC(5,2),
    MinSalary INT,
    MaxSalary INT
 );


 CREATE TABLE Regions (
    RegionID INT NOT NULL PRIMARY KEY,
    RegionName VARCHAR(40)
 );

 CREATE TABLE Countries (
    CountryID INT NOT NULL PRIMARY KEY,
    RegionID INT NOT NULL,
    CountryName VARCHAR(50),
    CONSTRAINT FK_Countries_RegionID FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    CONSTRAINT CHK_CountryName CHECK (CountryName IN ('Canada', 'Columbia', 'Brazil', 'Uganda', 'Germany', 'India'))
);

 CREATE TABLE FacilityAddress (
    FacilityID INT IDENTITY(10, 1) PRIMARY KEY,
    CountryID  INT NOT NULL,
	FacilityName VARCHAR(80),
	CONSTRAINT FK__FacilityAddress_CountryID
	FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
 );

 CREATE TABLE EmployeeAddress (
    EmpAddressID INT IDENTITY(1000, 2) PRIMARY KEY,
    CountryID INT NOT NULL,
    HomeType VARCHAR(100),
    UnitNumber INT,
    CONSTRAINT FK__EmployeeAddress__CountryID
        FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);


CREATE TABLE [Address] (
    AddressID INT NOT NULL PRIMARY KEY,
    FacilityID INT  NOT NULL,
	StreetNumber VARCHAR(40),
	StreetName VARCHAR(40),
	StreetType VARCHAR(40),
	PostalCode VARCHAR(10),
	City VARCHAR(40),
	Province VARCHAR(40),
	CONSTRAINT FK__Address__FacilityID
	FOREIGN KEY (FacilityID) REFERENCES FacilityAddress(FacilityID)
);

 CREATE TABLE Departments (
    DepartmentID INT IDENTITY(20, 20) PRIMARY KEY,
    FacilityID  INT NOT NULL,
	DepartmentName VARCHAR(50),
	DepartmentDesc VARCHAR(100),
	CONSTRAINT FK__Departments__FacilityID
	FOREIGN KEY (FacilityID) REFERENCES FacilityAddress(FacilityID)
 );


CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1117, 17) PRIMARY KEY,
    RoleID INT NOT NULL,
    ManagerID INT,
    DepartmentID INT NOT NULL,
    EmpAddressID INT NOT NULL,
    FName VARCHAR(40),
    LName VARCHAR(40),
	Salary INT,
	HireDate DATE,
	PersonalEmail VARCHAR(80),
	PersonalPhoneNumber VARCHAR(40),
	CONSTRAINT FK__Employees__RoleID
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT FK__Employees__DepartmentID
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	CONSTRAINT FK__Employees__ManagerID
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID),
	CONSTRAINT FK__Employees__EmpAddressID
	FOREIGN KEY (EmpAddressID) REFERENCES EmployeeAddress(EmpAddressID)
);

CREATE TABLE Dependents(
    DependentID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
	Relationships VARCHAR(50),
	FName VARCHAR(50),
	LName VARCHAR(50), 
	DateOfBirth DATE,
	CONSTRAINT FK__Dependents__EmployeeID
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


CREATE TABLE EmployeePersonal (
    PersonalID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
	DateOfBirth DATE,
	SocialInsuranceNumber VARCHAR(10) NOT NULL,
	AllergyName VARCHAR(100), 
	AllergyDescription VARCHAR(500),
	EpiPen VARCHAR(50),
	DisabilityName VARCHAR(100),
	DisabilityDescription VARCHAR(255),
	Gender VARCHAR(10),
	CONSTRAINT FK__EmployeePersonal__EmployeeID
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


CREATE TABLE EmployeeContacts (
    EmpContactID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
	FacilityID INT,
	WorkExtension VARCHAR(20),
	OfficeNumber VARCHAR(20),
	CONSTRAINT FK__EmployeeContacts__EmployeeID
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	CONSTRAINT FK__EmployeeContacts__FacilityID
	FOREIGN KEY (FacilityID) REFERENCES FacilityAddress(FacilityID)
);

CREATE TABLE EmergencyContacts (
    ContactID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
	FName VARCHAR(50),
	LName VARCHAR(50),
	ContactNumber VARCHAR(50) DEFAULT '911',
	ContactAltNumber VARCHAR(50) DEFAULT '911',
	CONSTRAINT FK__EmergencyContacts__EmployeeID
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)

 );
 GO


-- Insert data into Roles table
INSERT INTO Roles (RoleID, PositionTitle, PositionDescription, ProbationLength, MinSalary, MaxSalary)
VALUES 
(9100,'Manager', 'Responsible for managing teams', 9.5, 60000, 80000),
(2000,'Developer', 'Software developer role', 6.5, 50000, 70000),
(3, 'Analyst', 'Data analyst position', 8.0, 45000, 60000),
(4000, 'HR Specialist', 'Human Resources specialist', 12.5, 48000, 65000),
(5000, 'Tester', 'Quality assurance tester', 4.5, 42000, 55000);
GO

-- Insert data into Regions table
INSERT INTO Regions (RegionID,RegionName)
VALUES 
(2110,'North America'),
(2200,'South America'),
(2300,'South America'),
(2400,'Africa'),
(2500,'Europe');
GO


-- Insert data into Countries table
INSERT INTO Countries (CountryID, RegionID, CountryName)
VALUES 
(8100, 2110, 'Canada'),
(1200, 2200, 'Columbia'),
(1300, 2300, 'Brazil'),
(1400, 2400, 'Uganda'),
(1500, 2500, 'Germany');
GO

-- Insert data into FacilityAddress table
INSERT INTO FacilityAddress (CountryID, FacilityName)
VALUES 
(8100, 'Headquarters'),
(1200, 'Regional Office'),
(1300, 'Tech Hub'),
(1400, 'Branch Office'),
(1500, 'Main Office');
GO

-- Insert data into EmployeeAddress table
INSERT INTO EmployeeAddress (CountryID, HomeType, UnitNumber)
VALUES 
(8100, 'House', 123),
(1200, 'Apartment', 456),
(1300, 'Condo', 789),
(1400, 'Duplex', 101),
(1500, 'Penthouse', 202);
GO


-- Insert data into Address table
INSERT INTO [Address] (AddressID,FacilityID, StreetNumber, StreetName, StreetType, PostalCode, City, Province)
VALUES
(4110, 10, '123', 'Main', 'Street', 'M1A1A1', 'Toronto', 'ON'),
(4200, 11, '456', 'Rue', 'Rivoli', '75001', 'Paris', 'Île-de-France'),
(4300, 12, '789', 'Nanjing', 'Road', '200001', 'Shanghai', 'Jiangsu'),
(4400, 13, '101', 'King', 'Street', 'M5H1A1', 'Kampala', 'Central Region'),
(4500, 14, '202', 'Kurfürstendamm', 'Avenue', '10117', 'Berlin', 'Berlin');
GO

-- Insert data into Departments table
INSERT INTO Departments (FacilityID, DepartmentName, DepartmentDesc)
VALUES 
(10, 'Development', 'Software Development Department'),
(11, 'HR', 'Human Resources Department'),
(12, 'Marketing', 'Marketing Department'),
(13, 'Operations', 'Operations Department'),
(14, 'Finance', 'Finance Department');
GO


-- Insert data into Employees table with ManagerID
INSERT INTO Employees (RoleID, ManagerID, DepartmentID, EmpAddressID, FName, LName, Salary, HireDate, PersonalEmail, PersonalPhoneNumber)
VALUES 
(9100, 1134, 20, 1000, 'John', 'Doe', 70000, '2022-01-01', 'john.doe@example.com', '555-1234'),
(2000, NULL, 40, 1002, 'Jane', 'Smith', 60000, '2022-02-15', 'jane.smith@example.com', '555-5678'),
(3, 1117, 60, 1004, 'Bob', 'Johnson', 55000, '2022-03-20', 'bob.johnson@example.com', '555-9876'),
(4000, NULL, 80, 1006, 'Alice', 'Williams', 65000, '2022-04-25', 'alice.williams@example.com', '555-4321'),
(5000, 1168, 100, 1008, 'Charlie', 'Brown', 50000, '2022-05-30', 'charlie.brown@example.com', '555-8765');
GO

-- Insert data into Dependents table
INSERT INTO Dependents (DependentID,EmployeeID, Relationships, FName, LName, DateOfBirth)
VALUES 
(5100, 1117, 'Child', 'Dependent1', 'Doe', '2010-03-15'),
(5200, 1134, 'Spouse', 'Dependent2', 'Smith', '1987-06-20'),
(5300, 1151, 'Child', 'Dependent3', 'Johnson', '2015-09-22'),
(5400, 1168, 'Spouse', 'Dependent4', 'Williams', '1990-12-10'),
(5500, 1185, 'Child', 'Dependent5', 'Brown', '2018-04-05');
GO


-- Insert data into EmployeePersonal table
INSERT INTO EmployeePersonal (PersonalID, EmployeeID, DateOfBirth, SocialInsuranceNumber, AllergyName, AllergyDescription, EpiPen, DisabilityName, DisabilityDescription, Gender)
VALUES 
(6100, 1117, '1990-05-15', '123456789', 'Pollen', 'Seasonal allergy', 'Yes', NULL, NULL, 'Male'),
(6200, 1134, '1985-08-20', '987654321', NULL, NULL, NULL, 'Hearing Impairment', 'Requires sign language interpreter', 'Female'),
(6300, 1151, '1992-02-10', '555555555', 'Peanuts', 'Allergic to peanuts', 'No', NULL, NULL, 'Male'),
(6400, 1168, '1988-11-25', '111111111', NULL, NULL, NULL, 'Mobility Impairment', 'Requires wheelchair', 'Female'),
(6500, 1185, '1995-04-30', '999999999', 'Seafood', 'Allergic to seafood', 'Yes', NULL, NULL, 'Male');
GO


-- Insert data into EmployeeContacts table
INSERT INTO EmployeeContacts (EmpContactID,EmployeeID, FacilityID, WorkExtension, OfficeNumber)
VALUES 
(7100, 1117, 10, 101, 1001),
(7200, 1134, 11, 201, 1003),
(7300, 1151, 12, 301, 1005),
(7400, 1168, 13, 401, 1007),
(7500, 1185, 14, 501, 1009);
GO


-- Insert data into EmergencyContacts table
INSERT INTO EmergencyContacts (ContactID, EmployeeID, FName, LName, ContactNumber, ContactAltNumber)
VALUES 
(3100, 1117, 'Emergency1', 'Contact1', '123-456-7890', '987-654-3210'),
(3200, 1134, 'Emergency2', 'Contact2', '111-222-3333', '444-555-6666'),
(3300, 1151, 'Emergency3', 'Contact3', '777-888-9999', '000-111-2222'),
(3400, 1168, 'Emergency4', 'Contact4', '333-444-5555', '666-777-8888'),
(3500, 1185, 'Emergency5', 'Contact5', '999-888-7777', '555-444-3333');

GO

SELECT * FROM Employees;
GO


---Query 4

UPDATE Roles
SET RoleID = 3000   -- GROUP C i.e. 3
WHERE RoleID = 3;
GO

---- Query 5

CREATE OR ALTER VIEW Supervisor2
AS
SELECT e.Fname AS Supervisor, m.Fname AS Subordinate FROM Employees e 
RIGHT JOIN
Employees m 
ON
e.EmployeeID = m.ManagerID
WHERE e.EmployeeID IS NULL OR e.EmployeeID = m.ManagerID;
GO

SELECT * FROM Supervisor2
GO

----Query 6
GO

CREATE VIEW EMPPERSONAL1
AS
SELECT
    EP.EmployeeID, EP.AllergyName, EP.AllergyDescription, EC.ContactID AS EmergencyContactPerson
FROM
    EMPLOYEEPERSONAL EP
LEFT JOIN
    EMERGENCYCONTACTS EC ON EP.EmployeeID = EC.EmployeeID
WHERE
    EC.ContactID IS NULL AND EP.AllergyName IS NOT NULL;
GO

SELECT * FROM EMPPERSONAL1;
GO



