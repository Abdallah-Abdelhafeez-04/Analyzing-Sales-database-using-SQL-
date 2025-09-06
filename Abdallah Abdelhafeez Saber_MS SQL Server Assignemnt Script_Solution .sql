-- CrCreate Database
CREATE DATABASE SalesDB;
GO

USE SalesDB;
GO

-- 1. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    City NVARCHAR(50)
);


-- Insert ~30 Customers (with dirty data)
INSERT INTO Customers (FirstName, LastName, Email, Phone, City) VALUES
('Ahmed','Ali','ahmed.ali@gmail.com','01012345678','Cairo'),
('mohamed','Hassan','mohamed.hassan@gmail.com','01022345678','Giza'),
('  Sara ','Adel','sara.adel@@yahoo.com','+201024567890','Alexandria'),
('Ali','  Khaled','ali.khaled@gmail','01134567890','cairo'),
('Nour','Samir','nour.samir@gmail.com','01056789','Aswan'),
('Mohamed','Ali','mohamed.ali@gmail.com','01012345678','Cairo'),
('Rana','Mostafa','rana.mostafa@yahoo.com',' 01098765432','Tanta'),
('Hassan','Omar','hassan.omar@hotmail.com','0102345678','Mansoura'),
('Mai','Khaled','Mai.Khaled@gmail.com',NULL,'Cairo'),
('Youssef','Hany','you--ssef@gmail.com','0120000000','Cairo'),
('Omar','Fathy','omar.fathy@outlook.com','01033344455','Giza'),
('Laila','Nabil','laila_nabil@gmailcom','0112000999','Cairo'),
('Aya','Mohsen','aya..mohsen@yahoo.com','0107778888','Alex'),
('mona','Ibrahim','mona.ibrahim@hotmail.com','0109998887','giza'),
('Ehab','Adel','ehab.adel@@hotmail.com','NULL','Luxor'),
('Mariam','Samy','mariam_samy@gmail.com','01150060070','Cairo'),
('Karim','Fouad','karim fouad@gmail.com','0155553333','Port Said'),
('Salma','Reda','salma_reda@gmail','01022233344','Zagazig'),
('Mohamed','Salah','msalah@@liverpool.com','0111222333','Cairo'),
('Yara','Ahmed','yara.ahmed@yahoo.com','0104445556','Cairo'),
('Huda','Ali','huda.ali#gmail.com','0108889990','Fayoum'),
('Khaled','Mahmoud','khaled.mahmoud@','0122003300','Giza'),
('Fatma','Saad','fatma_saad@gmail.com','0107008009','القاهرة'),
('Tamer','Hany','tamer.hany@gmail.com','0106005004','Cairo'),
('Mona','Saeed','mona.saeed@yahoo.com','NULL','Sharm El-Sheikh'),
('Hossam','Adel','hossam.adel@hotmail.com','0110030030','Asyut'),
('Nada','Tarek','nada.tarek@gmail.com','0150001112','Alexandria'),
('Mo7amed','Khalifa','mo7amed.khalifa@outlook.com','0103332221','Cairo'),
('Amr','Yassin','amr.yassin.com','0102233445','Cairo'),
('Reem','Fathy','reem.fathy@ null .com','0127778889','cairo');


-- 2. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);


