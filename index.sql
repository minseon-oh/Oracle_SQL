--INDEX는 pk, unique가 제약조건을 생성했을 때 자동으로 생성된다.
--검색속도를 빠르게해준다.

create table emps as (select * from employees where 1 = 1);
select * from emps;

--인덱스 추가
create index emps_first_name_idx ON emps(first_name); --인덱스이름 on 테이블명(컬럼명)
select * from employees where first_name = 'Susan';
select * from employees where last_name = 'Mavris';

--인덱스 삭제
drop index emps_first_name_idx;