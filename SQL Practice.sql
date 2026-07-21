create database BankingDB;
show databases;
use BankingDB; 
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone bigint,
    AccountCreationDate DATE
);
Describe customers;
select * from customers;
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR (20) ,
    Balance DECIMAL (10,2))
    ;
   SELECT *FROM Transactions; 
   CREATE TABLE Transactions (
       TransactionID INT,
       TransactionDate DATE,
       Amount DECIMAL (10,2),
       TransactionType VARCHAR(20)
       );
	CREATE TABLE BRANCHES (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
    );
    Show tables;
    CREATE TABLE AccountBranches (
      AssignmentDate date
      );
	Create table LOANS (
       LoanID INT,
       LoanAmount Decimal(10,2),
       InterestRate Decimal(5,2),
       StartDate DATE,
       EndDate DATE
       );
       SHOW TABLES;
       ALTER TABLE Customers
       ADD DateOfBirth DATE;
	SELECT * FROM CUSTOMERS;
       ALTER TABLE Customers
       ADD location VARCHAR(100) after lastname;
Alter table customers
modify phone varchar(20);
describe customers;
Alter table customers;
-- Arithmetic operators --
select 2+3 as addition;
select 3-2 as substraction;
select 3*2 as multipliication;
select 10/2 as division;
select 10%3 as modulas;
-- Comparision operators --
select 34>67;
select 34<67;
select 5=5;
-- Logical Operator --
select 3>1 and 5>4;
select 5>4;
select 3>1 or 5>40 as result;
select now();
select current_date();
select curdate();
Create table voter_table (
Name varchar(40),
Age int check (Age>=18),
Email varchar(20) default "dummy@gmail.com"
);
desc voter_table;
select * from voter_table
desc voter_table;
insert into voter_table values
 ("sachin T", 18, "s.t@gmail.com");
insert into voter_table values
( "siddhesh t", 18, "s.t@gmail.com");
select * from voter_table;
insert into voter_table values
("siddhesh", 18, default);
CREATE TABLE Employee (
EmployeeId INT PRIMARY KEY,
FullName VARCHAR(45) NOT NULL,
Department VARCHAR(45) NOT NULL,
Salary float NOT NULL,
Gender VARCHAR(45) NOT NULL,
Age INT NOT NULL
);
INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
 ProjectName VARCHAR(200) NOT NULL,
 EmployeeId INT,
 StartDate DATETIME,
 EndDate DATETIME);
 select * from Employee where department = "hr";
 select * from employee order by department;




