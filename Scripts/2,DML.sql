INSERT INTO DEPARTMENT VALUES(1, '영업', 8);
INSERT INTO DEPARTMENT VALUES(2, '기획', 10);
INSERT INTO DEPARTMENT VALUES(3, '개발', 9);
INSERT INTO DEPARTMENT VALUES(4, '총무', 7);

INSERT INTO TITLE VALUES (1, '사장');
INSERT INTO TITLE VALUES (2, '부장');
INSERT INTO TITLE VALUES (3, '과장');
INSERT INTO TITLE VALUES (4, '대리');
INSERT INTO TITLE VALUES (5, '사원');

INSERT INTO EMPLOYEE VALUES(4377, '이성래', 1, NULL, 5000000, 2);
INSERT INTO EMPLOYEE VALUES(3426, '박영권', 3, 4377, 3000000, 1);
INSERT INTO EMPLOYEE VALUES(3011, '이수민', 2, 4377, 4000000, 3);
INSERT INTO EMPLOYEE VALUES(3427, '최종철', 5, 3011, 1500000, 3);
INSERT INTO EMPLOYEE VALUES(1003, '조민희', 3, 4377, 3000000, 2);
INSERT INTO EMPLOYEE VALUES(2106, '김창섭', 4, 1003, 2500000, 2);
INSERT INTO EMPLOYEE VALUES(1365, '김상원', 5, 3426, 1500000, 1);

select * from title;
select * from department;
select * from employee;

-- Student

insert into student values (1,'전수린',90,90,90);
insert into student values (2,'김상건',91,91,91);
insert into student values (3,'이태훈',92,92,92);

select * from student;

select user (), database();

select empno, empname, title, manager, salary, dept 
from employee e join title t on e.title = t.tno;

-- 
select  e.empno, e.empname, t.tno, t.tname ,m.empno, m.empname, e.salary, e.dept 
from employee e join title t on e. title = t.tno
join employee m on e.manager = m.empno;
select * from employee;
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