--���� 1. -EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
--EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ� ���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. 
--(�޶����� ���� ���� Ȯ��)

select e.department_id from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

select e.department_id from employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

select e.department_id from employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

----------------------------------------------------------------------------------------------------------
--���� 2. -EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ��� 
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

select concat(first_name, last_name), e.department_id
from employees e INNER JOIN departments d 
ON e.department_id = d.department_id
where e.employee_id = 200;

----------------------------------------------------------------------------------------------------------
--���� 3. -EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ���� 
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��

select concat(first_name, last_name), e.job_id, j.job_title 
from employees e INNER JOIN jobs j
ON e.job_id = j.job_id order by e.first_name;

----------------------------------------------------------------------------------------------------------
--���� 4. --JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.

select * from jobs j
LEFT OUTER JOIN job_history h
ON j.job_id = h.job_id;

----------------------------------------------------------------------------------------------------------
--���� 5. --Steven King�� �μ����� ����ϼ���.

select concat(first_name, last_name), department_name
from employees e
JOIN departments d
ON e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

----------------------------------------------------------------------------------------------------------
--���� 6. --EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���

select * from employees
CROSS JOIN departments;

----------------------------------------------------------------------------------------------------------
--���� 7. --EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� 
--SA_MAN ������� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)

select e.employee_id as �����ȣ, 
        concat(first_name, last_name) as �̸�, 
        salary as �޿�, 
        department_name as �μ���, 
        street_address as �ٹ���
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
where e.job_id = 'SA_MAN';

----------------------------------------------------------------------------------------------------------
--���� 8. -- employees, jobs ���̺��� ���� �����ϰ� job_title�� 
--'Stock Manager', 'Stock Clerk'�� ���� ������ ����ϼ���.

select * from employees e
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id
where job_title = 'Stock Manager' or job_title = 'Stock Clerk';
--where job_title in('Stock Manager', 'Stock Clerk');

----------------------------------------------------------------------------------------------------------
--���� 9. -- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���

select d.department_name as �μ���, count(e.department_id) as ������ 
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id 
group by department_name
having count(e.department_id) = 0;

--��Ǯ��
select d.department_id, d.department_name, e.employee_id
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id 
where employee_id is null;

----------------------------------------------------------------------------------------------------------
--���� 10. -join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ��� 
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.

select concat(e.first_name, e.last_name) as �̸�, concat(m.first_name, m.last_name) as �Ŵ����̸�
from employees e
INNER JOIN employees m
ON e.employee_id = m.manager_id;

----------------------------------------------------------------------------------------------------------
--���� 11. --6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ��� 
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���

select concat(e.first_name, e.last_name) as �̸�, concat(m.first_name, m.last_name) as �Ŵ����̸�, m.salary as �Ŵ����޿�
from employees e
LEFT OUTER JOIN employees m
ON e.employee_id = m.manager_id
where concat(m.first_name, m.last_name) is not null order by m.salary desc;