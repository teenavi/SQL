create database airport;

Use airport;

CREATE TABLE airplane_type (
    A_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    A_Capacity DECIMAL(20 , 2 ),
    A_weight DECIMAL(20 , 2 ),
    A_company VARCHAR(50)
); 

INSERT into airplane_type (
				A_Capacity,
				A_weight,
                A_company
			) values 
				(500,32000,'Indigo'),
				(440,30000,'Spice Jet'),
				(660,35000,'Vistara'),
                (900,44000,'Air india');
                
SELECT 
    *
FROM
    airplane_type;

CREATE TABLE route (
    route_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    take_off_point VARCHAR(50),
    destination VARCHAR(50),
    r_type INT
); 

INSERT into route (
				take_off_point,
				destination,
                r_type
			) values 
				('TVM','Mumbai',1),
				('Cochin','Bangalore',2),
				('Mumbai','Dubai',1),
                ('Chennai','Thailand',2);
                
SELECT 
    *
FROM
    route;

CREATE TABLE flight (
    flight_Id VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    departure VARCHAR(50),
    arrival VARCHAR(50),
    flight_date DATE,
    A_Id INT
); 

INSERT into flight (
				flight_Id,
				departure,
				arrival,
                flight_date,
                A_Id
			) values 
				('EY1234','TVM','Mumbai','2022-3-9',1),
				('EY1784','Cochin','Bangalore','2022-4-25',2),
				('EY7634','Mumbai','Dubai','2022-5-16',3),
                ('EY8454','Chennai','Thailand','2022-5-9',4);
                
SELECT 
    *
FROM
    flight;

CREATE TABLE air_fare (
    fare_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    charge_amount DECIMAL(7 , 2 ),
    fare_desc VARCHAR(150),
    flight_Id varchar(20)
); 

INSERT into air_fare (
				charge_amount,
				fare_desc,
                flight_Id
			) values 
				(15000,'you can take 1 kid age below 5','EY1234'),
				(21000,'you can take 2 kid age below 3','EY1784'),
				(25000,'you can take 5kg luggage','EY7634'),
                (36000,'you can take 1 kid age below 4','EY8454');
                
SELECT 
    *
FROM
    air_fare;

CREATE TABLE passenger (
    ps_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    ps_name VARCHAR(50),
    address VARCHAR(50),
    age INT,
    sex VARCHAR(10),
    contacts VARCHAR(15),
    flight_Id varchar(20)
); 

INSERT into passenger (
				ps_name,
				address,
                age,
                sex,
                contacts,
                flight_Id
			) values 
				('Nakshatra','TT House TC-45/78',18,'F','+657890899','EY1234'),
				('Rohan','KM House TC-45/78',26,'M','+857890899','EY1784'),
				('Jose John','Jose Cottage TC-45/78',35,'M','+957890899','EY1234'),
                ('John PK','Faith Villa TC-45/78',48,'M','+157890899','EY7634'),
                ('Johnson','TM Bhavan TC-45/78',54,'M','+357890899','EY1234');
                
SELECT 
    *
FROM
    passenger;

CREATE TABLE countries (
    country_Code VARCHAR(10) NOT NULL PRIMARY KEY UNIQUE,
    country_name VARCHAR(50)
); 

INSERT into countries (
				country_Code,
				country_name
			) values 
				('USA','Unitd States Of Ameria'),
				('IN','India'),
				('UAE','United Arab Emirates'),
                ('PAK','Pakisthan');
                
SELECT 
    *
FROM
    countries;

CREATE TABLE airport (
    airport_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    airport_name VARCHAR(50),
    city VARCHAR(50),
    state varchar(50),
    country_Code varchar(10)
); 

INSERT into airport (
				airport_name,
                city,
                state,
                country_Code
			) values 
				('Hartsfield–Jackson Atlanta International Airport','Atlanta','Florida','USA'),
				('Denver International Airport','Denver','NewYork','USA'),
				('Cochin International Airport','Cochin','Kerala','IN'),
                ('Dubai International Airport','Dubai','Dubai','UAE');
                
SELECT 
    *
FROM
    airport;
  
CREATE TABLE employee (
    emp_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    emp_name VARCHAR(50),
    address VARCHAR(50),
    age int,
    email_Id varchar(50),
    contact varchar(15),
    airport_Id int
); 

INSERT into employee (
				emp_name,
                address,
                age,
                email_Id,
                contact,
                airport_Id
			) values 
				('Harry John','Atlanta,West street',29,'harry@gmail.com','+546768',1),
				('Johnson Donald','Denver North Canyon',45,'donald@gmail.com','+45678',2),
				('Hannah','HY Villa, Cochin, Palarivattom',23,'hannah@gmail.com','+56786543',3),
                ('Naomi','Sheikh Colony Dubai',32,'naomi@gmail.com','+345677',4);
               
SELECT 
    *
FROM
    employee;

CREATE TABLE can_land (
    reg_No varchar(15) NOT NULL PRIMARY KEY UNIQUE,
    faa_No VARCHAR(50),
    ssn VARCHAR(10),
    land_date date,
    hours int,
    score decimal(7,2),
    airport_Id int,
    flight_Id varchar(20)
); 

INSERT into can_land (
				reg_No,
                faa_No,
                ssn,
                land_date,
                hours,
                score,
                airport_Id,
                flight_Id
			) values 
				('REG 001','D0956',546-567-785,'2022-06-02',15,5,1,'EY1234'),
				('REG 002','Y095Z',45-126-987,'2022-07-12',7,9,2,'EY1234'),
				('REG 003','Q09RT',234-786-422,'2022-01-19',12,2,3,'EY7634'),
                ('REG 004','F795Z',322-768-195,'2022-12-28',23,7,2,'EY1784');
                
