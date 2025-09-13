-- Question 1 
CREATE TABLE Customers(OrderID INT, CustomerName VARCHAR(225));
CREATE TABLE CustomerProduct(OrderID INT, CustomerName VARCHAR(225),Product VARCHAR(225));
-- merge the broken down table info 
INSERT INTO Customers(OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM ProductDetail;
-- enter data into the 2n table
INSERT INTO CustomerProduct(OrderID, CustomerName, Product)
SELECT OrderID, CustomerName, SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1) AS Product
FROM ProductDetail
JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3) numbers ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1;

-- Question 2
CREATE TABLE Orders(OrderID INT PRIMARY KEY, CustomeName VARCHAR(225));
CREATE TABLE OrderDetail(OrderID INT, Product VARCHAR(225), Quantity INT, FOREIGN KEY(OrderID) REFERENCES Orders(OrderID));
-- merge the broken down table info
INSERT INTO Orders(OrderID, CustomeName)
SELECT DISTINCT OrderID, CustomeName
FROM OrderDetails;
-- enter data into the 2n table
INSERT INTO OrderDetail(OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
