--lower(�ҹ���), initcap(�ձ��ڸ��빮�ڷ�), upper(�빮��)
select 'asdDEF' from dual; --dual�� ����� Ȯ���ϱ� ���� ���� ���̺�
SELECT 'asdDEF', lower('asdDEF'), upper('asdDEF') from dual;

SELECT last_name, lower(last_name), upper(last_name), initcap(last_name) from employees;
SELECT * from employees where lower(last_name) = 'abel';

--length(����), instr(���ڿ� ã��)
select 'abcdef' as example, length('abcdef'), instr('abcdef', 'b') from dual;
select first_name, length(first_name), instr(first_name, 'a') from employees;

--substr(���ڿ� �ڸ���), concat(���ڿ� ����)
select 'abcdef' as example, substr('abcdef', 1,3), concat('�ȳ�', '�ϼ���') from dual;
select first_name, substr(first_name, 1,2), concat(first_name, last_name) from employees;

--LPAD, RPAD(�� ���� �������ڿ��� ä���)
select LPAD('abc', 10, '*') from dual; -- ��������
select RPAD('abc', 10, '*') from dual; -- ��������

--LTRIM,RTRIM,TRIM(��������)
select LTRIM('javascript_java', 'java') from dual; --����
select RTRIM('javascript_java', 'java') from dual; --����
select TRIM(' java ') from dual; --�� �� ������ ����

--replace(���ڿ� �ٲٱ�)
select replace('my dream is a president', 'president', 'doctor') from dual;
select replace('my dream is a president', ' ', '') from dual;
select replace( replace('my dream is a president', 'president', 'doctor'), ' ', '')from dual;
select replace(concat('Hello ', 'world'), ' ', '') from dual;

-------------------------------------------------------------------------------------------
--���� 1. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���. 
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�) 
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
--�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�) 
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. �� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
select 
    RPAD(substr(first_name,1,3), 
    length(first_name), '*') as name, 
    LPAD(salary, 10, '*') as salary 
from employees where lower(job_id) = 'it_prog';


--���� 2. EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�. 
--���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. 
--���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
select 
    concat(first_name, last_name) as �̸�, 
    replace(hire_date, '/', '') as �Ի����� 
from employees order by �̸�;


--���� 3. EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ� 
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
select replace(phone_number, substr(phone_number, 1,3), '(02)') from employees;
--�� Ǯ��: select concat('(02)', substr(phone_number, 4,length(phone_number))) from employees;
