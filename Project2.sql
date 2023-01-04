#3. Create a database for the system.

	create database payroll;
    
    use payroll;
    
-- drop table users;
-- drop table grade;
-- drop table department;
-- drop table employee;
-- drop table emp_salary_details;
-- drop table emp_grade_details;
    
#4. Create the tables for storing all the information related to the entire systems. 

	create table users (
							user_id int primary key,
                            user_name varchar(50),
                            user_password varchar(50),
							email_id varchar(50),
							usertype varchar(5)
    );
    
    ALTER TABLE users CHANGE user_id user_id INT AUTO_INCREMENT;
    
    insert into users (	user_name,
						user_password,
                        email_id,
                        usertype
                        ) values ('admin','admin123','admin@gmail.com','admin'),
								('user1','user123','user1@gmail.com','user');
                                
	select * from users;
    
    create table department (
							dept_id int primary key,
							dept_name varchar(100)
    );
    
    ALTER TABLE department CHANGE dept_id dept_id INT AUTO_INCREMENT;
    
     insert into department (	dept_name
							) values ('HR'),
								('Logistics');
                                
	select * from department;
    
    create table grade (
							grade_id int primary key,
							grade_name varchar(50),
							grade_short_name varchar(50),
							grade_basic int,
							grade_ta int,
							grade_da int,
							grade_hra int,
							grade_ma int,
							grade_bonus int,
							grade_pf int,
							grade_pt int
    );
    
    ALTER TABLE grade CHANGE grade_id grade_id INT AUTO_INCREMENT;
	
    insert into grade (	grade_name,
						grade_short_name,
                        grade_basic,
                        grade_ta,
                        grade_da,
                        grade_hra,
                        grade_ma,
                        grade_bonus,
                        grade_pf,
                        grade_pt
                        ) values ('Grade 1','RA','4000','250','100','500','75','1000','400','600'),
								('Grade 2','SV','5000','300','150','500','90','1200','450','650');
                                
	select * from grade;
    
    create table employee (
							emp_id int primary key,
							emp_title varchar(100),
							emp_name varchar(50),
							emp_dob date,
							emp_doj date,
							emp_address varchar(200),
							emp_city varchar(100),
							emp_pincode int,
							emp_mobile_no int,
							emp_state varchar(100),
							emp_mail_id varchar(50),
							emp_pan_no varchar(50)
    );
    
    ALTER TABLE employee CHANGE emp_id emp_id INT AUTO_INCREMENT;
    
     insert into employee (	
						emp_title,
						emp_name,
                        emp_dob,
                        emp_doj,
                        emp_address,
                        emp_city,
                        emp_pincode,
                        emp_mobile_no,
                        emp_state,
                        emp_mail_id,
                        emp_pan_no
                        ) values ('Resource Allocator','Rajeesh','1989-02-03','2021-5-20','Flat No 45,Bulding 4','Al-qusais',75,456556576,'Sharjah','rajeesh@gmail.com','Azx CvF 565787'),
								('Superviser','Jose','1986-6-25','2019-5-6','Flat No 67 Building No 56','Jumeirah',90,876867878,'Dubai','jose@gmail.com','GHT bjm 8766'),
                                ('Resource Allocator','Amina','1982-9-12','2020-9-8','Flat No 78 building No 445','Twar',999,565767667,'Ajman','amina2gmail.com','HJY UIJ 600 6778'),
                                ('Superviser','Diana','1979-8-26','2016-3-12','Flat No 23 Building No 898','Abu hail',577,545657567,'Fujaira','diana@gmail.com','LKU WED 7y576');
    
    select * from employee;
    
    create table emp_grade_details (
							transaction_id int unique primary key,
							emp_id int,
							emp_dept_id int,
							emp_grade_id int,
							emp_from_date date,
							emp_to_date varchar(20)
    );
    
    ALTER TABLE emp_grade_details CHANGE transaction_id transaction_id INT AUTO_INCREMENT;
    
    ALTER TABLE emp_grade_details ADD FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
									ADD FOREIGN KEY (emp_dept_id) REFERENCES department(dept_id),
                                    ADD FOREIGN KEY (emp_grade_id) REFERENCES grade(grade_id);
     
    insert into emp_grade_details (	
								emp_id,
								emp_dept_id,
								emp_grade_id,
								emp_from_date,
                                emp_to_date
								) values 
										(5,1,1,'2021-3-4','2022-6-30'),
										(5,2,2,'2019-9-24','2020-8-30'),
                                        (6,1,2,'2020-2-14','2021-6-10'),
                                        (7,2,1,'2016-4-4','2018-8-20');
                                        
	select * from emp_grade_details;
    
    create table emp_salary_details (
							 	transaction_id int unique primary key,
							 	emp_id int,
							 	emp_salary_month varchar(15),
							 	emp_salary_year varchar(15),
							 	emp_salary_eimbursment_date datetime,
								emp_dept_id int,
								emp_grade_id int,
								emp_basic int,
								emp_da int,
								emp_ta int,
								emp_hra int,
								emp_ma int,
								emp_bonus int,
								emp_pf int,
								emp_pt int,
								emp_gross int,
								emp_total_salary int
    );
    
    ALTER TABLE emp_salary_details CHANGE transaction_id transaction_id INT AUTO_INCREMENT;
    
    ALTER TABLE emp_salary_details ADD FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
									ADD FOREIGN KEY (emp_dept_id) REFERENCES department(dept_id),
                                    ADD FOREIGN KEY (emp_grade_id) REFERENCES grade(grade_id);
                                    
	insert into emp_salary_details (	
								emp_id,
								emp_salary_month,
								emp_salary_year,
								emp_salary_eimbursment_date,
                                emp_dept_id,
                                emp_grade_id,
                                emp_basic,
                                emp_da,
								emp_ta,
								emp_hra,
								emp_ma,
								emp_bonus,
								emp_pf,
								emp_pt,
								emp_gross,
								emp_total_salary
								) values 
										(5,4000,48000,'2021-3-4',2,1,4000,100,250,500,75,1000,400,600,6925,6925),
										(6,5000,60000,'2019-9-24',1,2,5000,150,300,500,90,1200,450,650,8340,8340),
                                        (7,5000,60000,'2020-2-14',2,2,5000,150,300,500,90,1200,450,650,8340,8340),
                                        (8,4000,48000,'2016-4-4',1,1,4000,100,250,500,75,1000,400,600,6925,6925);
                                        
select * from emp_salary_details;

/*The employee name,salary,department name,grade name,date of joining in current grade of employee having ID 5  */
SELECT 
    e.emp_name,
    g.grade_name,
    d.dept_name,
    es.emp_total_salary AS salary,
    eg.emp_from_date AS grade_from_date
FROM
    employee e
        JOIN
    emp_grade_details eg ON e.emp_id = eg.emp_id
        JOIN
    emp_salary_details es ON e.emp_id = es.emp_id
        JOIN
    department d ON eg.emp_dept_id = d.dept_id
        JOIN
    grade g ON eg.emp_grade_id = g.grade_id
WHERE
    e.emp_id = 5
GROUP BY e.emp_id;