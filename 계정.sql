select * from all_users;

--��������
create user test01 IDENTIFIED by TEST01; --��ID, ��PW

--���Ѻο� 2�������
--1) grant create SESSION, create TABLE, create SEQUENCE, create VIEW to TEST01;
--2) grant RESOURCE, CONNECT to TEST01;

--���̺����̽�����(�����Ͱ� ����Ǵ� �������� ����)
alter user ������ DEFAULT TABLESPACE ���̺����̽��� quota UNLIMITED on ���̺����̽���;
alter user TEST01 DEFAULT TABLESPACE users quota UNLIMITED on users;

--��������
drop user TEST01;

--��й�ȣ ����
alter user TEST01 IDENTIFIED by �ٲܺ�й�ȣ;