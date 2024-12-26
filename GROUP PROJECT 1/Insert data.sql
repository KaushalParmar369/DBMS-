INSERT INTO ShipmentMethod (ShipmentMethodID, ShipmentMode, ShipmentClass, ShipmentTime, FreightCost, DateModified)
VALUES 
    (10, 'Air', 'Overnight', '3 days', 45.00, '2022-10-02'),
    (20, 'Ground', 'Standard', '4 days', 40.00, '2022-09-04'),
    (30, 'Pickup', 'Priority', 'Same day', 60.00, '2022-09-05'),
    (40, 'Air', 'Standard', '5 days', 82.00, '2022-09-06'),
    (50, 'Air', 'Priority', '2 days', 75.00, '2022-09-07'),
    (60, 'Ground', 'Overnight', '1 day', 88.00, '2022-09-08'),
    (70, 'Air', 'Standard', '3 days', 50.00, '2022-09-09'),
    (80, 'Ground', 'Priority', '2 days', 110.00, '2022-09-10'),
    (90, 'Pickup', 'Standard', 'Same day', 55.00, '2022-09-11'),
    (100, 'Pickup', 'Priority', '2 days', 98.00, '2022-09-12');

		INSERT INTO OrderStatus (OrderStatusID, Description, DateModified)
VALUES 
    (110, 'Processing Order', '2022-10-05'),
    (120, 'Preparing to Ship', '2022-10-06'),
    (130, 'In Transit', '2022-10-07'),
    (140, 'Delayed', '2022-10-08'),
    (150, 'Delivered', '2022-10-09'),
    (160, 'Processing Order', '2022-10-10'),
    (170, 'Preparing to Ship', '2022-10-11'),
    (180, 'In Transit', '2022-10-12'),
    (190, 'Delayed', '2022-10-13'),
    (200, 'Delivered', '2022-10-14');

	INSERT INTO CustomerOrder (
    OrderID,
    CustomerID,
    PaymentID,
    OrderStatusID,
    ShipmentMethodID,
    ShippingAddressID,
    SubTotal,
    Tax,
    TotalPaid,
    DatePaid,
    EstDateShipped,
    ActualDateShipped,
    DateModified
)
VALUES 
    (300, 501, 21, 110, 10, 5, 100.00, 10.00, 110.00, '2019-09-27', '2020-08-28', '2020-08-28', '2023-09-26'),
    (301, 502, 36, 120, 20, 6, 150.00, 15.00, 165.00, '2019-09-28', '2023-08-29', '2023-09-29', '2023-09-26'),
    (302, 503, 47, 130, 30, 7, 120.00, 12.00, 132.00, '2021-09-29', '2023-09-30', '2023-09-30', '2023-09-26'),
    (303, 504, 45, 140, 40, 8, 90.00, 9.00, 99.00, '2023-09-30', '2020-10-01', '2023-10-01', '2023-09-26'),
    (304, 505, 52, 150, 50, 9, 200.00, 20.00, 220.00, '2023-10-01', '2020-10-02', '2020-10-02', '2021-09-26'),
    (305, 506, 13, 160, 60, 10, 75.00, 7.50, 82.50, '2020-10-02', '2023-10-03', '2023-10-03', '2023-09-26'),
    (306, 507, 20, 170, 70, 11, 180.00, 18.00, 198.00, '2023-10-03', '2021-10-04', '2021-10-04', '2023-09-26'),
    (307, 508, 41, 180, 80, 12, 100.00, 10.00, 110.00, '2020-10-04', '2023-10-05', '2023-10-05', '2023-09-26'),
    (308, 509, 62, 190, 90, 13, 120.00, 12.00, 132.00, '2019-10-05', '2020-10-06', '2020-10-06', '2021-09-26'),
    (309, 510, 84, 200, 100, 14, 150.00, 15.00, 165.00, '2023-10-06', '2023-10-07', '2023-10-07', '2023-09-26');

	
	INSERT INTO Category (ProductCategoryID, CategoryName, DESCRIPTION, DateModified)
