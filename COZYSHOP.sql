create database COZYSHOP
USE COZYSHOP

-- CREATE EMPLOYEES TABLE --
Create table EMPLOYEES (EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
						FIRST_NAME VARCHAR (50) NOT NULL,
						LAST_NAME VARCHAR (50) NOT NULL,
						START_DATE DATE NOT NULL,
						POSITION VARCHAR (50)
						);
--INSERT VALUES INTO EMPOYEES TABLE
				insert into employees (first_name,last_name,START_DATE,position)  values
				('Okoh','Johnson','2024-02-01','Store manager'),
				('Judith','Amaka','2024-02-10','Lead artisan'),
				('Chuks','Chima','2024-02-11','Production assistant'),
				('Hassan','Rabiu','2024-02-12','Production assistant'),
				('Ngozi','Akama','2024-02-20','Sales associate'),
				('Gloria','Chibaba','2024-02-26','Shipping cordinator');
SELECT * FROM EMPLOYEES

-- CREATE CUSTOMERS TABLE 
			CREATE TABLE CUSTOMERS (CUSTOMER_ID INT PRIMARY KEY IDENTITY(1,1),
									FIRST_NAME VARCHAR (40) NOT NULL,
									LAST_NAME VARCHAR (40) NOT NULL,
									PHONE_NUMBER BIGINT UNIQUE,
									EMAIL VARCHAR (60) UNIQUE
									);
-- DROP THE UNIQUE CONSTRAINT 
	ALTER TABLE CUSTOMERS
	DROP CONSTRAINT UQ__CUSTOMER__D94A4FFB556EBA76; 

-- CHANGE DATATYPE OF PHONE_NUMBER COLUMN
	ALTER TABLE CUSTOMERS
	ALTER COLUMN PHONE_NUMBER BIGINT

-- ADD CONSTRAINT TO THE COLUMN
ALTER TABLE CUSTOMERS
ADD CONSTRAINT UQ__CUSTOMER_PHONE_NUMBER UNIQUE (PHONE_NUMBER);

DBCC CHECKIDENT('CUSTOMERS', RESEED, 0)

-- INSERT INTO CUSTOMERS TABLE
			INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL) VALUES
				('Karia','Parcia','kParcia@example.com'),
				('Mia','Clyn','m.garcia@example.com'),
				('Robert','Johnson','robert@example.com'),
				('Linda','Williams','linwill@providers.com'),
				('Micheal','Brown','micbrown21@webmail.com'),
				('Joe','Regan','jr12@gnail.com'),
				('Joshua','Kuch','joskuch32@webmail.com'),
				('Elizabeth','Jones','lizzy1jones@exa.com'),
				('William','Miller','will@webmail.com'),
				('Chima','Rowlenes','chima12row@webgraph.com'),
				('Susan','Martinez','sussy@123.com'),
				('Thomas','Vic','tomvic@webmail.com'),
				('Chris','Taylor','chris1255@webmail.com');
					INSERT INTO CUSTOMERS VALUES
				('Mondrich','Tyler','tyler12@webmail.com'),
				('Boyd','Lam','boydlam@webmail.com'),
				('Chima','Umeh','umehchi11@gmail.xyz'),
				('Onyi','Micheal','onyi12mike@gmail.xyz'),
				('Stanley','King','bigstan20@webmail.com'),
				('Coady','Rowlenes','coady1@gmail.xyz'),
				('Matson','Finch','matfinch111@gmail.abc')
				select * from CUSTOMERS


-- DROP CONSTRAINT 
ALTER TABLE CUSTOMERS
DROP CONSTRAINT UQ__CUSTOMER__D94A4FFBDBEF0246

ALTER TABLE CUSTOMERS
DROP COLUMN PHONE_NUMBER

ALTER TABLE CUSTOMERS
ADD PHONE_NUMBER BIGINT

SELECT * FROM CUSTOMERS

/*  UPDATE CUSTOMERS
SET PHONE_NUMBER = 08123456789
WHERE CUSTOMER_ID = 1

UPDATE CUSTOMERS
SET PHONE_NUMBER = 09123456789
WHERE CUSTOMER_ID =2
*/

 -- CREATE TABLE PRODUCTS
CREATE TABLE PRODUCTS ( PRODUCT_ID INT PRIMARY KEY IDENTITY(1, 1),
						PRODUCT_NAME VARCHAR (60) NOT NULL,
						CATEGORY VARCHAR (30) NOT NULL,
						SIZE INT NOT NULL,
						PRICE INT NOT NULL,
						STOCK_QUANTITY INT NOT NULL
						);
