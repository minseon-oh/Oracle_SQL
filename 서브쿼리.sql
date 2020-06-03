--서브쿼리
--사용방법: ()안에 명시함. 서브쿼리절의 리턴행이 1줄 이하여야한다.
-- 서브쿼리절을 항상 먼저 해석한다.

select * from employees where first_name = 'Nancy'; -- 낸시
select * from employees
where salary >= (select salary from employees where first_name = 'Nancy'); -- 급여가 낸시이상인 사람.

select job_id from employees where employee_id = 103; --사원번호가 103번인 사람(알렉산더)
select * from employees
where job_id = (select job_id from employees where employee_id = 103); --잡아이디가 알렉산더와 같은 사람.

--서브쿼리의 리턴행이 여러개라면 일반적인 비교연산자로 처리할 수 없다
select job_id from employees where job_id = 'IT_PROG';

select * from employees
where job_id = (select job_id from employees where job_id = 'IT_PROG'); --오류
select * from employees
where job_id = (select job_id from employees where department_id = 90); --오류

----------------------------------------------------------------------------------------------------
--다중행 서브쿼리 (서브쿼리 결과행이 여러개 나올 때, in, any, all)
select * from employees
where job_id in (select job_id from employees where department_id = 90);

select salary from employees where first_name = 'David';
select * from employees
where salary >any (select salary from employees where first_name = 'David'); -- >any: 최소값보다 큰 경우

select * from employees
where salary >all (select salary from employees where first_name = 'David'); -- >all: 최대값보다 큰 경우

----------------------------------------------------------------------------------------------------
--스칼라 서브 쿼리
select * from employees;
select * from departments;

select first_name, department_name
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

select first_name, --스칼라
      (select department_name from departments d 
       where d.department_id = e.department_id)
from employees e;

----------------------------------
select * from employees;
select * from jobs;

select employee_id, e.job_id, job_title
from employees e
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id
order by employee_id;

select employee_id, e.job_id, --스칼라
       (select job_title from jobs j where j.job_id = e.job_id)as job_title
from employees e
order by employee_id;

----------------------------------------------------------------------------------------------------
--인라인 뷰(from구문에 서브쿼리가 오는 것)
select rownum, first_name, salary from employees order by salary; --rownum: 조회된 순서대로 번호를 붙이는 것

select * from
(select first_name, salary from employees order by salary);

select last_name from
(select first_name, salary from employees order by salary); --오류 -- 소괄호안에 라스트네임이 없는데 괄호밖에서 출력구문을 씀.

select rownum as rn,
       first_name,
       salary
from (select first_name, salary from employees order by salary)
where rownum > 0 and rownum <= 10;

select rownum, first_name, salary
from (select first_name, salary from employees order by salary)
where rownum > 10 and rownum <= 20; --오류--

----------------------------------------------------------------------------------------------------
--3중쿼리 (페이징쿼리)
select *
from(select rownum rn, 
            employee_id, 
            first_name, 
            last_name, 
            email
     from(select * 
          from employees 
          order by salary
          )
    )
where rn > 10 and rn <= 20;

----------------------------------
select *
from(
    select 
        rownum rn,
        employee_id,
        first_name,
        last_name,
        department_name
    from(
    select 
        employee_id,
        first_name,
        last_name,
        department_name
    from employees e
    JOIN departments d
    ON e.department_id = d.department_id
    order by employee_id
    )
)
where rn > 20 and rn <= 30;
----------------------------------
select*
from employees e
JOIN(select
        department_id,
        department_name
     from departments) d
ON d.department_id = e.department_id;


