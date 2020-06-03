select * from employees;

-- where 절 (between, in)
select first_name, last_name, email, job_id from employees where job_id = 'IT_PROG';
select * from employees where last_name = 'King';

select * from employees where hire_date = '04/01/30'; --날짜
SELECT * from employees where salary >= 15000; --숫자
SELECT * from employees where department_id = 90;

SELECT * from employees where salary between 15000 and 30000;
SELECT * from employees where salary >= 15000 and salary <= 30000;
SELECT * from employees where hire_date between '03/01/01' and '03/12/31'; --날짜

select * from employees where department_id in (30, 60, 90); --포함되어있다면
select * from employees where manager_id in (101, 102, 103, 104, 105);
select * from employees where job_id in ('IT_PROG', 'AC_MGR');

--like검색 (%:모든, _:한글자 위치를 찾아낼 때)
select first_name || ' ' || last_name as 이름, hire_date as 입사일 from employees where hire_date like '03%'; --03년 입사
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%15'; --15일 입사
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%05%'; --숫자 05가 들어가는 모든
select first_name || ' ' || last_name, hire_date from employees where hire_date like '___05%'; --05월 입사

select first_name, email from employees where email like '%A%';
select first_name, email from employees where email like '_A%';

-- null검사 (is null, is not null)
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--and, or(and가 우선순위가 빠름)
select * from employees where job_id = 'IT_PROG' and salary >= 7000; --IT_PROG이고 7000이상
select * from employees where job_id = 'IT_PROG' or salary >= 7000; --IT_PROG이거나 7000이상

select * from employees where job_id = 'IT_PROG' or 'job_id' = 'FI_MGR' and salary >= 7000;
select * from employees where( job_id = 'IT_PROG' or 'job_id' = 'FI_MGR') and salary >= 7000; --소괄호 우선순위

--데이터 정렬 (select구문의 마지막)
select * from employees order by hire_date; --오름차순 (asc 생략가능)
select * from employees order by hire_date desc; --내림차순
select * from employees where job_id in ('IT_PROG', 'SA_REP') order by first_name asc;
select * from employees where salary between 5000 and 10000 order by employee_id desc;
select * from employees where commission_pct is not null order by first_name asc;

select * from employees order by hire_date asc, first_name desc; --hire_date먼저 차순정렬 시키고 그 안에서 first_name 정렬
--입사일 기준 오름차순, 그 안에서 이름기준 내림차순

select first_name as 이름 , salary + salary * commission_pct as 급여 from employees order by 이름, 급여;

