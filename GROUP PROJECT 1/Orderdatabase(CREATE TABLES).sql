

CREATE TABLE Shipmentmethod (
ShipmentMethodID INT PRIMARY KEY,
ShipmentMode VARCHAR(40),
ShipmentClass VARCHAR(40),
ShipmentTime VARCHAR(30),
FreightCost DECIMAL(10,3),
DateModified DATE,
)

CREATE TABLE OrderStatus (
OrderStatusID INT PRIMARY KEY,
Description TEXT,
DateModified DATE,
)

CREATE TABLE CustomerOrder (
OrderID INT PRIMARY KEY,
CustomerID INT,
PaymentID INT,
OrderStatusID INT, 
ShipmentMethodID INT, 
ShippingAddressID VARCHAR(40),
SubTotal NUMERIC,
Tax NUMERIC,
TotalPaid NUMERIC,
DatePaid DATE,
EstDateShipped DATE,
ActualDateShipped DATE,
DateModified DATE,
FOREIGN KEY (ShipmentMethodID) REFERENCES ShipmentMethod (ShipmentMethodID),
FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID),
);


CREATE TABLE Category (
ProductCategoryID INT PRIMARY KEY,
CategoryName VARCHAR(30),
DESCRIPTION TEXT,
DateModified DATE,
)

CREATE TABLE PRODUCT (
ProductID INT PRIMARY KEY,
Description TEXT,
ProductCategoryID INT,
Package VARCHAR(50),
WeightQty VARCHAR(20),
WeightUnits VARCHAR(20),
Price NUMERIC(8,2),
Dimensions VARCHAR(20),
DateModified DATE,
FOREIGN KEY (ProductCategoryID) REFERENCES Category (ProductCategoryID), 
)

CREATE TABLE REVIEW (
ProductReviewID INT PRIMARY KEY, 
CustomerID INT,
ProductID INT,
Rating VARCHAR(20),
Title VARCHAR(20), 
DESCRIPTION TEXT,
ReviewDate Date,
FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID),
)

CREATE TABLE ProductSelection (
ProductID INT,
OrderID INT, 
UnitPriceSold NUMERIC,
DateModified DATE,
FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID),
FOREIGN KEY (OrderID) REFERENCES CustomerOrder (OrderID),
)

