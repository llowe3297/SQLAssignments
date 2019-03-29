select * 
from departments;

SELECT first_name, gender, YEAR(current_timestamp)-
 YEAR("1959-12-12")-
(RIGHT(current_timestamp,5) < RIGHT("1967-06-08",5)) as age
from employees;

SELECT first_name, gender, salary, YEAR(current_timestamp)-
 YEAR("1984-12-12")-
(RIGHT(current_timestamp,5) < RIGHT("1967-06-08",5)) as age
from employees, salaries;

select * 
from employees
where first_name='Sumant' AND last_name='Peac'
or gender = 'F';

select emp_no as employeeno, dept_no as departmentno
from dept_manager;

select concat(from_date, to_date) as SalaryDates
from salaries
where salary>80000;

select emp_no, salary,
CASE WHEN salary <= 60000 then 'UNDERPAID'
	 WHEN salary >= 80000 then 'OVERPAID'
     ELSE 'PAID'
END AS paymentStatus
from salaries;

select *
from titles 
LIMIT 5;

select first_name, last_name, birth_date, emp_no
from employees
where emp_no IN (21000,60000);

select first_name, birth_date
from employees;

select first_name, last_name, birth_date
from employees
where gender = 'F'
order by first_name, last_name desc;

select first_name, last_name, datediff(hire_date, birth_date)/365 AS age_hire
from employees
where gender = 'F';

select *
from (select
first_name, datediff(hire_date, birth_date)/365 AS daysdiff
from employees)
as INNERTABLE 
where daysdiff >28;

select dept_name as name_and_dept, dept_no
from departments 
where dept_no = 'd007'
UNION 
select emp_no, dept_no
from dept_emp;

select departments.dept_name, dept_emp.emp_no
from departments, dept_emp
where departments.dept_no = dept_emp.dept_no;

select emp_no
from employees
where emp_no NOT IN (select emp_no from dept_manager);

select count(gender) as total_emp, sum(salary) as total_salary, avg(salary) as avg_salary
from salaries, employees
where gender = 'F';

insert into departments(dept_no, dept_name)
values ('d011', 'CS');
select 'd011', 'CS'
from departments;

update salaries
SET salary= salary*1.10
where from_date and to_date between '1985-01-01' and '1991-03-07' ;

SET sql_safe_updates = 0;

select salary
from salaries;

delete from departments where dept_name = 'TSU';

select *
from departments;





