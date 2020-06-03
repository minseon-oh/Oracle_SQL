--문제 1. -EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
--EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서 각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. 
--(달라지는 행의 개수 확인)

select e.department_id from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

select e.department_id from employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

select e.department_id from employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

----------------------------------------------------------------------------------------------------------
--문제 2. -EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
--조건)employee_id가 200인 사람의 이름, department_id를 출력하세요 
--조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다

select concat(first_name, last_name), e.department_id
from employees e INNER JOIN departments d 
ON e.department_id = d.department_id
where e.employee_id = 200;

----------------------------------------------------------------------------------------------------------
--문제 3. -EMPLOYEES, JOBS테이블을 INNER JOIN하세요
--조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬 
--HINT) 어떤 컬럼으로 서로 연결되 있는지 확인

select concat(first_name, last_name), e.job_id, j.job_title 
from employees e INNER JOIN jobs j
ON e.job_id = j.job_id order by e.first_name;

----------------------------------------------------------------------------------------------------------
--문제 4. --JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.

select * from jobs j
LEFT OUTER JOIN job_history h
ON j.job_id = h.job_id;

----------------------------------------------------------------------------------------------------------
--문제 5. --Steven King의 부서명을 출력하세요.

select concat(first_name, last_name), department_name
from employees e
JOIN departments d
ON e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

----------------------------------------------------------------------------------------------------------
--문제 6. --EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요

select * from employees
CROSS JOIN departments;

----------------------------------------------------------------------------------------------------------
--문제 7. --EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 
--SA_MAN 사원만의 사원번호, 이름, 급여, 부서명, 근무지를 출력하세요. (Alias를 사용)

select e.employee_id as 사원번호, 
        concat(first_name, last_name) as 이름, 
        salary as 급여, 
        department_name as 부서명, 
        street_address as 근무지
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
where e.job_id = 'SA_MAN';

----------------------------------------------------------------------------------------------------------
--문제 8. -- employees, jobs 테이블을 조인 지정하고 job_title이 
--'Stock Manager', 'Stock Clerk'인 직원 정보만 출력하세요.

select * from employees e
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id
where job_title = 'Stock Manager' or job_title = 'Stock Clerk';
--where job_title in('Stock Manager', 'Stock Clerk');

----------------------------------------------------------------------------------------------------------
--문제 9. -- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용

select d.department_name as 부서명, count(e.department_id) as 직원수 
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id 
group by department_name
having count(e.department_id) = 0;

--쌤풀이
select d.department_id, d.department_name, e.employee_id
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id 
where employee_id is null;

----------------------------------------------------------------------------------------------------------
--문제 10. -join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요 
--힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.

select concat(e.first_name, e.last_name) as 이름, concat(m.first_name, m.last_name) as 매니저이름
from employees e
INNER JOIN employees m
ON e.employee_id = m.manager_id;

----------------------------------------------------------------------------------------------------------
--문제 11. --6. EMPLOYEES 테이블에서 left join하여 관리자(매니저)와, 매니저의 이름, 매니저의 급여 까지 출력하세요 
--매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 출력하세요

select concat(e.first_name, e.last_name) as 이름, concat(m.first_name, m.last_name) as 매니저이름, m.salary as 매니저급여
from employees e
LEFT OUTER JOIN employees m
ON e.employee_id = m.manager_id
where concat(m.first_name, m.last_name) is not null order by m.salary desc;