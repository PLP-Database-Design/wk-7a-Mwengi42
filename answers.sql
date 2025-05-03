-- Assignment: Database Design and Normalization
-- Author: [Your Name]
-- File: answers.sql

-- ✅ Question 1: Achieving 1NF (First Normal Form)
-- Original ProductDetail table:
-- OrderID | CustomerName | Products
-- 101     | John Doe     | Laptop, Mouse
-- 102     | Jane Smith   | Tablet, Keyboard, Mouse
-- 103     | Emily Clark  | Phone

-- 🛠️ Transforming to 1NF:
-- Each row should represent a single product for an order

-- Create the normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert transformed data
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- ✅ Question 2: Achieving 2NF (Second Normal Form)
-- Original OrderDetails table contains partial dependency:
-- CustomerName depends only on OrderID (violating 2NF)

-- 🧩 Step 1: Create a separate table for Orders (to hold OrderID and CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique order data
INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

-- 🧩 Step 2: Create a new OrderDetails table with only data dependent on full key
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert order details
INSERT INTO OrderDetails_2NF VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails_2NF VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails_2NF VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails_2NF VALUES (103, 'Phone', 1);
