--Create Database
CREATE DATABASE sql_p1_retail_sales;

--Use Database
USE sql_p1_retail_sales;

--Create Table
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT * 
FROM retail_sales;

--Show first 10 entries from table
SELECT TOP 10 * 
FROM retail_sales;

   
--How many total entries we have ?
SELECT 
    COUNT(*) 
FROM retail_sales

-- Data Cleaning
--Finding fields with NULL value 
SELECT * FROM retail_sales
WHERE transactions_id IS NULL

SELECT * FROM retail_sales
WHERE sale_date IS NULL

SELECT * FROM retail_sales
WHERE sale_time IS NULL


SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
--Delete records having NULL value fields 
DELETE FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    

-- Data Exploration
-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales

--Which categories we have ?
SELECT DISTINCT category FROM retail_sales

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * 
FROM retail_sales
WHERE sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category='Clothing'
AND quantiy>3
AND FORMAT(CAST(sale_date AS DATE), 'yyyy-MM') = '2022-11';


SELECT *
FROM retail_sales
WHERE category='Clothing'
AND quantiy>3
AND YEAR(sale_date) = 2022
AND MONTH(sale_date) = 11;



ALTER TABLE retail_sales
ALTER COLUMN total_sale INT;

ALTER TABLE retail_sales
ALTER COLUMN transactions_id INT;

ALTER TABLE retail_sales
ALTER COLUMN sale_date DATE;

ALTER TABLE retail_sales
ALTER COLUMN customer_id INT;

ALTER TABLE retail_sales
ALTER COLUMN age INT;

ALTER TABLE retail_sales
ALTER COLUMN quantiy INT;

ALTER TABLE retail_sales
ALTER COLUMN price_per_unit INT;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category,SUM(total_sale) as Total_sale
FROM retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) as AVG_AGE_OF_BEAUTY_CATEGORY
FROM retail_sales
WHERE category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales
WHERE total_sale > 1000


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
category,
gender,
COUNT(*) as total_trans
FROM retail_sales
GROUP BY 
category,
gender;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    Sale_Year,
    Sale_Month,
    Avg_Sale
FROM (
    SELECT 
        YEAR(sale_date) AS Sale_Year,
        MONTH(sale_date) AS Sale_Month,
        AVG(total_sale) AS Avg_Sale,
        RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS Rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS RankedSales
WHERE Rank = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT TOP 5 
    customer_id, 
    SUM(total_sale) AS Total_Sales
FROM retail_sales
GROUP BY customer_id
ORDER BY Total_Sales DESC;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category, 
    COUNT(DISTINCT customer_id) AS Unique_Customers
FROM retail_sales
GROUP BY category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT 
  CASE 
    WHEN DATEPART(HOUR, sale_date) < 12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_date) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Shift,
  COUNT(*) AS Number_of_Orders
FROM retail_sales
GROUP BY 
  CASE 
    WHEN DATEPART(HOUR, sale_date) < 12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_date) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END;