SELECT * FROM PRODUCTS
-- ADD COLUMN GENDER TO PRODUCTS TABLE AND ADD cHECK CONSTRAINT
ALTER TABLE PRODUCTS
ADD GENDER  VARCHAR(7) CHECK(GENDER IN ('Male','Female','Unisex'))


--INSERT VALUES INTO PRODUCTS TABLE
INSERT INTO PRODUCTS (  PRODUCT_NAME,CATEGORY,SIZE,PRICE,STOCK_QUANTITY, GENDER) VALUES
						('Sahara sand desert boot','Luxury',42,42000,5,'Male'),
						('Blush pink satin lounge','Indoor',38,18000,3,'Female'),
						('Emerald city velvet','Fashion',39,34000,1,'Female'),
						('Ontx studded moto','Fashion',39,42000,7,'Female'),
						('Kente patchwork high','Artisanal',40,31000,2,'Unisex'),
						('Sahara desert suede','Luxury',43,43000,4,'Male'),
						('Cozy cloud lounge','Indoor',37,18000,1,'Unisex'),
						('Adire high top','Artisanal',41,28000,5,'Unisex'),
						('Urban chic chelsea','Casual',43,53000,7,'Male'),
						('Velvet gale bootie','statement',38,35000,5,'Female'),
						('Gold dust party boot','Party',38,42000,2,'Female'),
						('Snakeskin print glam','statement',40, 36000,1,'Female'),
						('Fleece lined scuff','Indoor',44,12500,3,'Unisex'),
						('Denim street bootie','Casual',37,25000,1,'Female'),
						('Marbel gray knit','Indoor',42,18000,4,'Unisex'),
						('Ruby red peep toe','Indooe',39,15000,5,'Female')
UPDATE  PRODUCTS
SET CATEGORY = 'Indoor'
where product_id = 16

SELECT * FROM PRODUCTS
INSERT INTO PRODUCTS VALUES
						('Sunset ombre knit','indoor',39,18500,3,'Unisex'),
						('Pitch black minimal','Luxury',40,63000,10,'Male'),
						('Khaki commando','Outdoor',44,31000,11,'Male'),
						('Creamson flare boot','Party',38,31500,3,'Female')

						ALTER TABLE PRODUCTS
						ADD PRODUCT_ID INT FOREIGN KEY

-- CREATE ORDERS TABLE
-- ORDER_DATE COLUMN AUTO GENERATES TIME USING [DEFAULT SYSDATETIME].

CREATE TABLE ORDERS		(ORDER_ID INT PRIMARY KEY IDENTITY (1,1),
						 CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMERS,
						 ORDER_DATE DATETIME2 DEFAULT SYSDATETIME(),
						 TOTAL_AMOUNT DECIMAL(10,2),
						 STATUS VARCHAR (20) CHECK (STATUS IN ('Completed','Cancelled')) NOT NULL
						 );
SELECT * FROM ORDERS

INSERT INTO ORDERS VALUES 
					(1,'2026-01-01 10:02:25',42000,'Completed'),
					(2,'2026-01-02 11:08:25',42000,'Cancelled'),
					(3,'2026-01-03 11:20:40',84000,'Completed')
					INSERT INTO ORDERS VALUES 
					(4,'2026-01-04 10:02:25',31500,'Completed'),
					(5,'2026-01-05 11:08:25',18000,'Cancelled'),
					(6,'2026-01-06 09:20:40',63000,'Completed'),

					(7,'2026-01-06 12:02:25',50000,'Completed'),
					(8,'2026-01-07 15:08:25',18500,'Cancelled'),
					(9,'2026-01-07 13:20:40',84000,'Completed'),
					
					(10,'2026-01-08 16:22:25',31000,'Completed'),
					(11,'2026-01-09 14:25:25',15000,'Cancelled'),
					(12,'2026-01-10 17:55:40',84000,'Completed')
-----------------------------------------------------
INSERT INTO ORDERS (CUSTOMER_ID,ORDER_DATE,TOTAL_AMOUNT, STATUS) VALUES
					(13,'2026-01-11 10:03:40',12500,'Completed'),
					(14,'2026-01-11 12:55:40',25000,'Completed'),
					(15,'2026-01-11 13:33:10',18000,'Completed'),

					(16,'2026-01-12 14:55:40',15000,'Completed'),
					(17,'2026-01-13 10:20:40',18500,'Completed'),
					(18,'2026-01-13 11:00:00',63000,'Completed'),
					(19,'2026-01-13 11:20:40',31000,'Completed'),
					(20,'2026-01-13 12:00:00',31500,'Completed')

