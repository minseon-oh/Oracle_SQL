--회원정보
create table member(
    mem_id varchar2(20),
    name varchar2(20),
    phone varchar2(20),
    address varchar(50)
);

alter table member add CONSTRAINT mem_id_pk PRIMARY KEY (mem_id);
alter table member add(class_name  varchar2(20));

--직원정보
create SEQUENCE e_seq;
create table employees (
    em_no number(5,0),
    em_name varchar2(30) not null,
    em_phone varchar2(30) not null,
    em_address varchar2(30) not null
);

alter table employees add CONSTRAINT employees_em_no PRIMARY KEY (em_no); 
alter table employees add(class_name varchar2(20));

--수업정보
create SEQUENCE class01_seq;
create table class01(
class_no number(20),
class_name varchar2(20),
class_room varchar2(20)
);

alter table class01 add CONSTRAINT class01_pk primary key (class_no);

select * from member;
select * from employees;
select * from class01;
