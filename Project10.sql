create database real_time_manufacture;

use real_time_manufacture;

CREATE TABLE  region (
 	region_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	region_Name varchar(50) NOT NULL
);

INSERT into region (
				region_Name
			) values 
				('Florida'),
				('Netherland'),
				('Dubai'),
                ('Bhaktapur Durbar Square'),
                ('Islamabad'),
                ('New Delhi'),
                ('Beijing'),
                ('Lucerne');
                    
SELECT 
    *
FROM
    region;
    
CREATE TABLE  countries (
 	country_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	country_Name varchar(50) NOT NULL,
 	region_Id int
);

INSERT into countries (
				country_Name,
                region_Id
			) values 
				('United States of America',1),
				('United Kingdom',2),
				('United Arab Emirates',3),
                ('Nepal',4),
                ('Pakisthan',5),
                ('India',6),
                ('China',7),
                ('Switzerland',8);
                    
SELECT 
    *
FROM
    countries;
    
CREATE TABLE  location (
 	location_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	address varchar(50) NOT NULL,
    postal_code varchar(25),
    city varchar(50),
    state varchar(50),
    country_Id int
);

INSERT into location (
				address,
                postal_code,
                city,
                state,
                country_Id
			) values 
				('AR Avenue,West street,Florida','AW 456','Chicago','Alaska',1),
				('Peak Road,Masachust,Netherland','DT 4565','Wales','England',2),
				('Building 1,Sheikh Rashid Colony','4567','Qusais','Sharjah',3),
                ('Bhaktapur Durbar Square','8765','Dhangadhi','Lumbini Province',4),
                ('Flat No 34,Ismail Building','LK 876','Lahore','Sindh',5),
                ('North Vihar,Kharagpur','GT 566 TH','Chandini Chauk','Kerala',6),
                ('Lhasa,Transcendent Tibet','H 789','Shanghai','Gansu',7),
                ('North Street,Lucerne','5677654','Geneva','Bern',8);
                    
SELECT 
    *
FROM
    location;
    
CREATE TABLE  warehouse (
	 	warehouse_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
		warehouse_Name varchar(50),
		location_Id int
);

INSERT into warehouse (
				 	warehouse_Name,
					location_Id
			) values 
				('Alaska W1',1),
				('England W1',2),
				('Kerala W1',6);
                    
SELECT 
    *
FROM
    warehouse;
    
CREATE TABLE  employee (
		employee_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
		first_Name varchar(50),
		last_Name varchar(50),
		email varchar(50),
		phone varchar(15),
		hire_Date date,
		manager_Id int,
		job_title varchar(50)
);

INSERT into employee (
				 	first_Name,
					last_Name,
                    email,
                    phone,
                    hire_Date,
                    manager_Id,
                    job_title
			) values 
				('Neethu','George','neethu@gmail.com','+566768','2020-1-7',1,'Purchase Manager'),
				('Neera','Sali','neera@gmail.com','+23456','2020-2-17',2,'Sales Manager'),
				('Simsy','Xavier','simsy@gmail.com','+123344','2020-3-19',0,'Sales Staff'),
                ('Jomol','Josy','jomol@gmail.com','+986678','2020-4-20',3,'Inventory Manager');
                    
SELECT 
    *
FROM
    employee;
    
CREATE TABLE  category (
 	category_Id INT  AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	category_Name varchar(50) NOT NULL
);

INSERT into category (
				category_Name
			) values 
				('Beverages'),
				('Sea Food'),
				('Sweets');
                    
SELECT 
    *
FROM
    category;
    
CREATE TABLE  product (
 	Product_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	Product_Name varchar(50) not null,
 	Product_Desc varchar(150),
 	Standard_Cost float,
 	List_Price float,
 	Category_Id int not null
);

INSERT into product (
				Product_Name,
                Product_Desc,
                Standard_Cost,
                List_Price,
                Category_Id
			) values 
				('Tea','high quality',8,10,1),
                ('Coffee','high quality',10,12,1),
				('Tuna','fresh',20,42,2),
                ('King Fish','fresh',32,45,2),
				('kaju burfy','home made',17,20,3),
                ('Laddu','home made',13,17,3);
                    
SELECT 
    *
FROM
    product;
    
CREATE TABLE  customers (
 	customer_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	customer_Name varchar(50) NOT NULL,
 	address varchar(50),
 	website varchar(50),
 	credit_Limit float
);

INSERT into customers (
				customer_Name,
				address,
                website,
                credit_Limit
			) values 
				('Thomson','AA Bhavan','https://thomson.com',1000),
				('George','Falcon Apartment','https://george.com',500),
				('Peter','West Street','https://peter.com',1500);
                    
SELECT 
    *
FROM
    customers;
    
CREATE TABLE  orders (
 	order_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	customer_Id int,
 	order_status varchar(10),
 	salesman_Id int,
 	order_Date date NOT NULL
);

INSERT into orders (
				customer_Id,
				order_status,
                salesman_Id,
                order_Date
			) values 
				(1,'paid',1,'2022-09-2'),
				(2,'pending',1,'2022-09-3'),
				(3,'paid',2,'2022-09-4');
                    
SELECT 
    *
FROM
    orders;
    
CREATE TABLE  order_items (
 	Order_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	item_Id INT,
 	product_Id int NOT NULL,
 	quantiy float Not Null,
 	unit_Price float Not Null
);

INSERT into order_items (
				item_Id,
				product_Id,
				quantiy,
                unit_Price
			) values 
				(1,1,2,6),
				(2,2,3,10),
				(3,3,1,23),
                (1,4,5,32),
                (2,5,13,13),
                (3,6,9,10);
                    
SELECT 
    *
FROM
    order_items;
    
CREATE TABLE  inventory (
 	product_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	Warehouse_Id int,
 	quantity float
);

INSERT into inventory (
				Warehouse_Id,
				quantity
			) values 
				(1,100),
				(2,200),
				(3,100),
                (1,100),
				(2,200),
				(3,100);
                    
SELECT 
    *
FROM
    inventory;
    
CREATE TABLE  contacts (
 	contact_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	first_Name varchar(50),
 	last_Name varchar(50),
 	email varchar(50),
 	phone varchar(15),
 	customer_Id int
);

INSERT into contacts (
				first_Name,
                last_Name,
				email,
                phone,
                customer_Id
			) values 
				('Keerthy','Krishna','keerthy@gmail.com','+567',1),
				('Athira','S','athira@gmail.com','+2345',2),
				('Reshma','Rajan','reshma@gmail.com','+97765',3);
                    
SELECT 
    *
FROM
    contacts;
    
# 	Retrieve all records from countries table
select * from countries;

# 	Retrieve all records from regions table
select * from region;

# 	Select all records from countries table by left joining with regions table using where condition in region name.
select c.*,r.* from countries c left join region r on c.region_Id = r.region_Id where region_Name = 'Dubai';

#	Select city from locations using where condition in country id.
select city from location where country_Id = 1;

# 	Select city, country id from location table, region id and region name from region table, country name from countries table by joining three tables
select l.city,l.country_Id,r.region_Id,r.region_Name,c.country_Name from location l join countries c on l.country_Id = c.country_Id join region r on r.region_Id = c.region_Id;

# 	Retrieve all records from the warehouse table
select * from warehouse;

# 	Select all data from region table where region id in countries table and  country id  in locations table
select * from region where region_Id IN (select region_Id from countries where country_Id IN (select country_Id from location));

