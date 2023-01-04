#3. Create a database for the system.

	create database bank;

	use bank;

/*drop table branch;*/

#4. Create the tables for storing all the information related to the entire systems :: START

CREATE TABLE branch (
	branch_name VARCHAR(255) NOT NULL PRIMARY KEY,
	branch_city VARCHAR(255),
	assets VARCHAR(255)
);

CREATE TABLE customer (
	customer_name VARCHAR(255) NOT NULL PRIMARY KEY,
	customer_street VARCHAR(255),
	customer_city VARCHAR(255)
);

CREATE TABLE account (
    account_number VARCHAR(255) NOT NULL PRIMARY KEY,
    branch_name VARCHAR(255),
    balance DOUBLE
);

CREATE TABLE loan (
    loan_number VARCHAR(255) NOT NULL PRIMARY KEY,
    branch_name VARCHAR(255),
    amount DOUBLE
);

CREATE TABLE depositor (
    customer_name VARCHAR(255) NOT NULL,
    account_number VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE borrower (
    customer_name VARCHAR(255) NOT NULL,
    loan_number VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE employee (
    employee_name VARCHAR(255) NOT NULL,
    branch_name VARCHAR(255) NOT NULL,
    salary DOUBLE PRIMARY KEY
);

#4. Create the tables for storing all the information related to the entire systems :: END

#5. Insert the data values for each table :: START

	INSERT into branch (
						branch_name,
						branch_city,
						assets
					) values 
						("Branch1",'Birmingham','10000000'),
						("Branch2",'Downtown','2000000000'),
						("Branch3",'Brighton','3000000000'),
						("Branch4",'Chester','3000000'),
						("Branch5",'Derby','6000000000');
                        
SELECT 
    *
FROM
    branch;

	INSERT into account (
						account_number,
						branch_name,
						balance
					) values 
						("AC 001",'Branch1',1500),
						("AC 002",'Branch5',1200),
						("AC 003",'Branch1',300),
						("AC 004",'Branch2',700),
						("AC 005",'Branch4',1000),
                        ("AC 006",'Branch3',300),
						("AC 007",'Branch3',800),
						("AC 008",'Branch3',900),
						("AC 009",'Branch3',1700);
    
SELECT 
    *
FROM
    account;
    
    INSERT into borrower (
							customer_name,
							loan_number
						) values 
							("Liam",'LN 001'),
							("Emma",'LN 002');
    
SELECT 
    *
FROM
    borrower;
    
    INSERT into customer (
							customer_name,
							customer_street,
							customer_city
						) values 
							("Liam",'High Street','Manchester'),
							("Olivia",'London Road','Bradford'),
							("Noah",'Station Road','Cambridge'),
							("Emma",'Victoria Road','Ely'),
							("Elijah",'Park Road','Glasgow'),
                            ("Ben",'Princes Street','Salford'),
							("Ashley",'Brick Lane','Liverpool'),
							("Naomi",'Carnaby Street','Oxford'),
							("Sara",'Carnaby Street','Oxford');
                                 
SELECT 
    *
FROM
    customer;
    
    INSERT into depositor (
							customer_name,
							account_number
						) values 
							("Liam",'AC 001'),
							("Olivia",'AC 002'),
							("Noah",'AC 003'),
							("Emma",'AC 004'),
							("Elijah",'AC 005'),
                            ("Ben",'AC 006'),
							("Ashley",'AC 007'),
							("Naomi",'AC 008'),
							("Sara",'AC 009');
                                
SELECT 
    *
FROM
    depositor;
    
    INSERT into employee (
							employee_name,
							branch_name,
							salary
						) values 
							("Harper",'Branch1',4000),
							("James",'Branch1',4500),
							("Lucas",'Branch1',3800),
							("Amelia",'Branch2',5000),
							("Henry",'Branch2',4200),
							("Mia",'Branch2',4100),
							("William",'Branch2',4300),
							("Theodore",'Branch3',4400),
							("Benjamin",'Branch3',3700),
							("Ava",'Branch3',4600),
							("Charlotte",'Branch4',5100),
							("Evelyn",'Branch4',4700),
							("Luna",'Branch5',3900),
							("Aleena",'Branch5',4800),
							("Jackson",'Branch5',5200),
							("Peter",'Branch5',5300),
                            ("Jonath",'Branch1',1000);
                                
SELECT 
    *
FROM
    employee;
    
    INSERT into loan (
						loan_number,
						branch_name,
						amount
					) values 
						("LN 001",'Branch1',5000),
						("LN 002",'Branch1',6000),
						("LN 003",'Branch3',4500),
						("LN 004",'Branch4',5000),
						("LN 005",'Branch5',2600);
    
SELECT 
    *
FROM
    loan;
		
#5. Insert the data values for each table :: END
    
#6. Find the names of all customers.
    
SELECT 
    customer_name
FROM
    customer;
    
#7. Find the names of all branches in the loan relation, don't display duplicates. 
    
SELECT DISTINCT
    (branch_name)
FROM
    loan;
    
#8. Display the entire Branch table. 
    
SELECT 
    *
FROM
    branch;
    
#9. Find the account number for all accounts where the balance is greater than $700. 
    
SELECT 
    account_number
FROM
    account
WHERE
    balance > 700;
    
#10. Find the account number and balance for all accounts from Brighton where the balance is greater than $800.
   
SELECT 
    t1.account_number, t1.balance
FROM
    account t1
        JOIN
    branch t2 ON t1.branch_name = t2.branch_name
WHERE
    t1.balance > 800
        AND t2.branch_city = 'Brighton';

#11. Display the branch name and assets from all branches in thousands of dollars and rename the assets column to 'assets in thousands'. 

SELECT 
    branch_name, FORMAT(assets, 0) AS assets_in_thousands
FROM
    branch;

#12. Find the name of all branches with assets between one and four million dollars.

SELECT 
    branch_name
FROM
    branch
WHERE
    assets BETWEEN 1000000 AND 4000000;
        
#13. Find the name, account number, and balance of all customers who have an account. 

SELECT 
    t1.customer_name, t3.account_number, t3.balance
FROM
    customer t1
        JOIN
    depositor t2 ON t1.customer_name = t2.customer_name
        JOIN
    account t3 ON t2.account_number = t3.account_number;
        
#14. Find the name, account number, and balance of all customers who have an account with a balance of $400 or less.

SELECT 
    t1.customer_name, t3.account_number, t3.balance
FROM
    customer t1
        JOIN
    depositor t2 ON t1.customer_name = t2.customer_name
        JOIN
    account t3 ON t2.account_number = t3.account_number
HAVING balance <= 400;
        
#15. Find all employees whose salary is greater than 1400 and working branch is not ‘Downtown’

SELECT 
    t1.employee_name
FROM
    employee t1
        JOIN
    branch t2 ON t1.branch_name = t2.branch_name
WHERE
    t1.salary > 1400
        AND t2.branch_city != 'Downtown';