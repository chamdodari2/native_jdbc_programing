select user(), database();

show tables;

select *from title;

desc title;
desc department;
desc department ;

-- --------------------------------------------


select *from department;
select *from title;
select *from employee;


select tno, tname from title;
select tno, tname from title where tno = 3;
select empno, empname,title,manager,salary,dept from employee;
select empno, empname,title,manager,salary,dept from employee where empno = 1003;




select deptNo, deptName, floor from department;
select empno, empname,title, from title;


update employee set empname ='김예찐' where empno = 1004;
update department set deptname='계약직',floor = 1  where deptno =6;
update title set tname='계약직' where tno =6;
update 


delete from employee where empno = 1004;
delete from department where deptno = 9;
select * from department ;


delete from department where deptno = 5;  -- 안되면 1로 해보기
delete from title where tno = 6;


select * from department;
select * from title;


insert int employee values (1004,'김예진',5,4377,3000000,5);
insert into title values(6,'인턴');
insert into department values(5,'인사',5);



select deptNo,deptName,floor from department;

-- ---------------------------------------------
SELECT e.*, t.*, m.EMP_NO , m.EMP_NAME, d.*
FROM EMPLOYEE e JOIN TITLE t ON e.TNO = t.TITLE_NO
LEFT JOIN EMPLOYEE m ON e.MANAGER = m.EMP_NO
JOIN DEPARTMENT d ON e.DNO = d.DEPT_NO ;


select * from vw_employee;

--      
select e.empno ,e.empname,e.title,t.tname ,e.manager,m.empname ,e.salary ,e.dept ,d.deptName ,d.floor
from employee e join title t on e.title = t.tno
	left join employee m on e.manager =m.empno
	join department d on e.dept = d.deptno;

create or replace view vw_employee
(empno,emp_name,title_no,title_name,manager,mgr_name,salary,dept_no,dept_name,floor)
as 
select e.empno ,e.empname,e.title,t.tname ,e.manager,m.empname ,e.salary ,e.dept ,d.deptName ,d.floor
from employee e join title t on e.title = t.tno
	left join employee m on e.manager =m.empno
	join department d on e.dept = d.deptno;

select * from employee;
select * from department;
select * from title;


-- Student 
select  * from student;


insert into student values (1,'전수린',90,90,90);
insert into student values (2,'김상건',91,91,91);
insert into student values (3,'이태훈',92,92,92);
insert into student values (5,'김예진',90,90,90);

select stdno,stdname,kor,eng,math from student;
select stdno,stdname,kor,eng,math from student where stdno = 1;


-- 2021 02 22
select  e.empno, 
	e.empname, 
	t.tno, 
	t.tname ,
	m.empno, 
	m.empname, 
	e.salary, 
	d.deptno,
	d.deptname,
	d.floor
from employee e join title t on e.title = t.tno
left join employee m on e.manager = m.empno
join department d on e.dept = d.deptno;

 -- q뷰 새로만들기! 
create or replace view vw_full_employee
as
select  e.empno, 
	e.empname, 
	t.tno as title_no,
	t.tname as title_name,
	e.manager as manager_no,
	m.empname as manager_name,
	e.salary, 
	d.deptno,
	d.deptname,
	d.floor 
from employee e join title t on e.title = t.tno
left join employee m on e.manager = m.empno
join department d on e.dept = d.deptno;

select  empno,empname,title_no,title_name,manager_no,manager_name,slary,deptno,deptname,floor
from vw_full_employee ; 




select  empno, empname , title as title_no, manager as manager_no, salary, dept as deptno 
from employee;


insert  into employee values (1004,'천사',5,4377,2000000,1);
update employee set dept = 3
where empno = 1004;

delete 
from employee 
where empno = 1004;

select * from employee ;

delete 

select * from department;

select * from title;
select  deptno, deptname, floor from department;


-- 부서가 1인 사원정보를 출력
select  empno,empname , title, manager, salary ,dept
from employee 
where dept=(select deptno from department where deptno = 1); 
-- get dept하면 된다??? 

