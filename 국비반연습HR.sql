-- ���̺��� �⺻�� ��ȸ
select * from employees;
-- SQL���� ��ҹ��ڸ� ���������ʴ´�.
SELECT * FROM EMPLOYEES;

select employee_id from employees;
select employee_id, first_name, last_name, email from employees;
-- �÷��� ��ȸ�ϴ� ��ġ����  */+- ������ �����ϴ�.
select employee_id, first_name, last_name, salary, salary + salary * 0.1 from employees;
-- null�� Ȯ��
select commission_pct, manager_id from employees;
-- �÷� �����(�߿�!! ���� ��.)
select employee_id as ���̵�, first_name as �̸�, last_name as ��, salary + salary * 0.1 as ���ʽ� from employees;
-- ||������(���ڿ� ���ϱ� ����) SQL���� ���ڿ�ǥ�ø� Ȭ����ǥ��('') �Ѵ�.
select first_name || ' ' || last_name as ���� from employees;