-- Insert ~30 Products
INSERT INTO Products (ProductName, Category, Price) VALUES
('Samsung Galaxy S21','Mobiles',15000.50),
('Iphone 13 Pro','Mobiles',NULL),
('Hp Laptop ','Laptops',22000),
('Lenovo IdeaPad',' laptops ',18500),
('Macbook Pro','Laptops',45000.75),
('Dell XPS','Laptops',42000),
('Sony Headphones','Accessories',2500),
('Wireless Mouse','Accessories',300.5),
('Charger','Accessories',100),
('Screen Protector',' accessories',NULL),
('iPad Pro','Tablets',22000),
('Samsung Tablet','Tablets',15000),
('Huawei Y9','Mobiles',8000),
('Nokia 3310','mobiles',NULL),
('Apple Watch','Wearables',9500),
('Samsung Watch','Wearables',8500),
('Xiaomi Powerbank','Accessories',500),
('Sony PS5','Gaming',NULL),
('Xbox Series X','Gaming',19000),
('Nintendo Switch','Gaming',11000),
('Canon Camera','Electronics',27000),
('Nikon Camera',' electronics ',26500),
('Airpods Pro','Accessories',4000),
('Bluetooth Speaker',' accessories ',1200),
('TV LG 55inch','HomeAppliance',NULL),
('TV Samsung 65"','HomeAppliance',35000),
('Sharp AC','HomeAppliance',12000),
('Toshiba Fridge','HomeAppliance',NULL),
('Philips Iron','HomeAppliance',850),
('Moulinex Blender','HomeAppliance',NULL);





-- 3. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(12,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Insert ~30 Orders (some nulls, wrong totals, future dates)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1,'2023-01-15',15000.50),
(2,'2023-02-20',NULL),
(3,'2025-12-01',20000),
(4,'2023-03-10',45000.75),
(5,'2023-03-11',NULL),
(6,'2023-04-01',NULL),
(7,'2023-04-15',300.5),
(8,NULL,1000),
(9,'2023-06-01',42000),
(10,'2023-07-10',0),
(11,'2023-07-11',NULL),
(12,'2023-07-12',15000),
(13,'2023-08-01',9500),
(14,'2023-08-03',12000),
(15,'2023-08-05',NULL),
(16,'2023-09-01',NULL),
(17,'2023-09-03',2000),
(18,'2023-09-05',NULL),
(19,'2023-09-07',30000),
(20,'2023-10-01',45000),
(21,'2023-10-10',NULL),
(22,'2023-10-11',0),
(23,'2023-10-12',18500),
(24,'2023-11-01',NULL),
(25,'2023-11-03',22000),
(26,'2023-11-05',NULL),
(27,'2023-11-07',1500),
(28,'2023-11-09',NULL),
(29,'2023-12-01',12000),
(30,'2023-12-05',NULL);


-- 4. OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert ~30 OrderDetails (with duplicates, nulls, negatives)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1,1,1),
(1,7,2),
(2,2,1),
(3,4,1),
(3,4,1), 
(4,5,1),
(5,6,1),
(6,8,2),
(7,9,-1), 
(8,10,1),
(9,3,1),
(10,2,NULL),
(11,11,1),
(12,12,2),
(13,13,3),
(14,14,1),
(15,15,2),
(16,16,NULL),
(17,17,2),
(18,18,1),
(19,19,1),
(20,20,3),
(21,21,1),
(22,22,-2),
(23,23,1),
(24,24,4),
(25,25,2),
(26,26,NULL),
(27,27,1),
(28,28,1),
(29,29,5),
(30,30,2);


UPDATE Customers SET FirstName = REPLACE (FirstName,'Mo7amed' , 'Mohamed');


-- Questions
-- 1. Select all columns from Customers table.

SELECT UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING((TRIM(FirstName)),2,LEN(FirstName))) AS FirstName ,

    UPPER(LEFT(TRIM(LastName),1)) 
        + LOWER(SUBSTRING((TRIM(LastName)),2,LEN(LastName)))  AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE TRIM(Email)
    END AS Email,
    COALESCE(NULLIF(TRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(RTRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(TRIM(City),2,LEN(City)))
    END AS City
FROM Customers;


-- 2. Show only FirstName and City from Customers.

SELECT UPPER(LEFT(TRIM(FirstName),1)) 
    + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,    
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(LTRIM(RTRIM(City)),2,LEN(City)))
    END AS City FROM Customers ;

-- 3. Display all distinct cities from the Customers table.

SELECT DISTINCT  
   CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(LTRIM(RTRIM(City)),2,LEN(City)))
    END AS City FROM Customers ;  

