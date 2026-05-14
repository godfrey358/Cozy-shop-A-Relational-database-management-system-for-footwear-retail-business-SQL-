# Cozy-shop-A-Relational-database-management-system-for-footwear-retail-business-SQL-
## PROJECT DESCRIPTION 
A robust SQL Sever relational database designed for foot wear retail business. With focus on data integrity, normalization and scalability, this project implements complex business logic, including data integrity constraints, employee performance tracking. It manages customers, products, orders and more.
# PROJECT OVERVIEW
As part of your final project, you are tasked with designing and building a 
relational database for CozyShop, a small business that sells handmade booties. 
You will model the business requirements into tables, create an ERD (Entity Relationship Diagram), 
build the database using SQL, insert sample data, and run analytical queries to extract insights.
Run queries to generate insights that help CozyShop grow.
					## QUESTION  
I wants you to track information on these 
- customers (first name, last name, email), 
- employees (first name, last name, start date, position held),
- products, 
- purchases customers make (which customer, when it was purchased, for how much money).

### -- Display the full list of purchases showing:
-- Customer full name
-- Product name
-- Purchase date
-- Amount spent
- List all customers who have not made any purchases.

- Show the total amount spent by each customer.

- Identify the top two (2) most expensive products.

- List employees who started working before Februray 20th, 2026.

- What is the total revenue generated from all purchases?
- Top perfoming sales_person
  # SQL QUERIES TO ANSWER QUESTIONS 
``` SQL
SELECT
C.FIRST_NAME + ' ' + C.LAST_NAME AS CUSTOMER_NAME,
P.PRODUCT_NAME,
T.PRICE_AT_SALE,
O.ORDER_DATE
FROM PRODUCTS P
LEFT JOIN ORDER_ITEMS T
ON P.PRODUCT_ID = T.PRODUCT_ID
LEFT JOIN ORDERS O
ON T.ORDER_ID = O.ORDER_ID
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE PRICE_AT_SALE IS NOT NULL;
```
### List all customers who have not made any purchases.
```SQL
SELECT c.FIRST_NAME,
c.LAST_NAME,
ITEMS_STATUS
FROM ORDERS O
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN ORDER_ITEMS T
ON O.ORDER_ID = T.ORDER_ID
WHERE  ITEMS_STATUS  = 'CANCELLED'
```
### Show the total amount spent by each customer.
```SQL
SELECT 
SUM(T. PRICE_AT_SALE) AS AMOUNT_SPENT
FROM ORDER_ITEMS T
LEFT jOIN ORDERS O
ON T.ORDER_ID = O.ORDER_ID
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID
```

### Identify the top two (2) most expensive products.
```SQL
SELECT TOP 2 *
FROM PRODUCTS
ORDER BY PRICE DESC
```
### List employees who started working before Februray 20th, 2026.
```SQL
SELECT * 
FROM EMPLOYEES
WHERE START_DATE < '2024-02-20'
```

### What is the total revenue generated from all purchases?
```SQL
SELECT SUM(PRICE_AT_SALE) AS TOTAL_REVENUE
FROM 
ORDER_ITEMS
WHERE ITEMS_STATUS != 'CANCELLED'
```
### TOP PERFROMING SALES_PERSON
```SQL
SELECT 
E.EMPLOYEE_ID,
E.FIRST_NAME + '  ' + E.LAST_NAME AS EMPLOYEE_NAME,
COUNT(O.PRICE_AT_SALE) AS TOTAL_SALES
FROM ORDER_ITEMS O
LEFT JOIN EMPLOYEES E
ON O.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY
E.EMPLOYEE_ID,
E.FIRST_NAME,
E.LAST_NAME
ORDER BY TOTAL_SALES DESC
```
### RETRIEVE ALL ORDER_ITEMS NAMES, PRICE AND CUSTOMER WHO MADE THOSE ORDERS
```SQL
SELECT 
C.FIRST_NAME + '  ' + C.LAST_NAME AS CUSTOMER_NAME,
O.TOTAL_AMOUNT AS ORDER_TOTAL,
P.PRODUCT_NAME,
T.ITEMS_STATUS
FROM CUSTOMERS C
INNER JOIN ORDERS O
ON  C.CUSTOMER_ID = O.CUSTOMER_ID
INNER JOIN ORDER_ITEMS T
ON O.ORDER_ID = T.ORDER_ID 
INNER JOIN PRODUCTS P
ON T.PRODUCT_ID = P.PRODUCT_ID
--WHERE ITEMS_STATUS = 'CANCELLED'
```
## KEY FEATURES
- Robust relationship between customers, products,orders,employees amd order_items
- support for different products( e.g different sizes, sex)
- order tracking
- inventory management with low stock alerts
# DATABASE SCHEMA
## MAIN TABLES:
- CUSTOMERS
- PRODUCTS
- EMPLOYEES 
- ORDERS
- ORDER_ITEMS
# ER DIAGRAM (Included in the repository)
<img width="960" height="540" alt="Screenshot 2026-05-14 024919" src="https://github.com/user-attachments/assets/b401011f-f372-4aa9-b0c0-9ba183d8e641" />

# TECHNOLOGIES
## TOOLS: SQL SERVER
## SCRIPTS: Fully commented SQL files


