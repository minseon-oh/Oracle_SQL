--INNER JOIN
select * from info INNER JOIN auth ON info.auth_id = auth.auth_id;

--auth_id컬럼을 직접 기술하면 양쪽 테이블에 모두 존재하기때문에 모호하다는 오류가 뜬다.
--이럴 때 컬럼에 테이블이름.컬럼명을 지칭하여 정상적으로 조회할 수 있다.
select id, title, content, regdate, info.auth_id, name
from info INNER JOIN auth ON info.auth_id = auth.auth_id;

--일반적으로 TABLE엘리어스를 지징해서 사용가능하다.
select id, title, content, regdate, i.auth_id, name
from info i --info를 i로 지칭
INNER JOIN auth a --auth를 a로 지칭
ON i.auth_id = a.auth_id;

--조건절 where구문
select id, title, content, regdate, i.auth_id, name
from info i --info를 i로 지칭
INNER JOIN auth a --auth를 a로 지칭
ON i.auth_id = a.auth_id
where i.auth_id = 1;

--------------------------------------------------------------------------
--OUTER JOIN
select * from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select * from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select * from info i
FULL OUTER JOIN auth a
ON i.auth_id = a.auth_id;

--------------------------------------------------------------------------
--CROSS JOIN
select * from info i
CROSS JOIN auth a;

--------------------------------------------------------------------------
select * from employees;
select * from departments;
select * from locations;

select * from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations i
ON d.location_id = i.location_id
where d.department_name = 'Finance';
--------------------------------------------------------------------------
--테이블 auth, info테이블에서 job컬럼이 scientist인 사람의 id, title, content, job을 출력
select i.auth_id, title, content, job
from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id
where job = 'scientist';

--RIGHT OUTER JOIN 비교
select i.auth_id, title, content, job
from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id
where job = 'scientist';