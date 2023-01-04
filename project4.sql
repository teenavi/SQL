create database	ticket_reservation;

use ticket_reservation;

CREATE TABLE employee (
    employee_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    employee_Id_PK VARCHAR(25),
    employee_name VARCHAR(50),
    address VARCHAR(50),
    gender VARCHAR(10),
    phone_no VARCHAR(15),
    date_of_birth DATE,
    salary DECIMAL
);
                    
insert into employee (
					employee_Id_PK,
                    employee_name,
                    address,
                    gender,
                    phone_no,
                    date_of_birth,
                    salary
                    ) values 
                    ('EMP-001-345','Kevin','North Street-34 California','M','6784567994','1986-04-07',4000),
                    ('EMP-002-759','Emma','Wall Street-8 Dallas','F','4784567991','1984-09-27',4500),
                    ('EMP-003-326','Vicky','West Atemburo-67 Washington','M','8783767903','1989-05-17',5000),
                    ('EMP-004-167','Tina','West Rozarier-12 Newyork','F','9018767903','1985-05-11',5500);
                    
SELECT 
    *
FROM
    employee;

CREATE TABLE passenger (
    passenger_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    passenger_Id_PK VARCHAR(25),
    passenger_name VARCHAR(25),
    seat_no VARCHAR(10),
    gender VARCHAR(10),
    phone_no VARCHAR(15),
    employee_Id INT,
    reservation_status VARCHAR(20)
);
                    
insert into passenger (
					passenger_Id_PK,
                    passenger_name,
                    seat_no,
                    gender,
                    phone_no,
                    employee_Id,
                    reservation_status
                    ) values 
                    ('PSNG-001-345','Tom','A-01','M','6784567994',0,'confirm'),
                    ('PSNG-002-759','Emma','A-19','F','4784567991',2,'waiting list'),
                    ('PSNG-003-326','Robert','E-21','M','8783767903',0,'waiting list'),
                    ('PSNG-004-167','Tina','B-05','F','9018767903',4,'confirm');
                    
SELECT 
    *
FROM
    passenger;

CREATE TABLE train (
    train_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    station_Id VARCHAR(50),
    train_name VARCHAR(50)
);
                    
insert into train (
					station_Id,
                    train_name
                    ) values 
                    ('ARZ','James Whitcomb Riley'),
                    ('ARZ','Jeffersonian'),
                    ('XTN','Jet Rocket'),
                    ('BTY','Imperial');
                    
SELECT 
    *
FROM
    train;
                    
CREATE TABLE station (
    station_Id VARCHAR(15) NOT NULL PRIMARY KEY UNIQUE,
    station_name VARCHAR(50),
    no_of_lines INT,
    no_of_platforms INT
);
                    
insert into station (
					station_Id,
					station_name,
                    no_of_lines,
                    no_of_platforms
                    ) values 
                    ('ARZ','Wayne Hultgren',1,9),
                    ('BTY','23rd Street',2,13),
                    ('XTN','47th Avenue',3,5),
                    ('IOP','Archives Plaza',3,11);
                    
SELECT 
    *
FROM
    station;
              
CREATE TABLE ticket (
    ticket_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    ticket_no VARCHAR(20),
    source_place VARCHAR(50),
    destination VARCHAR(50),
    class_Id INT,
    fare_Id INT,
    train_Id INT
);
               
insert into ticket (
					ticket_no,
                    source_place,
                    destination,
                    class_Id,
                    fare_Id,
                    train_Id
                    ) values 
                    ('T001','dallas','Chicago',1,1,1),
                    ('T002','Yellowstone','Maui',2,2,2),
                    ('T003','dallas','Yosemite',3,3,2),
                    ('T004','San Fransisco','Washington',1,4,3);
                    
SELECT 
    *
FROM
    ticket;

CREATE TABLE fare (
    fare_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    receipt_no VARCHAR(20),
    train_Id VARCHAR(50),
    source_place VARCHAR(50),
    destination VARCHAR(50),
    class_Id INT,
    fare INT,
    ticket_Id INT
);
                    
insert into fare (
					receipt_no,
                    train_Id,
                    source_place,
                    destination,
                    class_Id,
                    fare,
                    ticket_Id
                    ) values 
                    ('FR 001',1,'dallas','Chicago',1,15,1),
                    ('FR 002',2,'Yellowstone','Maui',2,7,2),
                    ('FR 003',3,'dallas','Yosemite',3,5,2),
                    ('FR 004',4,'San Fransisco','Washington',1,14,3);
                    
SELECT 
    *
FROM
    fare;

CREATE TABLE class (
    class_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    class VARCHAR(20),
    journey_date DATE,
    no_of_seats INT,
    train_Id INT
);
 
 insert into class (
					class,
					journey_date,
                    no_of_seats,
                    train_Id
                    ) values 
                    ('A','2019-03-01',3,1),
                    ('B','2019-08-03',2,2),
                    ('C','2019-08-05',1,3),
                    ('D','2019-08-07',4,4);
                    
SELECT 
    *
FROM
    class;

CREATE TABLE time_train (
    time_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    ref_no VARCHAR(10),
    departure_time DATETIME,
    arrival_time DATETIME,
    train_Id INT,
    station_Id INT
);
                    
