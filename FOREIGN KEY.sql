Create database fk_db8;
use fk_db8;
Create table employee (
ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Age INT,
Salary DECIMAL(10,2)
);
select * from employee;

create table project (
projectID INT PRIMARY KEY,
ProjectName VARCHAR(100) NOT NULL,
ID INT,
foreign key (ID) references Employee(ID)
on update Cascade
on delete cascade
);
select * from project;

INSERT into employee values
(101, 'Alice smith', 29, 75000),
(102, 'Bob Jones' , 34, 82000),
(103, 'Charlie Brown' , 41, 95000),
(104, 'Diana Prince', 26 , 68000);
select * from employee;

Insert into Project values
(1, 'Website Redesign' , 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App Launch', 102),
(4, 'Data Analytics Pipeline', 103);
select * from project;
delete from employee where ID=103;
show tables;
update employee set ID=5000 WHERE ID=101;