VALUES 
    (2000, 'Accessory', 'Accessory products', '2020-10-04'),
    (2001, 'Perishable', 'Perishable Products', '2020-09-06'),
    (2002, 'Miscellaneous', 'Miscellaneous products', '2021-09-08'),
    (2003, 'Machinery', 'Machinery products', '2020-12-10'),
    (2004, 'Perishable', 'Perishable products', '2020-12-11'),
    (2005, 'Accessory', 'Accessory products', '2022-09-12'),
    (2006, 'Miscellaneous', 'Miscellaneous products', '2023-09-14'),
    (2007, 'Machinery', 'Machinery Parts', '2023-12-15'),
    (2008, 'Perishable', 'Perishable products', '2019-09-16'),
    (2009, 'Machinery', 'Machinery Parts', '2019-09-17');


	INSERT INTO Product (ProductID, Description, ProductCategoryID, Package, WeightQty, WeightUnits, Price, Dimensions, DateModified)
VALUES 
    (4000, 'Mangoes', 2000, 'Foil', 50, 'Kilogram', 20.00, '10x10x5', '2021-09-26'),
    (4001, 'Badminton', 2001, 'Box', 750, 'Gram', 30.00, '12x12x8', '2020-09-26'),
    (4002, 'Television', 2002, 'bag', 5, 'Kilogram', 15.00, '8x8x3', '2019-09-26'),
    (4003, 'Fridge', 2003, 'Gift box', 25, 'Kilogram', 40.00, '15x15x10', '2022-09-26'),
    (4004, 'Blanket', 2004, 'N/A', 1500, 'Gram', 50.00, '20x20x15', '2019-09-26'),
    (4005, 'Candle', 2005, 'Foil bag', 600, 'Gram', 25.00, '12x12x6', '2018-09-26'),
    (4006, 'Chocolate', 2006, 'Tin', 500, 'Gram', 35.00, '14x14x9', '2019-09-26'),
    (4007, 'Air Fryer', 2007, 'Paper bag', 2550, 'Gram', 18.00, '9x9x4', '2023-09-26'),
    (4008, 'Laptop', 2008, 'Gift box', 1500, 'Gram', 45.00, '18x18x12', '2022-09-26'),
    (4009, 'Rose', 2009, 'N/A', 1000, 'Gram', 60.00, '22x22x18', '2021-09-26');

	INSERT INTO Review (ProductReviewID, CustomerID, ProductID, Rating, Title, Description, ReviewDate)
VALUES 
    (600, 501, 4000, 5, 'Great Product!','Delicious', '2021-09-20'),
    (601, 502, 4001, 3, 'Good Quality', 'Totally good', '2021-07-22'),
    (602, 503, 4002, 5, 'Awesome', 'Good screen', '2022-05-21'),
    (603, 504, 4003, 4, 'Great Product', 'Value for money', '2023-09-22'),
    (604, 505, 4004, 5, 'Quiet Good','Very comfortable',  '2022-09-23'),
    (605, 506, 4005, 1, 'Not worth it', 'Totally waste',  '2022-09-24'),
    (606, 507, 4006, 5, 'Delicious', 'Very tasty',  '2023-09-25'),
    (607, 508, 4007, 2, 'Not good', 'Not purchaseable', '2021-09-24'),
    (608, 509, 4008, 5, 'Value for money', 'Totally good', '2023-09-22'),
    (609, 510, 4009, 1, 'Bad', 'No need to buy','2023-09-25');

	
	INSERT INTO ProductSelection (ProductID, OrderID, UnitPriceSold, DateModified)
VALUES 
    (4000, 300, 15.00, '2021-09-10'),
    (4001, 301, 25.00, '2016-09-12'),
    (4002, 302, 45.00, '2018-09-06'),
    (4003, 303, 30.00, '2021-09-15'),
    (4004, 304, 100.00, '2020-09-16'),
    (4005, 305, 20.00, '2019-09-18'),
    (4006, 306, 65.00, '2022-09-19'),
    (4007, 307, 28.00, '2023-09-25'),
    (4008, 308, 35.00, '2021-09-14'),
    (4009, 309, 10.00, '2022-09-21');


