--INDEX�� pk, unique�� ���������� �������� �� �ڵ����� �����ȴ�.
--�˻��ӵ��� ���������ش�.

create table emps as (select * from employees where 1 = 1);
select * from emps;

--�ε��� �߰�
create index emps_first_name_idx ON emps(first_name); --�ε����̸� on ���̺��(�÷���)
select * from employees where first_name = 'Susan';
select * from employees where last_name = 'Mavris';

--�ε��� ����
drop index emps_first_name_idx;