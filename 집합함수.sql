--union(합집합 중복X), union all (합집합 중복O), intersect(교집합), minus(차집합)
select EMPLOYEE_id, first_name from employees where hire_date like '04%' --04년도 입사자
union
select EMPLOYEE_id, first_name from employees where department_id = 20;
union
select EMPLOYEE_id, first_name from employees where job_id = 'IT_PROG';

--주의: 컬럼개수를 정확히 일치시켜야함.
select employee_id, first_name, last_name from employees where salary >= 5000
union all
select employee_id, first_name, last_name from employees where department_id = 20
union all
select 300,'홍','길동' from dual
union all
select 400,'홍','길자' from dual;
