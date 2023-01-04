create database sales_insights;

use sales_insights;

CREATE TABLE  customers (
	customer_Code INT  AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	customer_Name varchar(50),
 	customer_Type varchar(25)
);

INSERT into customers (
				customer_Name,
				customer_Type
			) values 
				('Thomson','Buyers'),
				('George','New Customers'),
				('Peter','Wholesale dealers');
                    
SELECT 
    *
FROM
    customers;
    
CREATE TABLE  sales_date (
	s_Date date NOT NULL PRIMARY KEY UNIQUE,
 	Cy_date date default NULL,
 	s_Year int default null,
 	month_name varchar(15) default null,
 	Date_yy_mmm date default null

);

INSERT into sales_date (
				s_Date,
                Cy_date,
                s_Year,
                month_name,
                Date_yy_mmm
			) values 
				('2019-5-06','2020-3-31',2020,'May','2019-5-06'),
                ('2019-6-15','2020-3-31',2020,'June','2019-6-15'),
                ('2020-1-25','2020-3-31',2020,'January','2020-1-25'),
				('2020-1-06','2020-3-31',2020,'January','2020-1-06'),
				('2020-3-16','2020-3-31',2020,'March','2020-3-16'),
                ('2020-4-26','2021-3-31',2021,'April','2020-4-26'),
                ('2020-5-13','2021-3-31',2021,'May','2020-5-13'),
                ('2020-6-08','2021-3-31',2021,'June','2020-6-08'),
                ('2020-7-25','2021-3-31',2021,'July','2020-7-25');
SELECT 
    *
FROM
    sales_date;
    
CREATE TABLE market (
 	Market_Code varchar(20) NOT NULL PRIMARY KEY UNIQUE,
 	Markets_Name VARCHAR(100) default null,
 	Zone varchar(20) default null
);

INSERT into market (
				Market_Code,
				Markets_Name,
				Zone
			) values 
				('MAR 001','Nilgiris','Chennai'),
				('MAR 002','Reliance','Chennai'),
				('MAR 003','Spencer','Bangalore');
                    
SELECT 
    *
FROM
    market;
    
CREATE TABLE product (
 	product_Code varchar(20) NOT NULL PRIMARY KEY UNIQUE,
 	product_Type VARCHAR(100) default null
);

INSERT into product (
				product_Code,
				product_Type
			) values 
				('PRO 001','Beverages'),
				('PRO 002','Sweets'),
				('PRO 003','Sea Food');
                    
SELECT 
    *
FROM
    product;

CREATE TABLE transactions (
 	Product_Code varchar(20),
 	customer_Code int,
 	Market_Code varchar(20),
 	order_Date date,
 	sales_quantity float,
 	sales_Amount float,
 	Currency varchar(20),
 	profit_Margin_Percentage float,
 	profit_Margin float,
 	cost_Price float
);

INSERT into transactions (
				 	Product_Code,
					customer_Code,
					Market_Code,
					order_Date,
					sales_quantity,
					sales_Amount,
					Currency,
					profit_Margin_Percentage,
					profit_Margin,
					cost_Price
			) values 
				('PRO 001',1,'MAR 001','2019-5-06',4,45.00,'inr',22.54,9.00,36.00),
				('PRO 002',2,'MAR 002','2019-6-15',6,145.00,'inr',43.84,45.00,100.00),
				('PRO 003',3,'MAR 003','2020-1-25',8,150.00,'dollar',62.14,60.00,90.00),
                ('PRO 001',1,'MAR 001','2020-1-06',3,84.00,'dollar',45.54,48.00,36.00),
                ('PRO 002',2,'MAR 002','2020-3-16',14,223.00,'dollar',59.04,43.00,180.00),
                ('PRO 003',3,'MAR 003','2020-4-26',10,345.00,'dollar',83.54,100.00,245.00),
                ('PRO 001',1,'MAR 001','2020-5-13',5,116.00,'dollar',30.54,27.00,89.00),
                ('PRO 002',1,'MAR 002','2020-6-08',7,216.00,'dollar',30.54,27.00,189.00),
                ('PRO 003',1,'MAR 003','2020-7-25',15,280.00,'dollar',30.54,42.00,238.00);
                    
SELECT 
    *
FROM
    transactions;
    
# 	Show all customer records
select * from customers;

#	Show total number of customers
select COUNT(customer_Code) as customer_count from customers;

# 	Show all  transactions records
select * from transactions;

# 	Show transactions where currency is US dollars
select * from transactions where Currency = 'dollar';

#	Show transactions in 2020 join by date table
select t.*,sd.* from transactions t join sales_date sd on sd.s_Date = t.order_Date where sd.s_Year = 2020;

#	Show total revenue in year 2020
select SUM(t.sales_Amount) from transactions t join sales_date sd on sd.s_Date = t.order_Date where sd.s_Year = 2020;

#	Show total revenue in year 2020, January Month.
select SUM(t.sales_Amount) from transactions t  join sales_date sd on sd.s_Date = t.order_Date where sd.s_Year = 2020 and sd.month_name = 'January';

#	Show total revenue in year 2020 in Chennai
select SUM(t.sales_Amount) from transactions t join market m on m.Market_Code = t.Market_Code where m.Zone = 'Chennai';