SELECT * FROM employees; --1
select first_name || ' '|| last_name as name from employees; --2
select * from employees where department_id = 50; --3
select first_name as �̸�,manager_id as �μ���ȣ,job_id as �������̵� from employees where department_id = 50; --4
select first_name as �̸�, salary as �޿�, salary + 300 as �λ�ȱ޿� from employees; --5
select first_name as �̸�, salary as �޿� from employees where salary >= 10000; --6
select first_name, job_id, commission_pct from employees where commission_pct is not null; --7
select first_name, hire_date , salary from employees where hire_date between '03/01/01' and '03/12/31'; --8
select first_name, hire_date , salary from employees where hire_date like '03%'; --9
select first_name, salary from employees order by salary desc; --10
select first_name, salary from employees where department_id = 60 order by salary desc; --11
SELECT first_name, job_id from employees where job_id in ('IT_PROG', 'SA_MAN'); --12
select first_name || ' ' || last_name || ' ����� �޿��� ' || salary || '�޷� �Դϴ�'  as Steven from employees where first_name = 'Steven' and last_name = 'King'; --13
select first_name, job_id from employees where job_id like '%MAN'; --14
select first_name, job_id from employees where job_id like '%MAN' order by job_id; --15


