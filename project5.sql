create database store;

use store;

CREATE TABLE users (
    user_Id int NOT NULL auto_increment PRIMARY KEY  UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50),
    user_password VARCHAR(50),
    type_Id int,
    location_Id int,
    phone_number VARCHAR(15)
);
    
INSERT into users (
				first_name,
				last_name,
                username,
                user_password,
                type_Id,
                location_Id,
                phone_number
			) values 
				('Joohi','Jayasankar','joohi_1','j00123',1,1,'564567'),
				('Minnu','Joshy','minnu_1','m00123',2,2,'909876655'),
				('Varsha','Vipin','varsha_1','v00123',2,3,'5678542'),
				('Reny','SR','reny_1','r00123',1,4,'986788355'),
				('Neethu','Anaz','nitu_1','n00123',1,5,'93457889');
                
select * from users;

CREATE TABLE user_type (
    type_Id int NOT NULL auto_increment PRIMARY KEY  UNIQUE,
    u_type VARCHAR(20)
);

INSERT into user_type (
					u_type
				) values 
					('admin'),
					('front-end');
                        
SELECT 
    *
FROM
    user_type;

CREATE TABLE location (
    location_Id int NOT NULL auto_increment PRIMARY KEY  UNIQUE,
    province VARCHAR(20),
    city VARCHAR(20),
    street VARCHAR(20)
);
                        
INSERT into location (
					province,
                    city,
                    street
				) values 
					('kerala','TVM','kDpuram'),
					('Tamil Nadu','Nagarcoil','SS street'),
                    ('Kerala','pattom','YU lane'),
                    ('Kerala','EKM','JK road'),
                    ('Tamil Nadu','Eerod','LER West');
                    
select * from location;

CREATE TABLE manager (
    manager_Id int NOT NULL AUTO_INCREMENT PRIMARY KEY  UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    location_Id int,
    email VARCHAR(50),
    phone_number VARCHAR(15)
);

INSERT into manager (
                    first_name,
                    last_name,
					location_Id,
					email,
                    phone_number
				) values 
					("Ram Kumar",'varma',2,'ramkumar@gmail.com','+3435564'),
					("Krishna",'Moorthy',1,'moorthy@gmail.com','+89 5345436'),
                    ("Mahesh",'yadav',3,'mahesh@gmail.com','+12 3456');
                    
select * from manager;

CREATE TABLE category (
    category_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY  UNIQUE,
    cat_name VARCHAR(25),
    cat_description VARCHAR(255)
);

INSERT into category (
					cat_name,
                    cat_description
				) values 
					('Bakery','It includes snacks,sandwiches,sweets'),
					('Beverage','It includes tea,coffee,Juices'),
                    ('Meat','Fresh meat is available here'),
                    ('Sea Food','We are providinf fresh fish');
                    
select * from category;

CREATE TABLE customer (
    customer_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY  UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    phone_number VARCHAR(15)
);

INSERT into customer (
					first_name,
                    last_name,
                    phone_number
				) values 
					('Keerthy','Krishna','+56567668'),
					('Athira','S','+368988'),
                    ('Reshma','Rajan','+2345566332'),
                    ('Sreeja','George','+9899887');
                    
SELECT 
    *
FROM
    customer;

CREATE TABLE employees (
    employee_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(50),
    phone_number VARCHAR(15),
    job_Id INT,
    hired_date DATE,
    location_Id INT
); 	

INSERT into employees (
					first_name,
                    last_name,
                    email,
                    phone_number,
                    job_Id,
                    hired_date,
					location_Id
				) values 
					('Muktha','BS','muktha@gmail.com','+56567668',1,'2021-03-09',1),
					('Navya','S','navya@gmail.com','+368988',2,'2021-04-23',2),
                    ('Kavya','WT','kavya@gmail.com','+2345566332',3,'2021-05-17',3),
                    ('Nithya','KM','nithya@gmail.com','+9899887',2,'2021-06-13',4);
                    
SELECT 
    *
FROM
    employees;
    
CREATE TABLE job (
    job_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY  UNIQUE,
    job_title VARCHAR(50),
    salary decimal
);

INSERT into job (
				job_title,
				salary
			) values 
				('Receptionist',5000),
				('Sales Girl',4500),
				('Packing Manager',6000);
                    
SELECT 
    *
FROM
    job;
    
CREATE TABLE product (
    product_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    product_name VARCHAR(50),
    product_description VARCHAR(255),
    qty_stock DECIMAL(7 , 2 ),
    price DECIMAL(7 , 2 ),
    category_Id INT
);

INSERT into product (
				product_name,
				product_description,
                qty_stock,
                price,
                category_Id
			) values 
				('Saffron Tea','Maintaining high quality',1000,5.00,2),
				('Indian Beef','Collecting directly from the farmers',50,23.00,3),
				('King Fish','Fresh',45,32.00,4),
                ('Kaju burfi','North Indian Sweet',70,2.25,1);
                    
SELECT 
    *
FROM
    product;
    
CREATE TABLE supplier (
    supplier_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    company_name VARCHAR(100),
    location_Id INT,
    phone_number VARCHAR(15)
);

INSERT into supplier (
				company_name,
				location_Id,
				phone_number
			) values 
				('Thomson',1,'+5678965'),
				('Green Valley',2,'+456778'),
				('Nilgiris',3,'+4678965432');
                    
SELECT 
    *
FROM
    supplier;

## Add foreign key constraints
ALTER TABLE users ADD FOREIGN KEY (location_Id) REFERENCES location(location_Id);

ALTER TABLE users ADD FOREIGN KEY (type_Id) REFERENCES user_type(type_Id);

ALTER TABLE supplier ADD FOREIGN KEY (location_Id) REFERENCES location(location_Id);

ALTER TABLE product ADD FOREIGN KEY (category_Id) REFERENCES category(category_Id);

ALTER TABLE manager ADD FOREIGN KEY (location_Id) REFERENCES location(location_Id);

ALTER TABLE employees ADD FOREIGN KEY (job_Id) REFERENCES job(job_Id);

ALTER TABLE employees ADD FOREIGN KEY (location_Id) REFERENCES location(location_Id);

ALTER TABLE employees ADD FOREIGN KEY (location_Id) REFERENCES location(location_Id);

## Retrieve All values from Users Table
SELECT 
    *
FROM
    users;

## Retrieve the name, Product id and category Id by joining the category and product table
SELECT 
    p.product_name, p.product_Id, c.cat_name, c.category_Id
FROM
    product p
        JOIN
    category c ON p.category_Id = c.category_Id;
    
## Retrieve the first name, last name, job title and salary by joining the employee table and   job table
SELECT 
    e.first_name, e.last_name, j.job_title, j.salary
FROM
    employees e
        JOIN
    job j ON e.job_Id = j.job_Id;
    
## Retrieve the first name, last name, Type id  by joining the type table and   users table
SELECT 
    u.first_name, u.last_name, t.u_type
FROM
    users u
        JOIN
    user_type t ON u.type_Id = t.type_Id;
    
## Select all details from supplier table
SELECT 
    *
FROM
    supplier;