--union(������ �ߺ�X), union all (������ �ߺ�O), intersect(������), minus(������)
select EMPLOYEE_id, first_name from employees where hire_date like '04%' --04�⵵ �Ի���
union
select EMPLOYEE_id, first_name from employees where department_id = 20;
union
select EMPLOYEE_id, first_name from employees where job_id = 'IT_PROG';

--����: �÷������� ��Ȯ�� ��ġ���Ѿ���.
select employee_id, first_name, last_name from employees where salary >= 5000
union all
select employee_id, first_name, last_name from employees where department_id = 20
union all
select 300,'ȫ','�浿' from dual
union all
select 400,'ȫ','����' from dual;
