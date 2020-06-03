--시퀀스 (순차적으로 증가하는 값)
select * from user_sequences;

--시퀀스 생성
create SEQUENCE dept2_seq; --자동생성
create SEQUENCE dept2_seq
    INCREMENT BY 1
    START with 1
    MAXVALUE 10
    NOCYCLE
    NOCACHE;

--시퀀스 삭제
drop SEQUENCE dept2_seq;

--시퀀스사용 (nextval, currval)
drop table dept2;
create table dept2(
    dept_no number(2,0) CONSTRAINT dept_no_pk PRIMARY KEY,
    dept_name varchar2(14),
    loca varchar2 (13),
    dept_date date
);

--시퀀스값이 maxvalue에 도달하면 에러발생
insert into dept2(dept_no, dept_name, loca, dept_date) values (dept2_seq.nextval, 'test', 'test', sysdate);
select * from dept2;

--시퀀스의 현재값 확인
select dept2_seq.currval from dual;

--시퀀스 수정
alter SEQUENCE dept2_seq MAXVALUE 9999; --최대값 9999로 변경
alter SEQUENCE dept2_seq INCREMENT by 100; --증가값이 100단위

--시퀀스 값을 다시 처음으로 돌리는 방법
select dept2_seq.currval from dual; --현재 시퀀스 값 확인
alter SEQUENCE dept2_seq INCREMENT by -110; --증가값변경
select dept2_seq.nextval from dual; --다음시퀀스값 처리
alter SEQUENCE dept2_seq INCREMENT by 1;
select dept2_seq.currval from dual;

--PK 값을 20200506-시퀀스값
--1. dept3_seq생성
--2. insert시에 to_char() || 시퀀스
create SEQUENCE dept3_seq;
create table dept3(
    dept_no VARCHAR2(30) CONSTRAINT dept3_no_pk PRIMARY KEY,
    dept_name VARCHAR2(30)
);
insert into dept3 values(to_char(sysdate, 'YYYYMMDD') || dept3_seq.nextval, '테스트');
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











