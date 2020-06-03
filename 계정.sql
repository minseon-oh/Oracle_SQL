select * from all_users;

--계정생성
create user test01 IDENTIFIED by TEST01; --앞ID, 뒤PW

--권한부여 2가지방법
--1) grant create SESSION, create TABLE, create SEQUENCE, create VIEW to TEST01;
--2) grant RESOURCE, CONNECT to TEST01;

--테이블스페이스지정(데이터가 저장되는 물리적인 공간)
alter user 계정명 DEFAULT TABLESPACE 테이블스페이스명 quota UNLIMITED on 테이블스페이스명;
alter user TEST01 DEFAULT TABLESPACE users quota UNLIMITED on users;

--계정삭제
drop user TEST01;

--비밀번호 변경
alter user TEST01 IDENTIFIED by 바꿀비밀번호;