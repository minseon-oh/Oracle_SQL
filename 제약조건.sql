create table dept2(
    dept_no NUMBER(2, 0), --2�ڸ������� ���� (�ڸ���, �Ҽ����ڸ���)
    dept_name VARCHAR2(14), --14byte
    loca VARCHAR2(13), --13byte
    dept_date DATE default sysdate, --default�� �ƹ����� �������ʾ��� �� �⺻�� ����
    dept_bonus NUMBER(10,0) --10�ڸ�
);

select * from dept2;
insert into dept2 values(99, '����', '����', sysdate, 2000000000);

--���߰�(ADD)
alter table dept2 add(dept_count number(3,0));
desc dept2;

--���̸� ����(rename column)
alter table dept2 rename column dept_count to emp_count;
desc dept2;

--�� ������ ���� (modify)
alter table dept2 modify (emp_count number(4));
desc dept2;

--�� ����(drop column)
alter table dept2 drop column emp_count;
desc dept2;

--���̺� ���� (drop table)
drop table dept2;
--drop table dept2 CASCADE CONSTRAINTS �������Ǹ�; (�̷� �͵� �ִ� �˾Ƹ� ����)

--���̺� ������ ��������
--���̺� �Ϸ��� ��������(NOT NULL, UNIQUE, PK, FK, CHECK)
--NOT NULL: null�� ������� �ʴ´�.
--UNIQUE: �ߺ������Ͱ� ������ ���� ����
--PK(primary key): �ߺ������� �����ϰ� null�� ������� �ʴ´�. ���̺��� �����ĺ� �÷�
--FK(foreign key): �������̺��� PK�� �����ϴ� �÷�
--CHECK: ���ǵ� ���ĸ� �������� ���

create table dept2(
    dept_no number(2,0) CONSTRAINT dept2_dept_no_pk PRIMARY KEY, --CONSTRAINT dept2_dept_no_pk�� ��������.
    dept_name varchar(14) NOT NULL,
    loca number(4,0) CONSTRAINT dept2_loca_loc_locid_fk REFERENCES locations(location_id),
    dept_date date CONSTRAINT dept2_deptdate_uk UNIQUE,
    dept_bonus number(10,0),
    dept_gender varchar2(1) CONSTRAINT dept2_deptgender_ck CHECK(dept_gender in ('F','M'))
);
drop table dept2;

--���̺��� ��������(��� �÷� ���� �Ŀ� ���������� �Ʒ����� �߰�)���������ٴ� �̰Ÿ� �� ���� ����Ѵ�.
create table dept2(
    dept_no number(2,0),
    dept_name varchar2(14) NOT NULL,
    loca number(4,0),
    dept_date date,
    dept_bonus number(10,0),
    dept_gender varchar2(1),
    --���̺�����������
    CONSTRAINT dept2_deptno_pk primary key (dept_no),
    CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptbonus UNIQUE (dept_date),
    CONSTRAINT dept2_deptgender_ck CHECK (dept_gender in('F', 'M'))
);

--FK�� �θ����̺� ���ٸ� �Ұ���.
insert into dept2 values(10, 'gg', 3300, sysdate, 123123, 'F');
insert into dept2 values(10, 'gg', 3000, sysdate, 123123, 'M');

drop table dept2;
--�������� �߰�, ����
create table dept2(
    dept_no number(2,0),
    dept_name varchar2(14) NOT NULL,
    loca number(4,0),
    dept_date date,
    dept_bonus number(10,0),
    dept_gender varchar2(1) CHECK (dept_gender in('F', 'M'))
);
alter table dept2 add CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no); --PK�߰�
alter table dept2 add CONSTRAINT dept2_deptdate_uk UNIQUE (dept_date); --UK�߰�
alter table dept2 add CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id); --FK�߰�

--�������� ����
alter table dept2 drop CONSTRAINT �������Ǹ�;

---------------------------------------------------------------------------------------------------------
--����1

create table MEMBERS(
    M_NAME varchar2(3) NOT NULL,
    M_NUM number(1,0),
    REG_DATE date,
    GENDER varchar2(1) CHECK (GENDER in('F', 'M')),
    LOCA number(4,0),
    CONSTRAINT mem_memnum_pk PRIMARY KEY (M_NUM),
    CONSTRAINT mem_regdate_uk UNIQUE (REG_DATE),
    CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY (LOCA) REFERENCES locations(location_id)
);
--alter table members add CONSTRAINT mem_memnum_pk PRIMARY KEY (M_NUM);
--alter table members add CONSTRAINT mem_regdate_uk UNIQUE (REG_DATE);
--alter table members add CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY (LOCA) REFERENCES locations(location_id);

drop table MEMBERS;
select * from members;
insert into members values('AAA', 1, '2018/07/01', 'M', 1800);
insert into members values('BBB', 2, '2018/07/02', 'F', 1900);
insert into members values('CCC', 3, '2018/07/03', 'M', 2000);
insert into members values('DDD', 4, sysdate, 'M', 2000);

select *
from members m
INNER JOIN locations l
ON m.loca = l.location_id order by m_num;


















