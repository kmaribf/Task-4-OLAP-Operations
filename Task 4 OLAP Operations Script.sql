-- Task 4: OLAP Operations

-- 1. Database Creation: 

-- Creating a Database
CREATE DATABASE SalesAnalytics;
USE SalesAnalytics;

-- Creating a table 'Sales Sample'

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount DECIMAL(10,2)
);

-- 2. Data Creation

-- Inserting Values in the table 'Sales Sample' 

INSERT INTO sales_sample VALUES
(1, 'East', '2025-07-01', 10000),
(2, 'East', '2025-07-02', 15000),
(1, 'West', '2025-07-01', 8000),
(2, 'West', '2025-07-02', 7000),
(3, 'North', '2025-07-01', 9000),
(1, 'South', '2025-07-02', 9500),
(3, 'East', '2025-07-03', 11000),
(2, 'South', '2025-07-03', 7200),
(3, 'North', '2025-07-03', 8700),
(1, 'West', '2025-07-03', 6000);

-- 3. Perform OLAP Operations

-- a) Drill Down

SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;

-- b) Roll up

SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
ORDER BY Region;

-- c) Cube

SELECT 
    Product_Id,
    Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id, Region, Date
ORDER BY Product_Id, Region, Date;

-- d) Slice

SELECT * FROM sales_sample
WHERE Region = 'East';

SELECT * FROM sales_sample
WHERE Date = '2025-07-02';

-- e) Dice

SELECT * FROM sales_sample
WHERE Region IN ('East', 'West')
  AND Product_Id IN (1, 2)
  AND Date BETWEEN '2025-07-01' AND '2025-07-03';
  
-- --------------------------- THE END --------------------------------