SELECT 
    *
FROM
    can_land;
   
CREATE TABLE transactions (
    transaction_Id varchar(15) NOT NULL PRIMARY KEY UNIQUE,
    booking_Date datetime,
    departure_Date datetime,
    transaction_Type varchar(25),
    emp_Id int,
    ps_Id int,
    flight_Id varchar(20),
    charge_Amount int
); 

INSERT into transactions (
				transaction_Id,
                booking_Date,
                departure_Date,
                transaction_Type,
                emp_Id,
                ps_Id,
                flight_Id,
                charge_Amount
			) values 
				('TS 001','2022-06-02','2022-07-28','google-pay',1,1,'EY1234',4),
				('TS 002','2022-07-12','2022-07-12','credit-card',2,2,'EY1234',3),
				('TS 003','2022-01-19','2022-02-11','Rupay',3,3,'EY7634',1),
                ('TS 004','2022-12-28','2022-12-28','credit-card',4,5,'EY1234',3),
                ('TS 005','2022-11-30','2022-12-15','Rupay',1,4,'EY1784',2),
                ('TS 006','2022-11-30','2022-12-15','google-pay',1,1,'EY1784',4);
              
SELECT 
    *
FROM
    transactions;
    
CREATE TABLE travel (
    route_Id int,
    flight_Id varchar(20)
); 

INSERT into travel (
				route_Id,
                flight_Id
			) values 
				(1,'EY1234'),
				(2,'EY1784'),
				(3,'EY7634'),
                (4,'EY8454');
                
SELECT 
    *
FROM
    travel;
    
# ALTER AND ADD FOREIGN KEY CONSTRAINT
ALTER TABLE flight ADD FOREIGN KEY (A_Id) REFERENCES airplane_type(A_Id);

ALTER TABLE air_fare ADD FOREIGN KEY (flight_Id) REFERENCES flight(flight_Id);

ALTER TABLE passenger ADD FOREIGN KEY (flight_Id) REFERENCES flight(flight_Id);

ALTER TABLE airport ADD FOREIGN KEY (country_Code) REFERENCES countries(country_Code);

ALTER TABLE employee ADD FOREIGN KEY (airport_Id) REFERENCES airport(airport_Id);

ALTER TABLE can_land ADD FOREIGN KEY (airport_Id) REFERENCES airport(airport_Id),
					ADD FOREIGN KEY (flight_Id) REFERENCES flight(flight_Id);
                    
ALTER TABLE transactions ADD FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id),
					ADD FOREIGN KEY (ps_Id) REFERENCES passenger(ps_Id),
                    ADD FOREIGN KEY (flight_Id) REFERENCES flight(flight_Id),
                    ADD FOREIGN KEY (charge_Amount) REFERENCES air_fare(fare_Id);
                    
ALTER TABLE travel ADD FOREIGN KEY (route_Id) REFERENCES route(route_Id),
					ADD FOREIGN KEY (flight_Id) REFERENCES flight(flight_Id);
                    
# Display the flight-id and Passenger name travelling by Indigo Company
select p.ps_name,p.flight_Id from passenger p join flight f on p.flight_Id = f.flight_Id join airplane_type a on a.A_Id = f.A_Id and a.A_company = 'Indigo';

#	Display the route information for all flights
select * from route;

# 	Find the Employee-id of all employees whose name includes the substring John
select emp_Id,emp_name from employee where emp_name LIKE '%John%';
select* from employee;

#	Find the sum of transaction charge amount travelled by flight id= EY1234 for each transaction type.
select SUM(a.charge_amount),t.transaction_Type,t.flight_Id from air_fare a join transactions t on a.fare_Id = t.charge_Amount and t.flight_Id='EY1234' group by transaction_Type;

# 	List in alphabetical order the names of all passengers travelling by flight-id EY1234.
select ps_name from passenger where flight_Id = 'EY1234' order by ps_name ASC ;

# 	Display the company-name whose flight will be landed in Mumbai airport.
select ar.A_company from airplane_type ar join flight f on f.A_Id = ar.A_Id where arrival = 'Mumbai';

#	Find all country name with more than one airport
select COUNT(a.airport_name) as airport_count,c.country_name from airport a join countries c on c.country_Code = a.country_Code group by a.country_Code having COUNT(a.airport_name) > 1;

# 	Find the largest charge-amount of any transaction-type
select MAX(af.charge_amount) from air_fare af join transactions t on t.charge_Amount = af.fare_Id;

# 	Find the Fare-id of those with Charge-amount between 20000 and 35000
select fare_Id,charge_amount from  air_fare where charge_amount between 20000 and 35000;

# 	Find the average charge-amount of those transaction type whose average charge amount is greater than 20,000
select AVG(af.charge_amount),t.transaction_Type from air_fare af join transactions t on t.charge_Amount = af.fare_Id group by t.transaction_Type having AVG(af.charge_amount) > 20000;

#	Display the country-name that does not have an airport
select country_name from countries where  country_Code NOT IN (select distinct(country_Code) from airport);

# 	Display all the counties that may have or may not have the Airport
select country_name from countries;

#	Find the Transactiontype whose transaction amount is less than Google Pay transaction-type.
SELECT @sum_google_pay :=  SUM(af.charge_amount),t.transaction_Type from air_fare af join transactions t on t.charge_Amount = af.fare_Id group by t.transaction_Type having t.transaction_Type = 'google-pay';
select SUM(af.charge_amount),t.transaction_Type from air_fare af join transactions t on t.charge_Amount = af.fare_Id group by t.transaction_Type having SUM(af.charge_amount) < @sum_google_pay  ;

#	Increase the charge-amount by 5% whose class is Superex Return
## couldn't find any field name like class ##