insert into time_train (
					ref_no,
					departure_time,
                    arrival_time,
                    train_Id,
                    station_Id
                    ) values 
                    ('T001','2019-03-01 22:59:59','2019-03-01 23:59:59',1,1),
                    ('T002','2019-08-03 12:19:59','2019-08-03 16:49:32',2,1),
                    ('T003','2019-08-05 22:09:05','2019-08-05 23:09:05',2,1),
                    ('T004','2019-08-07 02:34:25','2019-08-07 10:14:45',3,3); 
                    
SELECT 
    *
FROM
    time_train;

CREATE TABLE route (
    route_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    arrival_time DATETIME,
    departure_time DATETIME,
    stop_no INT
);
                    
insert into route (
					arrival_time,
					departure_time,
                    stop_no
                    ) values 
                    ('2019-03-01 22:59:59','2019-03-01 23:59:59',1),
                    ('2019-08-03 12:19:59','2019-08-03 16:49:32',2),
                    ('2019-08-05 22:09:05','2019-08-05 23:09:05',3),
                    ('2019-08-07 02:34:25','2019-08-07 10:14:45',4); 
                    
SELECT 
    *
FROM
    route;

#Tasks

## Select employee name, gender as male employees, salary from employee were gender=’M’ and salary < (select min(salary) from employee where gender=’F’)
SELECT 
    employee_name, gender AS male_employees, salary
FROM
    employee
WHERE
    gender = 'M'
        AND salary < (SELECT 
            MIN(salary)
        FROM
            employee
        WHERE
            gender = 'F');

## Select passenger name as passenger name , gender, reservation status, employee id from passenger where employee id=2;
SELECT 
    passenger_name, gender, employee_Id, reservation_status
FROM
    passenger
WHERE
    employee_Id = 2;

## Select train id, source, destination, class, fare from fare where source=’Dallas’ and fare>10;
SELECT 
    f.train_Id,
    t.train_name,
    f.source_place,
    f.destination,
    f.fare,
    c.class
FROM
    fare f
        JOIN
    class c ON f.class_Id = c.class_Id
        JOIN
    train t ON t.train_Id = f.train_Id
WHERE
    f.source_place = 'dallas'
        AND f.fare > 10;
	
## Select train id, source, destination, class, fare from fare where source=’Dallas’ and fare=(select max(fare)  from fare where source=’DALLAS’);
SELECT 
    f.train_Id,
    t.train_name,
    f.source_place,
    f.destination,
    f.fare,
    c.class
FROM
    fare f
        JOIN
    class c ON f.class_Id = c.class_Id
        JOIN
    train t ON t.train_Id = f.train_Id
WHERE
    f.source_place = 'dallas'
        AND f.fare = (SELECT 
            MAX(fare)
        FROM
            fare
        WHERE
            source_place = 'dallas');
	
## Select station name, number of lines, number of platforms from station where number of lines >=1 and number of platforms>=10;
SELECT 
    *
FROM
    station
WHERE
    no_of_lines >= 1
        AND no_of_platforms >= 10;

## Select train id, train name, station id from train where not station id =’ARZ”;
SELECT 
    *
FROM
    train
WHERE
    station_Id != 'ARZ';

## Select class. Train id, train name, class from class inner join train on class. Train id= train. train id;
SELECT 
    t.*, c.*
FROM
    train t
        JOIN
    class c ON t.train_Id = c.train_Id;

## Select employee. E name, employee. Phone number, employee. Gender, p name, res status from employee join passenger on employee. E id=passenger. e_id
SELECT 
    e.employee_name,
    e.phone_no,
    e.gender,
    p.passenger_name,
    p.reservation_status
FROM
    employee e
        JOIN
    passenger p ON e.employee_Id = p.employee_Id;

## Select employee. E_name, employee. Phone number, employee. Gender, p_name, res status from employee join passenger on employee. Id =passenger. E id and employee. phone number like ‘4%1’;
SELECT 
    e.employee_name,
    e.phone_no,
    e.gender,
    p.passenger_name,
    p.reservation_status
FROM
    employee e
        JOIN
    passenger p ON e.employee_Id = p.employee_Id
        AND e.phone_no LIKE '4%1';
        
## Select station id, train name, class.class, class.no of seats, journey date from train join class on train. Train id=Class. Train id and journey date like ‘01%2019’;
SELECT 
    t.station_Id,
    t.train_name,
    c.class,
    c.no_of_seats,
    c.journey_date
FROM
    train t
        JOIN
    class c ON t.train_Id = c.train_Id
WHERE
    t.train_Id = 1
        AND c.journey_date LIKE '2019%';

## Select fare. receipt_no, fare.train id, train.train_name, fare.source, fare.destination, fare.class, fare.fare, fare.ticket_not, time.dep_time, time.arr_time from fare join ticket on fare.ticket_no = ticket.ticket_no  join time on time.train_id = ticket.train_id join train on ticket.train_id  = train.train_id;
SELECT 
    f.receipt_no,
    f.train_Id,
    tr.train_name,
    f.source_place,
    f.destination,
    f.class_Id,
    f.fare,
    t.ticket_no,
    tt.departure_time,
    tt.arrival_time
FROM
    fare f
        JOIN
    ticket t ON t.fare_Id = f.fare_Id
        JOIN
    time_train tt ON tt.train_Id = t.train_Id
        JOIN
    train tr ON t.train_Id = tr.train_Id
GROUP BY t.ticket_Id;






