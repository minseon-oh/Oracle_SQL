--숫자함수 round(올림), trunc(절삭)
select 45.123 from dual;
select round(45.123, 1),
       round(45.123),
       round(45.123, 0),
       round(45.123, -1)
from dual;

select trunc(45.123, 1),
       trunc(45.123),
       trunc(45.123, 0),
       trunc(45.123, -1)
from dual;

select  ceil(34.1) from dual; --올림
select  floor(34.1) from dual; --내림

--날짜 함수 sysdate, systimestamp
select sysdate from dual; --현재날짜
select systimestamp from dual; --현재날짜 및 시간

--날짜도 연산이 가능하다.
select sysdate - 27 from dual;
select sysdate - hire_date from employees; --입사한 일수

select first_name, hire_date, (sysdate - hire_date) / 7 from employees; -- 주 단위 계산
select first_name, hire_date, (sysdate - hire_date) / 365 from employees; --년 단위 계산
select first_name, hire_date, (sysdate - hire_date) / 365 * 12 from employees; --월 단위 계산

--round, trunc날짜에 적용
select round(sysdate, 'year') from dual; --년 기준으로 반올림
select round(sysdate, 'month') from dual; --월 기준으로 반올림
select round(sysdate, 'day') from dual; --일 기준으로 반올림(해당 주의 일요일 날짜)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --년 기준으로 절삭
select trunc(sysdate, 'month') from dual; --월 기준으로 절삭
select trunc(sysdate, 'day') from dual; --일 기준으로 절삭(해당 주의 일요일 날짜 기준)
