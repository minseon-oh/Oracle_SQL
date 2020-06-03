--INNER JOIN
select * from info INNER JOIN auth ON info.auth_id = auth.auth_id;

--auth_id�÷��� ���� ����ϸ� ���� ���̺� ��� �����ϱ⶧���� ��ȣ�ϴٴ� ������ ���.
--�̷� �� �÷��� ���̺��̸�.�÷����� ��Ī�Ͽ� ���������� ��ȸ�� �� �ִ�.
select id, title, content, regdate, info.auth_id, name
from info INNER JOIN auth ON info.auth_id = auth.auth_id;

--�Ϲ������� TABLE������� ��¡�ؼ� ��밡���ϴ�.
select id, title, content, regdate, i.auth_id, name
from info i --info�� i�� ��Ī
INNER JOIN auth a --auth�� a�� ��Ī
ON i.auth_id = a.auth_id;

--������ where����
select id, title, content, regdate, i.auth_id, name
from info i --info�� i�� ��Ī
INNER JOIN auth a --auth�� a�� ��Ī
ON i.auth_id = a.auth_id
where i.auth_id = 1;

--------------------------------------------------------------------------
--OUTER JOIN
select * from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select * from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select * from info i
FULL OUTER JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------
--CROSS JOIN
select * from info i
CROSS JOIN auth a;

--------------------------------------------------------------------------
select * from employees;
select * from departments;
select * from locations;

select * from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations i
ON d.location_id = i.location_id
where d.department_name = 'Finance';
--------------------------------------------------------------------------
--���̺� auth, info���̺��� job�÷��� scientist�� ����� id, title, content, job�� ���
select i.auth_id, title, content, job
from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id
where job = 'scientist';

--RIGHT OUTER JOIN ��
select i.auth_id, title, content, job
from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id
where job = 'scientist';