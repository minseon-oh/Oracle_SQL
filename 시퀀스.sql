--������ (���������� �����ϴ� ��)
select * from user_sequences;

--������ ����
create SEQUENCE dept2_seq; --�ڵ�����
create SEQUENCE dept2_seq
    INCREMENT BY 1
    START with 1
    MAXVALUE 10
    NOCYCLE
    NOCACHE;

--������ ����
drop SEQUENCE dept2_seq;

--��������� (nextval, currval)
drop table dept2;
create table dept2(
    dept_no number(2,0) CONSTRAINT dept_no_pk PRIMARY KEY,
    dept_name varchar2(14),
    loca varchar2 (13),
    dept_date date
);

--���������� maxvalue�� �����ϸ� �����߻�
insert into dept2(dept_no, dept_name, loca, dept_date) values (dept2_seq.nextval, 'test', 'test', sysdate);
select * from dept2;

--�������� ���簪 Ȯ��
select dept2_seq.currval from dual;

--������ ����
alter SEQUENCE dept2_seq MAXVALUE 9999; --�ִ밪 9999�� ����
alter SEQUENCE dept2_seq INCREMENT by 100; --�������� 100����

--������ ���� �ٽ� ó������ ������ ���
select dept2_seq.currval from dual; --���� ������ �� Ȯ��
alter SEQUENCE dept2_seq INCREMENT by -110; --����������
select dept2_seq.nextval from dual; --������������ ó��
alter SEQUENCE dept2_seq INCREMENT by 1;
select dept2_seq.currval from dual;

--PK ���� 20200506-��������
--1. dept3_seq����
--2. insert�ÿ� to_char() || ������
create SEQUENCE dept3_seq;
create table dept3(
    dept_no VARCHAR2(30) CONSTRAINT dept3_no_pk PRIMARY KEY,
    dept_name VARCHAR2(30)
);
insert into dept3 values(to_char(sysdate, 'YYYYMMDD') || dept3_seq.nextval, '�׽�Ʈ');
select * from dept3;


------------------------------------
drop table depts;
drop table dept2;
drop table dept3;
drop table emps;
drop table jobs_it;
drop table managers;
drop table members;
drop SEQUENCE dept2_seq;
drop SEQUENCE dept3_seq;











