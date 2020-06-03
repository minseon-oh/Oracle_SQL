-- 그룹함수 AVG, MAX, MIN, SUM, COUNT
select avg(salary), max(salary), min(salary), sum(salary), count(*) from employees;

select count(*), employee_id from employees; --오류--그룹함수는 일반 컬럼과 사용할 수 없다.
select department_id, avg(salary) from employees; --오류--

select count(*) from employees; --총 행 데이터의 수(null포함)
select count(first_name) from employees; --null을 제외한 행의 수
select count(commission_pct) from employees; 
select count(manager_id) from employees;

select department_id, avg(salary) from employees group by department_id; --부서별로 그룹화, 그룹함수의 사용

select department_id, avg(salary) from employees; --오류--그룹함수는 일반 컬럼과 사용할 수 없다.
-- group by절을 사용할 때 그룹절에 묶이지 않으면 다른 컬럼을 조회할 수 없다.
select job_id, department_id from employees group by department_id;

--group by절 2개이상사용
select department_id from employees group by department_id;
select department_id, job_id from employees group by department_id, job_id order by department_id;

--count(*) over() 구문에서 예외적으로 컬럼에 총 행의 수를 붙여서 확인이 가능하나 굳이 쓰지는 않는다.
select department_id, first_name, last_name, count(*) over() from employees;

--group by절의 조건 having절
select department_id, sum(salary)
from employees group by department_id
having sum(salary) > 100000;

select job_id, count(*)
from employees
group by job_id
having count(*) >= 20;

--부서 아이디가 50이상인 것들을 그룹화 시키고, 그룹평균 중 5000이상만 조회
select department_id, avg(salary)as 평균
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000;

-----------------------------------------------------------------
--문제 1. 사원 테이블에서 JOB_ID별 사원 수를 구하세요. 사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 
--월급의 평균 순으로 내림차순 정렬하세요
select * from employees;
select job_id, count(job_id) as 사원수 from employees group by job_id;
select job_id, avg(salary) as 급여평균 from employees group by job_id order by job_id;


--문제 2. 사원 테이블에서 입사 년도 별 사원 수를 구하세요.
select substr(hire_date, 1, 2) as 입사년도, count(substr(hire_date, 1, 2))as 사원수 
from employees group by substr(hire_date, 1, 2) order by substr(hire_date, 1, 2);
--쌤풀이
select to_char(hire_date, 'YY') as 입사년도, count(*) as 사원수 
from employees group by to_char(hire_date, 'YY');


--문제 3. 급여가 3000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 5000이상인 부서만 출력
select department_id, trunc(avg(salary)) from employees 
where salary >= 1000
group by department_id having avg(salary) >= 2000;

--문제 4. 사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의 
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다. 
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
select department_id,
trunc(avg(salary + salary * commission_pct), 2) as 평균,
sum(salary) as 합계,
count(*) as 사원수
from employees 
where commission_pct is not null
group by department_id;












