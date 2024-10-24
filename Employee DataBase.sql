create database Emp_01;
use Emp_01;
create table Emp(EmpNo int, EName varchar(10), Job varchar(10), MGR int, Hire_Date varchar(50), Sal int, Comm int, DeptNo int, foreign key Emp(DeptNo) references Dept(DeptNo));
insert into Emp(EmpNo,Ename,Job,MGR,Hire_Date,Sal,Comm,DeptNo) values 
(7369,"SMITH","CLERK",7902,"17-DEC-80",800,null,20),
(7499,"ALLEN","SALESMAN",7698,"20-FEB-81",1600,300,30),
(7521,"WARD","SALESMAN",7698,"22-FEB-81",1250,500,30),
(7566,"JONES","MANAGER",7839,"02-APR-81",2975,null,20),
(7654,"MARTIN","SALESMAN",7698,"28-SEP-81",1250,1400,30),
(7698,"BLAKE","MANAGER",7839,"01-MAY-81",2850,null,30),
(7782,"CLARK","MANAGER",7839,"09-JUN-81",2450,null,10),
(7788,"SCOTT","ANALYST",7566,"19-APR-87",3000,null,20),
(7839,"KING","PRESIDENT",null,"17-NOV-81",5000,null,10),
(7844,"TURNER","SALESMAN",7698,"08-SEP-81",1500,0,30),
(7876,"ADAMS","CLERK",7788,"23-MAY-87",1100,null,20),
(7900,"JAMES","CLERK",7698,"03-DEC-81",950,null,30),
(7902,"FORD","ANALYST",7566,"03-DEC-81",3000,null,20),
(7934,"MILLER","CLERK",7782,"23-JAN-82",1300,null,10);
select * from Emp;
desc Emp;

create table Dept(DeptNo int primary key, Dname varchar(10), LOC varchar(10));
show tables;
desc dept;
insert into dept(DeptNo,DName,LOC) values (10,"Accounting","New York"),(20,"Research","Dallas"),(30,"Sales","Chicago"),(40,"Operations","Boston");
select * from Dept;


 -- 1) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL.
 select * from Emp where comm is null;

 -- 2) LIST ALL THE EMPLOYEES WHO DON’T HAVE A REPORTING MANAGER.
 select * from Emp where MGR is null;

 -- 3) LIST ALL THE SALESMEN IN DEPT 30.
 select * from Emp where Job = 'SALESMAN' and DeptNo = 30;

 -- 4) LIST ALL THE SALESMEN IN DEPT NUMBER 30 AND HAVING SALARY GREATER THAN 1500.
 select * from Emp where Job = 'Salesman' and DeptNo = 30 and  Sal > 1500;

 -- 5) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘S’ OR ‘A’.
 select * from Emp where EName like 'S%' or EName like 'A%';

 -- 6) LIST ALL THE EMPLOYEES EXCEPT THOSE WHO ARE WORKING IN DEPT 10 & 20.
 select * from Emp where DeptNo not in (10,20);

 -- 7) LIST THE EMPLOYEES WHOSE NAME DOES NOT START WITH ‘S’.
 select * from Emp where EName not like 'S%';

 -- 8) LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10.
select * from Emp where Job = 'Manager' and DeptNo = 10;

-- 9) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL AND WORKING AS CLERK.
select * from Emp where Comm is null and Job = 'Clerk';

-- 10) LIST ALL THE EMPLOYEES WHO DON’T HAVE A REPORTING MANAGER IN DEPTNO 10 OR 30.
select * from Emp where MGR is null and DeptNo in (10,30);

-- 11) LIST ALL THE SALESMEN IN DEPT 30 WITH SAL MORE THAN 2450.
select * from Emp where Job = 'Salesman' and DeptNo = 30 and Sal > 2450;

-- 12) LIST ALL THE ANALYST IN DEPT NUMBER 20 AND HAVING SALARY GREATER THAN 2500.
select * from Emp where Job = 'Analyst' and DeptNo = 20 and Sal > 2500;

-- 13) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘M’ OR ‘J’.
select * from Emp where EName like 'M%' or EName like 'J%';

-- 14) LIST ALL THE EMPLOYEES WITH ANNUAL SALARY EXCEPT THOSE WHO ARE WORKING IN DEPT 30.
select EName,DeptNo,Sal*12 as Annual_Salary from Emp where DeptNo != 30;

-- 15) LIST THE EMPLOYEES WHOSE NAME DOES NOT END WITH ‘ES’ OR ‘R’.
select * from emp where Ename not like '%ES' and Ename not like '%R';