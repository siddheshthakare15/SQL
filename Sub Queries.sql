-- Sub Query --
-- Single Row Subquery --
-- Q. Find the employee having same salary as that of James Brown
use bankingDB;
select salary from employee where fullname= "James Brown";
select * from employee where salary = (select salary from employee where fullname= "James Brown");
select Department from employee where EmployeeID= 1007;
select * from employee where department = (select Department from employee where EmployeeID= 1007);
select fullname from employee where EmployeeID= 1010 ;
select substring((select fullname from employee where EmployeeID = 1010),2, 1);
select * from employee where substring(fullname, 2, 1)= (select substring((select fullname from employee where employeeid=1010), 2,1));
select age from employee where employeeid=1009 or employeeid=1010;
select * from employee where age in (select age from employee where employeeid=1009 or employeeid=1010);
select salary from employee where fullname="Anurag Mohanty";
select * from employee where salary in (select salary from employee where salary>"Anurag Mohanty");
select * from employee where age < any (select age from employee where employeeid in (1001,1002));
select * from employee where age <26 or age <28;
select * from employee where age >26 or age >28;
select * from employee where age < any (select age from employee where fullname="James Brown" or fullname="Linda Jones");
select * from employee where age < all (select age from employee where fullname="James Brown" or fullname="Linda Jones");
select * from employee where age <26 and age <28;
select age from employee where fullname="James Brown" or fullname="Linda Jones";
select * from employee;
select * from projects;
