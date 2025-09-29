-- Task 5: SQL Joins (Inner, Left, Right, Full)
-- Step 1: Create Database and Use It
CREATE DATABASE custom;
use custom;
-- Step 2: Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 3: Insert Data
INSERT INTO Customers VALUES
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Hyderabad');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 60000),
(102, 2, 'Mobile', 15000),
(103, 1, 'Tablet', 20000),
(104, 3, 'Headphones', 3000);

-- Step 4: INNER JOIN (customers who placed orders)
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Step 5: LEFT JOIN (all customers, even if no order)
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Step 6: RIGHT JOIN (all orders with customer details)
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Step 7: FULL OUTER JOIN (all customers + all orders)
-- MySQL does not support FULL OUTER JOIN directly
-- So I have used UNION of LEFT JOIN and RIGHT JOIN
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
