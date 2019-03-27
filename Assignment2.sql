USE employees;
SELECT count(distinct emp_no)
from salaries;

SELECT count(distinct emp_no),avg(salary) as avg_sal
from salaries s, titles t
where s.emp_no = t.emp_no
group by emp_no, titles;

select dept_no, emp_no, to_date, from_date, DATEDIFF (to_date, from_date)
as DateDif
from salaries;

select emp_no, avg(salary) as avg_sal, count(*) as cnt_emp
from salaries
group by emp_no;#, salary;

select title, avg (salary) as avg_sal, max(salary) as max_sal
from salaries s, titles t
where s.emp_no = t.emp_no
group by title;

select e.emp_no, first_name, last_name, to_date, from_date,
DATEDIFF (to_date, from_date)/365 as DateGap
from titles t, employees e
where t.emp_no = e.emp_no and title ='Manager' and gender ='F'
and DATEDIFF (to_date, from_date)/365 > 3;



select e.emp_no, first_name, last_name, gender, title
From employees e left join titles t on e.emp_no = t.emp_no
where title ='senior staff';

select e.emp_no, first_name, last_name, gender, dept_name, avg (salary) as avg_sal, MIN(salary), MAX(salary)
from departments dn, titles t, employees e, salaries s, dept_emp de 
where dn.dept_no = de.dept_no and de.emp_no = e.emp_no and
e.emp_no = t.emp_no and e.emp_no = s.emp_no 
group by e.emp_no, first_name, last_name, dept_name;




select *
from employees 
where first_name LIKE 'Dan%';

select gender 
from employees
where gender = 'M';

select dept_no, emp_no, salary, to_date, from_date, DATEDIFF(to_date,from_date)
AS dateGAP
from salaries, departments
where to_date > '1985-01-01';

select to_date, from_date, dept_no
from dept_emp
where from_date and to_date between '1985-01-01' and '1991-03-07' and dept_no = 'd007' ; 


USE employees;

select distinct emp_no
from  salaries;

