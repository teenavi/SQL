create database	library;

Use library;

CREATE TABLE Book_Details (
    ISBN CHAR NOT NULL PRIMARY KEY UNIQUE,
    Book_Title VARCHAR(200),
    Publication_year INT,
    Book_Language VARCHAR(100),
    Category_Type INT,
    Binding_Id INT,
    No_Of_Copies_Actual INT,
    No_Of_Copies_Current INT
);

ALTER TABLE Book_Details
MODIFY COLUMN ISBN varchar(25);

INSERT into Book_Details (
							ISBN,
                            Book_Title,
                            Publication_year,
                            Book_Language,
                            Category_Type,
                            Binding_Id,
                            No_Of_Copies_Actual,
                            No_Of_Copies_Current
							) values 
                            ('0-684-12437-5','Pride and Prejudice',08,'English',1,1,15,5),
                            ('0-684-78635-5','The Great Gatsby',10,'Chineese',2,1,10,3),
                            ('0-067-84328-5','In Cold Blood',20,'English',1,2,25,2),
                            ('0-684-90875-7','Wide Sargasso Sea',15,'Russian',3,2,8,4); 
                            
SELECT 
    *
FROM
    Book_Details;

CREATE TABLE Binding_Details (
    Binding_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Binding_Name VARCHAR(50)
);

INSERT INTO Binding_Details (Binding_Name) values ('SOFT COVER'),('HARD COVER');

select * from Binding_Details;

#create relationship between book and bind using constraints 
ALTER TABLE Book_Details ADD FOREIGN KEY (Binding_Id) REFERENCES Binding_Details(Binding_ID);

## check the relationship
SELECT 
    book.Book_Title, book.Book_Language, bind.Binding_Name
FROM
    Book_Details book
        JOIN
    Binding_Details bind ON book.Binding_Id = bind.Binding_Id;

CREATE TABLE Category_Details (
    Category_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Category_Name VARCHAR(250)
);

INSERT INTO Category_Details (Category_Name) values ('Adventure stories'),('Classics'),('Crime');

#create relationship between book and category using constraints 
ALTER TABLE Book_Details ADD FOREIGN KEY (Category_Type) REFERENCES Category_Details(Category_ID);

## check the relationship
SELECT 
    book.Book_Title,
    book.Book_Language,
    bind.Binding_Name,
    cat.Category_Name
FROM
    Book_Details book
        JOIN
    Binding_Details bind ON book.Binding_Id = bind.Binding_Id
        JOIN
    Category_Details cat ON cat.Category_ID = book.Category_Type;

CREATE TABLE Borrower_Details (
    Borrower_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Book_ID CHAR,
    Borrowed_From_Date DATETIME,
    Borrowed_To_Date DATETIME,
    Actual_Return_date DATETIME,
    Issued_by INT
);

ALTER TABLE Borrower_Details
MODIFY COLUMN Book_ID varchar(25);

#create relationship between book and category using constraints 
ALTER TABLE Borrower_Details ADD FOREIGN KEY (Book_ID) REFERENCES book_details(ISBN);

INSERT into Borrower_Details (
							Book_ID,
                            Borrowed_From_Date,
                            Borrowed_To_Date,
                            Actual_Return_date,
                            Issued_by
							) values 
                            ('0-684-12437-5','2022-10-01','2022-10-10','2022-10-11',1),
                            ('0-684-78635-5','2022-10-03','2022-10-13','2022-10-07',1),
                            ('0-067-84328-5','2022-10-07','2022-10-13','2022-10-15',2),
                            ('0-684-90875-7','2022-10-17','2022-10-23','2022-10-18',2);
                            
select * from Borrower_Details;

CREATE TABLE Student_Details (
    Student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Student_Name VARCHAR(100),
    Sex VARCHAR(10),
    Date_Of_Birth DATE,
    Borrower_ID INT,
    Department VARCHAR(100),
    Contact_Number VARCHAR(15)
);

INSERT into Student_Details (
							Student_Name,
                            Sex,
                            Date_Of_Birth,
                            Borrower_ID,
                            Department,
                            Contact_Number
							) values 
                            ('Aiden','M','1989-3-02',1,'IT','5675765768'),
                            ('Ronald','M','1988-5-29',2,'CS','7665542268'),
                            ('Sara','F','1990-7-12',3,'EC','89898988768'),
                            ('michelle','F','1990-8-22',4,'Civil','1225445768');
                            
#create relationship between borrower and student using constraints 
ALTER TABLE Student_Details ADD FOREIGN KEY (Borrower_ID) REFERENCES Borrower_Details(Borrower_ID);

SELECT 
    *
FROM
    Student_Details;

CREATE TABLE Staff_Details (
    User_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    User_Name VARCHAR(150),
    Is_Admin INT
);

INSERT INTO Staff_Details (User_Name,Is_Admin) values ('Lib 1',1),('Lib 2',0);

SELECT 
    *
FROM
    Staff_Details;

#create relationship between borrower and staff using constraints 
ALTER TABLE Borrower_Details ADD FOREIGN KEY (Issued_by) REFERENCES Staff_Details(User_ID);

CREATE TABLE Shelf_Details (
    Shelf_Id INT NOT NULL PRIMARY KEY UNIQUE,
    Floor INT
);

#check all the relationship
SELECT 
    bo.Book_Title,
    bi.Binding_Name,
    cat.Category_Name,
    sta.User_Name,
    stu.Student_Name AS Borrowed_To,
    bor.Actual_Return_date AS Return_Date
FROM
    book_details bo
        JOIN
    binding_details bi ON bi.Binding_ID = bo.Binding_Id
        JOIN
    category_details cat ON cat.Category_ID = bo.Category_Type
        JOIN
    borrower_details bor ON bor.Book_ID = bo.ISBN
        JOIN
    staff_details sta ON sta.User_ID = bor.Issued_by
        JOIN
    student_details stu ON stu.Borrower_ID = bor.Borrower_ID;
    
#Add relation between shelf and book
ALTER TABLE shelf_details ADD Book_ID varchar(25);

#create relationship between borrower and staff using constraints 
ALTER TABLE shelf_details ADD FOREIGN KEY (Book_ID) REFERENCES book_details(ISBN);

INSERT INTO shelf_details (Shelf_Id,Floor,Book_ID) values (001,1,'0-067-84328-5'),(002,2,'0-684-12437-5'),(003,1,'0-684-78635-5'),(004,2,'0-684-90875-7');
    
SELECT 
    *
FROM
    shelf_details;

# Using update statement, change the shelf ids.
UPDATE shelf_details 
SET 
    Shelf_Id = 7
WHERE
    Book_ID = '0-067-84328-5';

#combine all the relationship
SELECT 
    bo.Book_Title,
    bi.Binding_Name,
    cat.Category_Name,
    sta.User_Name,
    stu.Student_Name AS Borrowed_To,
    bor.Actual_Return_date AS Return_Date,
    sh.Floor
FROM
    book_details bo
        JOIN
    binding_details bi ON bi.Binding_ID = bo.Binding_Id
        JOIN
    category_details cat ON cat.Category_ID = bo.Category_Type
        JOIN
    borrower_details bor ON bor.Book_ID = bo.ISBN
        JOIN
    staff_details sta ON sta.User_ID = bor.Issued_by
        JOIN
    student_details stu ON stu.Borrower_ID = bor.Borrower_ID
        JOIN
    shelf_details sh ON sh.Book_ID = bo.ISBN;
    
