# Retail Sales Analysis with SQL Server

## 📊 Project Overview
This project contains SQL queries written for analyzing retail sales data using **SQL Server Management Studio (SSMS)**.  
The queries cover basic data retrieval, aggregation, filtering, ranking, and customer behavior analysis.

---

## 🗂️ Data Structure

**Table Name:** `retail_sales`

| Column Name    | Data Type | Description                     |
|----------------|------------|---------------------------------|
| transactions_id | INT       | Unique transaction ID           |
| sale_date     | DATE      | Date of sale (YYYY-MM-DD)        |
| customer_id   | INT       | Customer ID                      |
| age           | INT       | Age of the customer              |
| category      | VARCHAR   | Product category                  |
| quantity      | INT       | Quantity sold                    |
| price_per_unit | DECIMAL  | Price per unit                   |
| total_sale    | DECIMAL   | Total sale amount                 |
| cogs          | DECIMAL   | Cost of Goods Sold                |

---

## 📝 SQL Queries Included

- Show first 10 entries of the table
- Filter transactions by category, date, and quantity
- Calculate total sales per category
- Find average customer age per category
- Analyze monthly average sales
- Identify the best-selling month per year
- Find top 5 customers by total sales
- Count unique customers per category
- Categorize sales by shift (Morning, Afternoon, Evening)

---

## 🛠️ Technologies Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL (Transact-SQL)

---

## 📈 Sample Query Example
```sql
SELECT category, SUM(total_sale) AS Total_Sale
FROM retail_sales
GROUP BY category;
