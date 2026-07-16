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