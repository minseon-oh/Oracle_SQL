SELECT * FROM employees; --1
select first_name || ' '|| last_name as name from employees; --2
select * from employees where department_id = 50; --3
select first_name as 이름,manager_id as 부서번호,job_id as 직무아이디 from employees where department_id = 50; --4
select first_name as 이름, salary as 급여, salary + 300 as 인상된급여 from employees; --5
select first_name as 이름, salary as 급여 from employees where salary >= 10000; --6
select first_name, job_id, commission_pct from employees where commission_pct is not null; --7
select first_name, hire_date , salary from employees where hire_date between '03/01/01' and '03/12/31'; --8
select first_name, hire_date , salary from employees where hire_date like '03%'; --9
select first_name, salary from employees order by salary desc; --10
select first_name, salary from employees where department_id = 60 order by salary desc; --11
SELECT first_name, job_id from employees where job_id in ('IT_PROG', 'SA_MAN'); --12
select first_name || ' ' || last_name || ' 사원의 급여는 ' || salary || '달러 입니다'  as Steven from employees where first_name = 'Steven' and last_name = 'King'; --13
select first_name, job_id from employees where job_id like '%MAN'; --14
select first_name, job_id from employees where job_id like '%MAN' order by job_id; --15


