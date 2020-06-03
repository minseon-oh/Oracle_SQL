--����ȯ �Լ� to_char, to_date, to_number

--��¥ -> ����
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD HH:MI:SS') from dual; --Y:�� M:�� D:�� HH:�� MI:�� SS:��
select to_char(sysdate, 'YY-MM-DD PM HH:MI:SS') from dual;

select to_char(hire_date, 'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YY"��"-MM"��"-DD"��"') from employees; --��¥���������� ����ϴ� ���� Ư�����ڸ� �� ���� ""�� ���´�.

--���� -> ����
select to_char(20000, '999999')from dual;
select to_char(20000, '9999')from dual; --�ڸ��� ����
select to_char(20000.21, '99999') from dual;
select to_char(20000.21, '99999.99') from dual; -- .�� �Ҽ����� ��Ÿ����.
select to_char(20000, '999,99') from dual; -- ,�� ǥ������

select salary from employees;
select to_char(salary, '$999,999') as salary from employees;

--���� -> ���� to_number
select '2000' + 2000 from dual; --�ڵ� ����ȯ
select to_number('2000') + 2000 from dual; --����� ����ȯ

select '$3,300' + 2000 from dual; --����
select to_number('$3,300', '$9,999') + 2000 from dual; --���� int�� ����Ͽ� ����� ����ȯ

--���� -> ��¥ to_date
select to_date('2020/01/31') from dual; --��¥���ĸ� ������������ �ڵ����� ��¥���
select to_date('2020/01-31') + 7 from dual;
select to_date('2020-02-03', 'YY/MM/DD') from dual;
select to_date('2020-03-03 12:23:03', 'YY/MM/DD HH:MI:SS') from dual; --��¥ fmt��  ����Ͽ� ����� ����ȯ

--null���� NVL, NVL2
--NVL(�÷�, null�ϰ�� ��ȯ�Ұ�)
select null from dual;
select NVL(null, 0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, NVL(commission_pct, 0) as commission_pct from employees;

--NVL2(�÷�, null�� �ƴҰ��, null�ϰ��)��
select NVL2(null, 'null�̾ƴմϴ�', 'null�Դϴ�') from dual;
select first_name, NVL2(commission_pct, 'true', 'false') from employees;
select first_name, NVL2(commission_pct, salary + salary * commission_pct, salary) as �޿� from employees;

--DECODE �� (else if��)
select DECODE('C', 'A', 'A�Դϴ�',
                   'B', 'B�Դϴ�',
                   'C', 'C�Դϴ�',
                        '���ξƴմϴ�'
             ) as result from dual;

select * from employees;             
select first_name, job_id, salary, 
       DECODE(job_id, 'IT_PROG', salary * 1.1,
                      'FI_MGR', salary * 1.2,
                      'FI_ACCOUNT', salary * 1.3,
                      'AD_VP', salary * 1.4,
                               salary
             ) as result from employees;

--case when then end
select first_name, job_id, salary,
      (case job_id when 'IT_PROG' then salary * 1.1
                   when 'FI_MGR' then salary * 1.2
                   when 'FI_ACCOUNT' then salary * 1.3
                   when 'AD_VP' then salary * 1.4
                   else salary
       END) as result
from employees;

-------------------------------------------------------------------------
--03_�Լ�.pdf�� p.44
--���� 1. �������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� 
--�ټӳ���� 10�� �̻��� ����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������.  
--���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
select * from employees; 
select employee_id as �����ȣ, concat(first_name || ' ',last_name) as �����, hire_date as �Ի�����,
       trunc((sysdate - hire_date) / 365) as �ټӳ�� from employees
       where trunc((sysdate - hire_date) / 365) >= 10 order by �ټӳ�� desc;


--���� 2. EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�. 
--100�̶�� �������, 120�̶�� �����ӡ� 121�̶�� ���븮�� 122��� �����塯 �������� ���ӿ��� ���� ����մϴ�.
--���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
select first_name, manager_id, department_id,
       DECODE(manager_id, 100, '���',
                          120, '����',
                          121, '�븮',
                          122, '����',
                               '�ӿ�'
              ) as result from employees where department_id = 50;






