create table dept2(
    dept_no NUMBER(2, 0), --2자리수까지 저장 (자리수, 소수점자리수)
    dept_name VARCHAR2(14), --14byte
    loca VARCHAR2(13), --13byte
    dept_date DATE default sysdate, --default는 아무값이 들어오지않았을 때 기본값 설정
    dept_bonus NUMBER(10,0) --10자리
);

select * from dept2;
insert into dept2 values(99, '영업', '서울', sysdate, 2000000000);

--열추가(ADD)
alter table dept2 add(dept_count number(3,0));
desc dept2;

--열이름 수정(rename column)
alter table dept2 rename column dept_count to emp_count;
desc dept2;

--열 데이터 수정 (modify)
alter table dept2 modify (emp_count number(4));
desc dept2;

--열 삭제(drop column)
alter table dept2 drop column emp_count;
desc dept2;

--테이블 삭제 (drop table)
drop table dept2;
--drop table dept2 CASCADE CONSTRAINTS 제약조건명; (이런 것도 있다 알아만 놓기)

--테이블 생성과 제약조건
--테이블 일레벨 제약조건(NOT NULL, UNIQUE, PK, FK, CHECK)
--NOT NULL: null을 허용하지 않는다.
--UNIQUE: 중복데이터가 들어오는 것을 방지
--PK(primary key): 중복데이터 방지하고 null을 허용하지 않는다. 테이블의 고유식별 컬럼
--FK(foreign key): 참조테이블의 PK를 저장하는 컬럼
--CHECK: 정의된 형식만 들어오도록 허용

create table dept2(
    dept_no number(2,0) CONSTRAINT dept2_dept_no_pk PRIMARY KEY, --CONSTRAINT dept2_dept_no_pk는 생략가능.
    dept_name varchar(14) NOT NULL,
    loca number(4,0) CONSTRAINT dept2_loca_loc_locid_fk REFERENCES locations(location_id),
    dept_date date CONSTRAINT dept2_deptdate_uk UNIQUE,
    dept_bonus number(10,0),
    dept_gender varchar2(1) CONSTRAINT dept2_deptgender_ck CHECK(dept_gender in ('F','M'))
);
drop table dept2;

--테이블레벨 제약조건(모든 컬럼 선언 후에 제약조건을 아래에서 추가)위에꺼보다는 이거를 더 많이 사용한다.
create table dept2(
    dept_no number(2,0),
    dept_name varchar2(14) NOT NULL,
    loca number(4,0),
    dept_date date,
    dept_bonus number(10,0),
    dept_gender varchar2(1),
    --테이블레벨제약조건
    CONSTRAINT dept2_deptno_pk primary key (dept_no),
    CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptbonus UNIQUE (dept_date),
    CONSTRAINT dept2_deptgender_ck CHECK (dept_gender in('F', 'M'))
);

--FK가 부모테이블에 없다면 불가능.
insert into dept2 values(10, 'gg', 3300, sysdate, 123123, 'F');
insert into dept2 values(10, 'gg', 3000, sysdate, 123123, 'M');

drop table dept2;
--제약조건 추가, 삭제
create table dept2(
    dept_no number(2,0),
    dept_name varchar2(14) NOT NULL,
    loca number(4,0),
    dept_date date,
    dept_bonus number(10,0),
    dept_gender varchar2(1) CHECK (dept_gender in('F', 'M'))
);
alter table dept2 add CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no); --PK추가
alter table dept2 add CONSTRAINT dept2_deptdate_uk UNIQUE (dept_date); --UK추가
alter table dept2 add CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id); --FK추가

--제약조건 삭제
alter table dept2 drop CONSTRAINT 제약조건명;

---------------------------------------------------------------------------------------------------------
--문제1

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


















