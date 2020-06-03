select * from employees;

select * 
from employees e
LEFT OUTER JOIN (select 
                    department_id, 
                    count(*) as count
                from employees 
                group by department_id) e1
ON e.department_id = e1.department_id;  

--문제 1. -EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 데이터를 출력 하세요 ( AVG(컬럼) 사용) 
--EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 수를 출력하세요 
--EMPLOYEES 테이블에서 job_id가 IT_PFOG인 사원들의 평균급여보다 높은 사원들을 데이터를 출력하세요
select avg(salary) from employees;

select *
from employees
where salary > (select avg(salary) from employees);

select count(*) as 사원수
from employees
where salary > (select avg(salary) from employees);

select *
from employees
where salary > (select avg(salary) from employees);

--쌤
--문제1
select *
from employees 
where salary > (select avg(salary) from employees);

select count(*)
from employees
where salary > (select avg(salary) from employees);

select *
from employees
where salary > (select avg(salary) from employees where job_id = 'IT_PROG');

--문제2
select * 
from employees
where department_id = (select department_id from departments where manager_id = 100);

--문제3
select *
from employees
where manager_id > (select manager_id from employees where first_name = 'Pat');

select *
from employees
where manager_id in (select manager_id from employees where first_name = 'James');

--문제4
select rn,
       first_name
from(select rownum as rn,
            first_name
    from (
        select
            *
        from employees
        order by first_name asc)
    )
where rn > 40 and rn <= 50;

--문제5
select *
from (select rownum as rn,
             employee_id,
             concat(first_name, last_name) as name,
             phone_number,
             hire_date
      from (select * 
            from employees
            order by hire_date asc)
      )
where rn > 30 and rn <= 40;
  
--문제6
select employee_id, 
       concat(first_name, last_name) as name,
       e.department_id,
       d.department_name
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
order by employee_id asc;
--문제7
select employee_id,
       concat(first_name, last_name) as name,
       e.department_id,
       (select department_name from departments d where d.department_id = e.department_id)
from employees e
order by employee_id asc;

--문제8
select 
    department_id,
    department_name,
    manager_id,
    l.location_id,
    street_address,
    postal_code,
    city
from departments d
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id;
--문제 9
select 
    department_id,
    department_name,
    manager_id,
    location_id,
    (select street_address from locations l where d.location_id = l.location_id) as street_address,
    (select postal_code from locations l where d.location_id = l.location_id) as postal_code,
    (select city  from locations l where d.location_id = l.location_id) as city
from departments d;

--문제 10
select
    location_id,
    street_address,
    city,
    s.country_id,
    country_name
from locations s
LEFT OUTER JOIN countries c
ON s.country_id = c.country_id
order by country_name;

--문제 11    
select
    location_id,
    street_address,
    city,
    country_id,
    (select country_name from countries c where s.country_id = c.country_id) as country_name
from locations s
order by country_name;

--문제 12
select *
from(select 
        rownum rn,
        employee_id,
        first_name,
        hire_date,
        phone_number,
        department_id,
        department_name
    from(select 
            employee_id,
            first_name,
            hire_date,
            phone_number,
            e.department_id,
            department_name
        from employees e
        LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id
        order by hire_date)
    )
where rn > 100 and rn <= 110;    

--문제13
select 
    A.last_name,
    A.job_id,
    D.department_id,
    D.department_name
from (select department_id,
            last_name,
            job_id
      from employees
      where job_id = 'SA_MAN') A
LEFT OUTER JOIN departments D
ON A.department_id = D.department_id;

--문제14
select 
    d.department_id,
    department_name,
    manager_id,
    location_id,
    total
from departments d
JOIN (select department_id,
             count(*) as total
      from employees
      group by department_id) A
ON d.department_id = a.department_id
order by total desc;

--문제15
--부서별 연봉 평균
select department_id,
       trunc(avg(salary)) as avg
from employees
group by department_id;

--부서의 대한 정보전부, 주소 우편번호
select 
    department_id,
    department_name,
    manager_id,
    l.location_id,
    l.street_address,
    l.postal_code
from departments d
JOIN locations l
ON d.location_id = l.location_id;
--결과

select 
    d.department_id,
    d.department_name,
    d.manager_id,
    l.location_id,
    l.street_address,
    l.postal_code,
    NVL(avg, 0) as avg
from departments d
JOIN locations l
ON d.location_id = l.location_id
LEFT OUTER JOIN (select department_id,
                        trunc(avg(salary)) as avg
                 from employees
                 group by department_id) a
ON d.department_id = a.department_id;                  

--문제16
select *
from (select 
    rownum rn,
    department_id,
    department_name,
    manager_id,
    location_id,
    street_address,
    postal_code,
    avg
from(select 
        d.department_id,
        d.department_name,
        d.manager_id,
        l.location_id,
        l.street_address,
        l.postal_code,
        NVL(avg, 0) as avg
    from departments d
    JOIN locations l
    ON d.location_id = l.location_id
    LEFT OUTER JOIN (select department_id,
                            trunc(avg(salary)) as avg
                     from employees
                     group by department_id) a
    ON d.department_id = a.department_id
    order by department_id)
    )
where rn > 10 and rn <= 20;


