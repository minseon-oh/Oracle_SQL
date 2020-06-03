-- 테이블의 기본적 조회
select * from employees;
-- SQL문은 대소문자를 구분하지않는다.
SELECT * FROM EMPLOYEES;

select employee_id from employees;
select employee_id, first_name, last_name, email from employees;
-- 컬럼을 조회하는 위치에서  */+- 연산이 가능하다.
select employee_id, first_name, last_name, salary, salary + salary * 0.1 from employees;
-- null값 확인
select commission_pct, manager_id from employees;
-- 컬럼 엘리어스(중요!! 많이 씀.)
select employee_id as 아이디, first_name as 이름, last_name as 성, salary + salary * 0.1 as 보너스 from employees;
-- ||연결자(문자열 더하기 형식) SQL문은 문자열표시를 홑따옴표로('') 한다.
select first_name || ' ' || last_name as 성함 from employees;