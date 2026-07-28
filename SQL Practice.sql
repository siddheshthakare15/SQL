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

CREATE DATABASE company;
USE company; 
CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);
CREATE TABLE proj (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Employee_ID INT,
-- Defining Foreign Key and Cascading Behavior 
FOREIGN KEY (Employee_ID) 
REFERENCES Employees(ID) 
ON UPDATE CASCADE 
ON DELETE CASCADE );

INSERT INTO Employee (ID, Name, Age) VALUES
(101, 'Alice Smith', 30),
(102, 'Bob Jones', 28);
INSERT INTO projects (Project_ID, Project_Name, Employee_ID) VALUES
(1, 'Website Redesign', 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App', 102);
UPDATE Employee
SET ID = 999
WHERE ID = 101;
DELETE FROM Employee
WHERE ID = 999;
select * from employee;
show tables;
alter table accounts
Add constraint FK_Accounts_customers
Foreign key (AccountID)
References Customers(CustomerID);
alter table accounts
Add customerID INT;
Alter table accounts
Add constraint FK_Accounts
foreign key (customerID)
references Customers(CustomerID);

select * from customers;
select * from employee;
select fullname,salary from employee;
select * from employee where Department="IT" and age=28;
select * from employee where salary=35000;
use bankingdb;
select * from employee where age !=28;
select * from employee where age in (25,28);
select * from employee where salary in (75000,35000);
select * from employee where salary between 35000 and 75000;
select * from employee where salary between 50000 and 75000;
select * from employee where age between 25 and 27;
select * from employee where employeeid in (1002,1007,1010);
select * from employee where fullname like "M%";
select * from employee where fullname like "%n";
select * from employee where fullname like "__m%";
select * from employee where fullname like "%l%";
select * from employee order by age;
select * from employe0e order by age desc;
select distinct Department from employee;
select * from employee limit 5;
select * from employee order by employeeid desc  limit 5; 
select * from employee order by employeeid limit 2,4;
select * from employee order by employeeid limit 4,2;
select * from employee order by employeeid limit 5 offset 2;
select * from employee order by fullname;
select * from employee order by salary desc limit 5;
select distinct Department from employee;
select * from projects;
INSERT INTO Projects VALUES 
'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
'Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
'MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), 
INTERVAL 10 DAY)),
'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 
DAY)),
'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 
DAY)),
'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), 
INTERVAL 10 DAY));
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
 ProjectName VARCHAR(200) NOT NULL,
 EmployeeId INT,
 StartDate DATETIME,
 EndDate DATETIME
);
INSERT INTO Projects VALUES 
('Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), 
INTERVAL 10 DAY)),
('Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 
DAY)),
('Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 
DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), 
INTERVAL 10 DAY));
INSERT INTO Projects (ProjectName, EmployeeID, StartDate, EndDate)
VALUES
('Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));
select * from projects;
select fullname, salary,
case
when salary>=50000 then "Highly paid"
else "Low paid"
end as "Remarks"
from employee;
-- Group by --
select department, count(department) from employee group by department; 
select department, count(department) from employee where gender="Male" group by department;
select department, count(department) from employee where salary>=50000 group by department;
-- Group By HAVING Clause --
select department, sum(salary) from employee group by department having sum(Salary)>150000;
Select gender, Count(Gender) from employee group by gender;
Select gender, count(*) from employee group by gender having sum(salary)>=250000;
select fullname , gender, salary from employee where salary>=50000;
select EmployeeID, Fullname, department, salary,
AVG(salary) over (PARTITION BY Department) AS DepartmentAverageSalary from employee order by department, salary desc;
select EmployeeID, Gender, Age,
Avg(Age) over (Partition by gender) as Averageagesalary from employee order by gender, salary desc;
-- Row Number --
Select EmployeeID, Fullname, Department,
Row_number() over (Partition by department) as RANKIDDEPARTMENT From employee order by Department;
--  Ranking Window Functions --
select employeeID, fullname, department, salary, 
rank() over (order by salary) as overallsalaryrank from employee order by overallsalaryrank;
select employeeID, fullname, department, salary, 
dense_rank() over (order by salary) as overallsalaryrank from employee order by overallsalaryrank;
-- String Fumctions --
-- Concat --
select * from employee;
select concat("Sacchin", "", "Tendulkar") as Name;
select  concat(FullName, "-", Department) as Detail from employee;
select lower(fullname) from employee;
select upper(fullname) from employee;

select replace("Hi ! How arre you !", "Hi","Bye");
select fullname, replace(fullname,"Mohanty","Patil") as new from employee;
select fullname, replace(fullname,"Smith","Patil") as new from employee;
select fullname, replace(fullname,"Doe","Thakare") as new from employee;
select fullname, Reverse(fullname) as Reversed from employee;
select fullname, length(fullname) as char_length from employee;
select substring('GOOD MORNING', 1, 3) AS EXTRACTSTRING;
select substring('GOOD MORNING', 3, 3) AS EXTRACTSTRING;
select substring('GOOD MORNING', 3, 5) AS EXTRACTSTRING,LENGTH(SUBSTRING ('GOOD MORNING', 3, 5)) AS CLK;
sELECT SUBSTRING(FULLNAME, 1, 5) AS CLIPPED FROM EMPLOYEE;
 Create table CSV_Table 
 (name VARCHAR(100),
 modified VARCHAR(100));
 INSERT INTO CSV_Table Values
 ("AMAN","AMAN  "),
 ("SUMAN","  SUMAN"),
 ("KIRAN","  KIRAN"),
 ("DINESH","DINESH  ");
 select te.*,length(modified) as OG_Length,
 rtrim(modified),length(rtrim(modified)) as lN from CSV_Table as te;
 select te.*,length(modified) as OG_Length,
 trim(modified),length(ltrim(modified)) as lN from CSV_Table as te;
 select ABS(90);
 select MOD(5,2);
 select floor(42.2);
 select ceiling(42.2);
 select truncate(123.4567,-2);
 select power(2,8);
 select sqrt(255);
 select curdate();
 select NOW();
 select sysdate();
 select last_day(NOW());
 select last_day("2026-03-2");
 SELECT DATEDIFF("2004-06-15",NOW());
 SELECT MONTH(NOW());
 SELECT year(now());