INSERT INTO ORDERS (CUSTOMER_ID,ORDER_DATE,TOTAL_AMOUNT, STATUS) VALUES
					(18,'2026-01-14 12:00:00',63000,'Completed'),
					(19,'2026-01-15 13:20:40',31000,'Completed'),
					(20,'2026-01-16 16:00:00',31500,'Completed')

					SELECT * FROM ORDER_ITEMS

			
					
-- CREATE ORDER_ITEMS TABLE 
CREATE TABLE ORDER_ITEMS (  ORDERITEMS_ID INT PRIMARY KEY IDENTITY (1,1),
							EMPLOYEE_ID INT FOREIGN KEY REFERENCES EMPLOYEES,
							ORDER_ID INT FOREIGN KEY REFERENCES ORDERS,
							PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCTS,
							QUANTITY INT NOT NULL,
							PRICE_AT_SALE DECIMAL (10,2) NOT NULL,
							ITEMS_STATUS VARCHAR (30) CHECK (ITEMS_STATUS IN ('Completed','Cancelled','Out of stock','Returned'))
							);
SELECT * FROM ORDER_ITEMS
INSERT INTO ORDER_ITEMS ( EMPLOYEE_ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE_AT_SALE,ITEMS_STATUS) VALUES
						(4,1,1,1,42000,'Completed'),
						(4,2,1,1,42000,'Cancelled'),
						(5,3,1,1,42000,'Completed'),(5,3,1,1,42000,'Completed')

INSERT INTO ORDER_ITEMS ( EMPLOYEE_ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE_AT_SALE,ITEMS_STATUS) VALUES
						(4,4,20,1,31500,'Completed'),
						(5,5,15,1,18000,'Cancelled'),
						(5,6,18,1,63000,'Completed'),

						(5,7,14,1,25000,'Completed'),(5,7,14,1,25000,'Completed'),
						(5,8,17,1,18500,'Cancelled'),

						(4,9,1,1,42000,'Completed'),
						(4,9,1,1,42000,'Completed'),
						(4,10,19,1,31000,'Completed'),
						(5,11,16,1,15000,'Cancelled'),
						(5,12,1,2,42000,'Completed'),(5,12,1,2,42000,'Completed')
						-------------------------
			( EMPLOYEE_ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE_AT_SALE,ITEMS_STATUS)
INSERT INTO ORDER_ITEMS VALUES
						(4,13,13,1,12500,'Completed'),
						(5,14,14,1,25000,'Completed'),
						(4,15,15,1,18000,'Completed'),

						(5,16,16,1,15000,'Completed'),
						(4,17,17,1,18500,'Completed'),
						(4,18,18,1,63000,'Completed'),

						(5,19,19,1,31000,'Completed'),
						(5,20,20,1,31500,'Completed')

SELECT * FROM PRODUCTS
SELECT * FROM CUSTOMERS
SELECT * FROM ORDERS
SELECT * FROM EMPLOYEES
SELECT * FROM ORDER_ITEMS


 /*  Display the full list of purchases showing:
    - Customer full name
    - Product name
    - Purchase date
    - Amount spent   */
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

-- List all customers who have not made any purchases.
SELECT c.FIRST_NAME,
c.LAST_NAME,
ITEMS_STATUS
FROM ORDERS O
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN ORDER_ITEMS T
ON O.ORDER_ID = T.ORDER_ID
WHERE  ITEMS_STATUS  = 'CANCELLED'

-- Show the total amount spent by each customer.
SELECT 
SUM(T. PRICE_AT_SALE) AS AMOUNT_SPENT
FROM ORDER_ITEMS T
LEFT jOIN ORDERS O
ON T.ORDER_ID = O.ORDER_ID
LEFT JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID

-- Identify the top two (2) most expensive products.
SELECT TOP 2 *
FROM PRODUCTS
ORDER BY PRICE DESC

-- List employees who started working before Februray 20th, 2026.
SELECT * 
FROM EMPLOYEES
WHERE START_DATE < '2024-02-20'


-- What is the total revenue generated from all purchases?
SELECT SUM(PRICE_AT_SALE) AS TOTAL_REVENUE
FROM 
ORDER_ITEMS
WHERE ITEMS_STATUS != 'CANCELLED'

-- TOP PERFROMING SALES_PERSON
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

-- RETRIEVE ALL ORDER_ITEMS NAMES, PRICE AND CUSTOMER WHO MADE THOSE ORDERS
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
NCN