-- 4. Find customers who live in Cairo.

SELECT  UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,
 
    UPPER(LEFT(TRIM(LastName),1)) 
        + LOWER(SUBSTRING(TRIM(LastName),2,LEN(LastName))) AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE TRIM(Email)
    END AS CleanedEmail,
    COALESCE(NULLIF(TRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(TRIM(City),2,LEN(City)))
    END AS City
FROM Customers WHERE City = 'Cairo' ;

-- 5. Get all customers who live in Cairo OR Giza.

SELECT   UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,
 
    UPPER(LEFT(LTRIM(RTRIM(LastName)),1)) 
        + LOWER(SUBSTRING(TRIM(LastName),2,LEN(LastName))) AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE LTRIM(RTRIM(Email))
    END AS CleanedEmail,
    COALESCE(NULLIF(TRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City)),1) + LOWER(SUBSTRING(LTRIM(RTRIM(City)),2,LEN(City)))
    END AS City
FROM Customers  WHERE City IN ('Cairo','Giza');

-- 6. Get customers whose CustomerID is between 2 and 6.

SELECT    UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,
 
    UPPER(LEFT(TRIM(LastName),1)) 
        + LOWER(SUBSTRING(TRIM(LastName),2,LEN(LastName))) AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE TRIM(Email)
    END AS CleanedEmail,
    COALESCE(NULLIF(TRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(TRIM(City),2,LEN(City)))
    END AS City
FROM Customers  WHERE CustomerID BETWEEN 2 AND 6 ;

-- 7. Find customers with Phone IN ('01012345678','0120000000').

SELECT  UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,
 
    UPPER(LEFT(TRIM(LastName),1)) 
        + LOWER(SUBSTRING(TRIM(LastName),2,LEN(LastName))) AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE TRIM(Email)
    END AS CleanedEmail,
    COALESCE(NULLIF(RTRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(LTRIM(RTRIM(City)),2,LEN(City)))
    END AS City
FROM Customers WHERE Phone IN ('01012345678','0120000000') ;

-- 8. Get customers whose FirstName starts with 'M'

SELECT   UPPER(LEFT(TRIM(FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(FirstName),2,LEN(FirstName))) AS FirstName,
 
    UPPER(LEFT(TRIM(LastName),1)) 
        + LOWER(SUBSTRING(TRIM(LastName),2,LEN(LastName))) AS LastName,

    CASE 
        WHEN Email IS NULL OR Email NOT LIKE '%@%.%' 
             OR Email LIKE '%@' OR Email LIKE '%..%' 
        THEN 'Invalid Email'
        ELSE TRIM(Email)
    END AS CleanedEmail,
    COALESCE(NULLIF(TRIM(Phone),'NULL'),'Unknown') AS Phone,
    CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(LTRIM(RTRIM(City)),2,LEN(City)))
    END AS City
FROM Customers WHERE FirstName LIKE 'M%' ;

-- 9. Select all orders where TotalAmount IS NULL.

SELECT OrderID, COALESCE(CONVERT(VARCHAR(10), NULLIF(OrderDate, ''), 120), 'Unknown') AS OrderDate,
    TotalAmount FROM Orders  WHERE TotalAmount IS NULL OR TotalAmount = 0;
    
-- 10. Show all orders where TotalAmount > 20000 AND CustomerID < 6.

SELECT OrderID, CustomerID,
    COALESCE(NULLIF(TotalAmount, 0), 0) AS TotalAmount,
    CASE 
        WHEN OrderDate IS NULL OR OrderDate > GETDATE() THEN 'Unknown'
        ELSE CONVERT(VARCHAR(10), OrderDate, 120)
    END AS OrderDate
FROM Orders 
WHERE  COALESCE(NULLIF(TotalAmount, 0), 0) > 20000 AND CustomerID < 6;

-- 11. Show all products where Category = 'Laptops' OR Category = ' laptops '.

SELECT ProductID, ProductName, Price,
    CASE 
        WHEN TRIM(LOWER(Category)) = 'mobiles'       THEN 'Mobiles'
        WHEN TRIM(LOWER(Category)) = 'laptops'       THEN 'Laptops'
        WHEN TRIM(LOWER(Category)) = 'accessories'   THEN 'Accessories'
        WHEN TRIM(LOWER(Category)) = 'tablets'       THEN 'Tablets'
        WHEN TRIM(LOWER(Category)) = 'wearables'     THEN 'Wearables'
        WHEN TRIM(LOWER(Category)) = 'gaming'        THEN 'Gaming'
        WHEN TRIM(LOWER(Category)) = 'electronics'   THEN 'Electronics'
        WHEN TRIM(LOWER(Category)) = 'homeappliance' THEN 'HomeAppliance'
        ELSE 'Unknown'
    END AS CleanedCategory FROM Products
WHERE TRIM(LOWER(Category)) = 'laptops';

-- 12. Replace extra spaces in Customer FirstName and display cleaned names.

SELECT TRIM(FirstName) AS "cleaned names" FROM Customers;

-- 13. Convert all City names to UPPERCASE.

SELECT UPPER (
        CASE 
        WHEN LOWER(TRIM(City)) IN ('cairo','القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(City)) = 'giza' THEN 'Giza'
        WHEN LOWER(TRIM(City)) IN ('alex','alexandria') THEN 'Alexandria'
        ELSE UPPER(LEFT(TRIM(City),1)) + LOWER(SUBSTRING(TRIM(City),2,LEN(City)))
    END ) AS   "UPPERCASE City names" FROM Customers ;

-- 14. Count how many orders each customer has.
    
SELECT c.CustomerID,TRIM(c.FirstName) AS FirstName,TRIM(c.LastName) AS LastName ,COUNT(OrderID) AS "Number of orders " FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID,LTRIM(RTRIM(c.FirstName)),TRIM(c.LastName) ;

-- 15. Find the average price of products in the Products table.

SELECT AVG (Price) AS "AVerage Price of Products" FROM Products ;

-- 16. Show the maximum TotalAmount from Orders.

SELECT MAX(TotalAmount) AS " maximum TotalAmount" FROM Orders ;

-- 17. Get the sum of all TotalAmount values (ignoring NULLs).

SELECT SUM(COALESCE(TotalAmount, 0)) AS TotalSales FROM Orders;
  
-- 18. List customers with more than 1 order using GROUP BY and HAVING.

SELECT c.CustomerID,c.FirstName,c.LastName ,COUNT(OrderID) AS "Number of orders " FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID,c.FirstName,c.LastName HAVING COUNT(OrderID) > 1 ;

-- 19. Join Orders with Customers and show Customer Name + OrderDate + TotalAmount.

SELECT c.CustomerID,CONCAT (
    UPPER(LEFT(TRIM(c.FirstName), 1)) 
        + LOWER(SUBSTRING(TRIM(c.FirstName), 2, LEN(c.FirstName))) , ' ' ,
    UPPER(LEFT(TRIM(c.LastName), 1)) 
        + LOWER(SUBSTRING(TRIM(c.LastName), 2, LEN(c.LastName))) ) AS "Customer Name"  ,
    CASE 
        WHEN o.OrderDate IS NULL OR o.OrderDate > GETDATE() THEN 'Unknown'
        ELSE CONVERT(VARCHAR(10), o.OrderDate, 120)
    END AS OrderDate,

    COALESCE(NULLIF(o.TotalAmount, 0), 0) AS  TotalAmount FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID ;

-- 20. Get the top 5 most expensive products ordered.

SELECT TOP 5  p.ProductID,
    TRIM(p.ProductName) AS ProductName,
    TRIM(p.Category) AS Category,
    TRY_CAST(NULLIF(TRIM(p.Price), '') AS DECIMAL(18,2)) AS Price
FROM Products p JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE TRY_CAST(p.Price AS DECIMAL(18,2)) IS NOT NULL ORDER BY Price DESC;

-- 21. Get the top 5 customers (FirstName + LastName) who spent the highest total amount in 2023. 
--     [ignore orders will NULL or 0 | clean customer names by removing any space | sort results by total sepnt) 

SELECT TOP 5  UPPER(LEFT(TRIM(c.FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(c.FirstName),2,LEN(c.FirstName))) AS FirstName,
    UPPER(LEFT(TRIM(c.LastName),1)) 
        + LOWER(SUBSTRING(TRIM(c.LastName),2,LEN(c.LastName)))  AS LastName, 
SUM(COALESCE(NULLIF(o.TotalAmount,0),0)) AS "Total Spent" , o.OrderDate 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
WHERE LEFT (o.OrderDate , 4) = '2023'
 AND o.TotalAmount IS NOT NULL
 AND o.TotalAmount > 0
GROUP BY  UPPER(LEFT(TRIM(c.FirstName),1)) 
        + LOWER(SUBSTRING(TRIM(c.FirstName),2,LEN(c.FirstName)))  ,UPPER(LEFT(TRIM(c.LastName),1)) 
        + LOWER(SUBSTRING(TRIM(c.LastName),2,LEN(c.LastName))) , o.OrderDate
ORDER BY  SUM(COALESCE(NULLIF(o.TotalAmount,0),0)) DESC ;
   
-- 22. For each product category, calcualte: Total sales amount, average price of products sold, and number of orders
--     Show only categories that generated than 20,000 EGP in total sales 
--     Sort the output by the Total Sales Amount from largest to smallest

SELECT 
    UPPER(LEFT(TRIM(p.Category),1)) 
        + LOWER(SUBSTRING(TRIM(p.Category),2,LEN(p.Category))) AS Category,
    SUM(COALESCE(NULLIF(o.TotalAmount,0),0)) AS TotalSalesAmount,
    AVG(TRY_CAST(NULLIF(LTRIM(p.Price), '') AS DECIMAL(18,2))) AS "Average Product Price",
    COUNT(DISTINCT o.OrderID) AS "Number Of Orders"
FROM Products p
JOIN OrderDetails d 
    ON p.ProductID = d.ProductID
JOIN Orders o 
    ON d.OrderID = o.OrderID
WHERE 
    TRY_CAST(p.Price AS DECIMAL(18,2)) IS NOT NULL
    AND o.TotalAmount IS NOT NULL
    AND o.TotalAmount > 0
GROUP BY 
    UPPER(LEFT(TRIM(p.Category),1)) 
        + LOWER(SUBSTRING(TRIM(p.Category),2,LEN(p.Category)))
HAVING 
    SUM(COALESCE(NULLIF(o.TotalAmount,0),0)) > 20000
ORDER BY TotalSalesAmount DESC;


-- 23.Find the orders with where the TotalAmount it > 10,000 but the sum of the product prices × quantity in OrderDetails does not match the TotalAmount.
--     Display OrderID, Customer Name, TotalAmount, and CalculatedAmount (from OrderDetails). 
--     Order the results by difference DESC.

SELECT  o.OrderID,
    CONCAT(UPPER(LEFT(TRIM(c.FirstName),1))
        + LOWER(SUBSTRING(TRIM(c.FirstName),2,LEN(c.FirstName))) ,
    UPPER(LEFT(TRIM(c.LastName),1)) 
        + LOWER(SUBSTRING(TRIM(c.LastName),2,LEN(c.LastName))) )  AS "Customer Name",
    COALESCE(NULLIF(o.TotalAmount,0),0) AS TotalAmount,
    SUM(
        ISNULL(od.Quantity,0) * 
        TRY_CAST(NULLIF(TRIM(p.Price), '') AS DECIMAL(18,2))) AS CalculatedAmount
FROM Orders o JOIN Customers c 
    ON o.CustomerID = c.CustomerID JOIN OrderDetails od 
    ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.TotalAmount > 10000
GROUP BY o.OrderID, o.TotalAmount, c.FirstName, c.LastName
HAVING 
    COALESCE(NULLIF(o.TotalAmount,0),0) !=
    SUM( ISNULL(od.Quantity,0) * TRY_CAST(NULLIF(LTRIM(RTRIM(p.Price)), '') AS DECIMAL(18,2)))
ORDER BY ABS(COALESCE(NULLIF(o.TotalAmount,0),0) - SUM(ISNULL(od.Quantity,0) * 
        TRY_CAST(NULLIF(TRIM(p.Price), '') AS DECIMAL(18,2)))) DESC;

-- 24. List all cities with number of customers | number of distinct orders | average order value (ignoring NULLS) 
--     Show only cities where average order values > 15,000 and number of customers >= 2
--     Sort by average order value desc

SELECT   CASE 
        WHEN LOWER(TRIM(c.City)) IN ('cairo', 'القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(c.City)) = 'giza'                THEN 'Giza'
        WHEN LOWER(TRIM(c.City)) IN ('alex', 'alexandria') THEN 'Alexandria'
        WHEN LOWER(TRIM(c.City)) = 'tanta'               THEN 'Tanta'
        WHEN LOWER(TRIM(c.City)) = 'mansoura'            THEN 'Mansoura'
        WHEN LOWER(TRIM(c.City)) = 'aswan'               THEN 'Aswan'
        WHEN LOWER(TRIM(c.City)) = 'luxor'               THEN 'Luxor'
        WHEN LOWER(TRIM(c.City)) = 'port said'           THEN 'Port Said'
        WHEN LOWER(TRIM(c.City)) = 'zagazig'             THEN 'Zagazig'
        WHEN LOWER(TRIM(c.City)) = 'fayoum'              THEN 'Fayoum'
        WHEN LOWER(TRIM(c.City)) = 'sharm el-sheikh'     THEN 'Sharm El-Sheikh'
        WHEN LOWER(TRIM(c.City)) = 'asyut'               THEN 'Asyut'
        ELSE TRIM(c.City)
    END AS City , COUNT(DISTINCT c.CustomerID) AS "Number of customers" , COUNT(DISTINCT o.OrderID) AS "Number of distinct orders" 
,AVG(NULLIF(o.TotalAmount,0)) AS "Average order value" FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY   CASE 
        WHEN LOWER(TRIM(c.City)) IN ('cairo', 'القاهرة') THEN 'Cairo'
        WHEN LOWER(TRIM(c.City)) = 'giza'                THEN 'Giza'
        WHEN LOWER(TRIM(c.City)) IN ('alex', 'alexandria') THEN 'Alexandria'
        WHEN LOWER(TRIM(c.City)) = 'tanta'               THEN 'Tanta'
        WHEN LOWER(TRIM(c.City)) = 'mansoura'            THEN 'Mansoura'
        WHEN LOWER(TRIM(c.City)) = 'aswan'               THEN 'Aswan'
        WHEN LOWER(TRIM(c.City)) = 'luxor'               THEN 'Luxor'
        WHEN LOWER(TRIM(c.City)) = 'port said'           THEN 'Port Said'
        WHEN LOWER(TRIM(c.City)) = 'zagazig'             THEN 'Zagazig'
        WHEN LOWER(TRIM(c.City)) = 'fayoum'              THEN 'Fayoum'
        WHEN LOWER(TRIM(c.City)) = 'sharm el-sheikh'     THEN 'Sharm El-Sheikh'
        WHEN LOWER(TRIM(c.City)) = 'asyut'               THEN 'Asyut'
        ELSE TRIM(c.City)END 
        HAVING AVG(NULLIF(o.TotalAmount,0)) > 15000 AND COUNT(DISTINCT c.CustomerID) >= 2
ORDER BY AVG(NULLIF(o.TotalAmount,0)) DESC ;

