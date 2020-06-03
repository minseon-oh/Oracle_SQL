--2번문제--
create user COM03 IDENTIFIED by COM03;
grant connect, resource to COM03;

create TABLESPACE MYWEB
datafile 'd:/course/space'
size 100M AUTOEXTEND on next 10M;

alter user COM03 DEFAULT TABLESPACE MYWEB quota UNLIMITED on MYWEB;

drop user COM03;
drop TABLESPACE MYWEB;

--3번문제--
--문자: varchar2
--숫자: number
--날짜: date

--4번문제--
create SEQUENCE m_seq;
create table members(
    no number,
    id varchar2(10),
    pw varchar2(10),
    name varchar2(10),
    address varchar2(30),
    phone varchar2(11),
    member_type varchar2(20),
    use_yn varchar2(1),
    regdate date default sysdate
);
alter table members add CONSTRAINT m_pk primary key (id);
alter table members add CONSTRAINT m_ck check (use_yn in ('Y', 'N'));

insert into members 
values (m_seq.nextval,'com01','com01','홍길동','서울시',
'01012341234','관리자','Y','2019-10-10');
insert into members 
values (m_seq.nextval,'com02','com02','홍길자','서울시',
'01011111111','관리자','Y','2019-09-05');
insert into members 
values (m_seq.nextval,'kkk123','kkk123','이순자','부산시',
'01023234567','일반회원','Y','2020-05-04');

select * from members;

drop table members;
drop SEQUENCE m_seq;

