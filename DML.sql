--isnert 데이터추가
desc departments;
select * from departments;
--첫번쨰 방법(모든 컬럼을 한번에 저장)
insert into departments values(280, 'developer', null, 1700);
rollback;
--두번째 방법(직접 컬럼을 지정하고 저장)
insert into departments(department_id, department_name, location_id ) values(280, '개발자', 1700);
insert into departments(department_id, department_name, location_id ) values(290, '디자이너', 1800);
insert into departments(department_id, department_name, location_id ) values(300, 'DB관리자', 1900);
insert into departments values (310, '데이터분석가', 200, 1800);
insert into departments values (320, '서버관리자', 200, 1800);
rollback;

--세번째 방법(서브쿼리 절)
create table managers as (select * from employees where 1 = 2); --사본테이블
insert into managers (select * from employees where job_id = 'IT_PROG' );
insert into managers (employee_id, first_name, last_name, job_id, salary, hire_date, email) 
(select employee_id, first_name, last_name, job_id, salary, hire_date, email from employees);
select * from managers;
rollback;

---update (데이터 수정)
create table emps as (select * from employees where 1 = 1);
update emps set salary = 30000; --이렇게 하면? 큰일나요
rollback;

select * from emps;
update emps set salary = 30000 where employee_id = 100;
update emps set salary = salary + salary * 0.2 where employee_id = 100; --set구문 뒤에 연산결과도 들어갑니다
update emps set phone_number = '515.124.4566', hire_date = sysdate, manager_id = 102 where employee_id = 100;
--update서브쿼리
update emps set(job_id, salary, manager_id) = (select job_id, salary, manager_id from employees where employee_id = 100)
where employee_id = 101;
rollback;

--delete(데이터 삭제)
select * from emps where employee_id = 103;
delete from emps where employee_id= 103;
--delete서브쿼리
delete from emps where employee_id in (select employee_id from employees where department_id = 100);
delete from emps where department_id = (select department_id from departments where department_name = 'Shipping');
rollback;

--merge문 (병합)
select * from emps;
delete from emps where employee_id <> 103;
update emps set first_name = '길동', last_name = '홍', hire_date = sysdate where employee_id = 103;


MERGE INTO emps a --타겟테이블
    USING (select * from employees where job_id = ★여기★ ) b
    ON (a.employee_id = b.employee_id )
WHEN MATCHED THEN --ON조건에 일치하는 경우
    UPDATE SET
    a.first_name = b.first_name,
    a.last_name = b.last_name,
    a.hire_date = b.hire_date,
    a.salary = b.salary,
    a.commission_pct = b.commission_pct,
    a.manager_id = b.manager_id,
    a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name, b.email, 
    b.phone_number, b.hire_date, b.job_id, b.salary, b.commission_pct,
    b.manager_id, b.department_id);


select * from job_history;
