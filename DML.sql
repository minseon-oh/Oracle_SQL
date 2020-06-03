--isnert �������߰�
desc departments;
select * from departments;
--ù���� ���(��� �÷��� �ѹ��� ����)
insert into departments values(280, 'developer', null, 1700);
rollback;
--�ι�° ���(���� �÷��� �����ϰ� ����)
insert into departments(department_id, department_name, location_id ) values(280, '������', 1700);
insert into departments(department_id, department_name, location_id ) values(290, '�����̳�', 1800);
insert into departments(department_id, department_name, location_id ) values(300, 'DB������', 1900);
insert into departments values (310, '�����ͺм���', 200, 1800);
insert into departments values (320, '����������', 200, 1800);
rollback;

--����° ���(�������� ��)
create table managers as (select * from employees where 1 = 2); --�纻���̺�
insert into managers (select * from employees where job_id = 'IT_PROG' );
insert into managers (employee_id, first_name, last_name, job_id, salary, hire_date, email) 
(select employee_id, first_name, last_name, job_id, salary, hire_date, email from employees);
select * from managers;
rollback;

---update (������ ����)
create table emps as (select * from employees where 1 = 1);
update emps set salary = 30000; --�̷��� �ϸ�? ū�ϳ���
rollback;

select * from emps;
update emps set salary = 30000 where employee_id = 100;
update emps set salary = salary + salary * 0.2 where employee_id = 100; --set���� �ڿ� �������� ���ϴ�
update emps set phone_number = '515.124.4566', hire_date = sysdate, manager_id = 102 where employee_id = 100;
--update��������
update emps set(job_id, salary, manager_id) = (select job_id, salary, manager_id from employees where employee_id = 100)
where employee_id = 101;
rollback;

--delete(������ ����)
select * from emps where employee_id = 103;
delete from emps where employee_id= 103;
--delete��������
delete from emps where employee_id in (select employee_id from employees where department_id = 100);
delete from emps where department_id = (select department_id from departments where department_name = 'Shipping');
rollback;

--merge�� (����)
select * from emps;
delete from emps where employee_id <> 103;
update emps set first_name = '�浿', last_name = 'ȫ', hire_date = sysdate where employee_id = 103;


MERGE INTO emps a --Ÿ�����̺�
    USING (select * from employees where job_id = �ڿ���� ) b
    ON (a.employee_id = b.employee_id )
WHEN MATCHED THEN --ON���ǿ� ��ġ�ϴ� ���
    UPDATE SET
    a.first_name = b.first_name,
    a.last_name = b.last_name,
    a.hire_date = b.hire_date,
    a.salary = b.salary,
    a.commission_pct = b.commission_pct,
    a.manager_id = b.manager_id,
    a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name, b.email, 
    b.phone_number, b.hire_date, b.job_id, b.salary, b.commission_pct,
    b.manager_id, b.department_id);


select * from job_history;
