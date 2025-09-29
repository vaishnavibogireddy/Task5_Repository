# Task 5: SQL Joins (Inner, Left, Right, Full)

## Objective
The goal of this task is to practice **SQL Joins** (INNER, LEFT, RIGHT, FULL) and understand how data from multiple tables can be combined.

## Tools Used
- MySQL Workbench  
- Database: 'custom'

## Steps Performed

### 1. Created Database and Tables
## SQL code
CREATE DATABASE custom;
USE custom;

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
## 2. Inserted Sample Data
## SQL code
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
## Queries and Results
# INNER JOIN
## Customers who placed orders:
## SQL code
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
Output Example

Name	Product	Amount
Alice	Laptop	60000
Alice	Tablet	20000
Bob	Mobile	15000
Charlie	Headphones	3000

## LEFT JOIN
## All customers (with or without orders):
## SQL code
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
# Output Example:

Name	Product	Amount
Alice	Laptop	60000
Alice	Tablet	20000
Bob	Mobile	15000
Charlie	Headphones	3000
David	NULL	NULL

# RIGHT JOIN
## All orders with customer details:
## SQL code
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
# Output Example

Name	Product	Amount
Alice	Laptop	60000
Alice	Tablet	20000
Bob	Mobile	15000
Charlie	Headphones	3000

## FULL OUTER JOIN
All customers + all orders (matched where possible):
(MySQL doesn’t support FULL OUTER JOIN directly, so I used UNION of LEFT + RIGHT)
# SQL code
SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.Name, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
Output Example

Name	Product	Amount
Alice	Laptop	60000
Alice	Tablet	20000
Bob	Mobile	15000
Charlie	Headphones	3000
David	NULL	NULL

## Key Learnings
INNER JOIN → Only matching rows.

LEFT JOIN → All rows from left table + matching rows from right.

RIGHT JOIN → All rows from right table + matching rows from left.

FULL OUTER JOIN → All rows from both tables (simulated using UNION in MySQL).

## Deliverables
T5_SQL_script.sql (SQL script with all queries)












ChatGPT can make mistakes. Check important info.
