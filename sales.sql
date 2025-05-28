CREATE DATABASE COMPANY;
USE COMPANY;

-- Q1 Find all orders shipped via 'Economy' mode with a total amount gREATER THAN rS 25,000.as

SELECT * FROM SALES
WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;

-- Q2 Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

SELECT * FROM SALES
WHERE Category = 'Technology' and  Country = 'Ireland' and Order_Date > '2020-01-01';

-- Q3 List the top 10 most profitable sales transactions in descending order.

SELECT * FROM SALES
ORDER BY Unit_Profit DESC
LIMIT 10, 20;                -- skip 10 records,showing next 20 records

-- Q4 Find all customers whose name starts with 'J' and ends with 'n'.

SELECT  Order_ID ,Customer_Name FROM SALES
WHERE Customer_Name LIKE 'J%N';

-- Q5 retrieve all the products names that contain Acco anywhere in name

SELECT * FROM SALES
WHERE Product_Name LIKE '%Acco%';

-- Q6 top 5 cities with highest total sales amount

SELECT City, SUM(Total_Amount) AS total_Sales FROM SALES
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q7 Display the second set of 10 records for customer name and tot amt  in desc

SELECT Customer_Name,Total_Amount FROM SALES
ORDER  BY Total_Amount DESC
LIMIT 10, 10;

-- Q8 find tot rev,avg unit cost,tot no of orders

SELECT SUM(TOTAL_AMOUNT) AS 'total revenue',
AVG(Unit_Cost) AS 'average unit cost', COUNT(ORDER_ID) AS 'total number of orders' FROM SALES;

-- Q9 Cont unique no of regions
SELECT COUNT(DISTINCT(Region)) as uniq_reg FROM SALES;

-- Q10 FIND the no of orders placed by each customer

SELECT Customer_Name, COUNT(Order_ID) AS Order_Count FROM SALES 
GROUP BY Customer_Name
ORDER  BY Order_Count DESC;
 
-- ROW NO,RANK,DENSE RANK,N TYPE
-- Q11 Rank 5 products based on tot sales using rank()--JOIN(UNION INTERSEPCT),RANKING,WINDOWS,

SELECT Product_Name,SUM(Total_Amount) as Total_Sales,
RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS 'sales rank' FROM SALES
GROUP BY Product_Name
LIMIT 5;


