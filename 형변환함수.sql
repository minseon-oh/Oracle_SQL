--형변환 함수 to_char, to_date, to_number

--날짜 -> 문자
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD HH:MI:SS') from dual; --Y:년 M:월 D:일 HH:시 MI:분 SS:초
select to_char(sysdate, 'YY-MM-DD PM HH:MI:SS') from dual;

select to_char(hire_date, 'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YY"년"-MM"월"-DD"일"') from employees; --날짜포맷형식을 써야하는 란에 특정문자를 쓸 때는 ""로 묶는다.

--숫자 -> 문자
select to_char(20000, '999999')from dual;
select to_char(20000, '9999')from dual; --자리수 부족
select to_char(20000.21, '99999') from dual;
select to_char(20000.21, '99999.99') from dual; -- .은 소수점을 나타낸다.
select to_char(20000, '999,99') from dual; -- ,의 표현형식

select salary from employees;
select to_char(salary, '$999,999') as salary from employees;

--문자 -> 숫자 to_number
select '2000' + 2000 from dual; --자동 형변환
select to_number('2000') + 2000 from dual; --명시적 형변환

select '$3,300' + 2000 from dual; --오류
select to_number('$3,300', '$9,999') + 2000 from dual; --숫자 int를 사용하여 명시적 형변환

--문자 -> 날짜 to_date
select to_date('2020/01/31') from dual; --날짜형식만 가지고있으면 자동으로 날짜출력
select to_date('2020/01-31') + 7 from dual;
select to_date('2020-02-03', 'YY/MM/DD') from dual;
select to_date('2020-03-03 12:23:03', 'YY/MM/DD HH:MI:SS') from dual; --날짜 fmt를  사용하여 명시적 형변환

--null제거 NVL, NVL2
--NVL(컬럼, null일경우 변환할값)
select null from dual;
select NVL(null, 0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, NVL(commission_pct, 0) as commission_pct from employees;

--NVL2(컬럼, null이 아닐경우, null일경우)★
select NVL2(null, 'null이아닙니다', 'null입니다') from dual;
select first_name, NVL2(commission_pct, 'true', 'false') from employees;
select first_name, NVL2(commission_pct, salary + salary * commission_pct, salary) as 급여 from employees;

--DECODE ★ (else if문)
select DECODE('C', 'A', 'A입니다',
                   'B', 'B입니다',
                   'C', 'C입니다',
                        '전부아닙니다'
             ) as result from dual;

select * from employees;             
select first_name, job_id, salary, 
       DECODE(job_id, 'IT_PROG', salary * 1.1,
                      'FI_MGR', salary * 1.2,
                      'FI_ACCOUNT', salary * 1.3,
                      'AD_VP', salary * 1.4,
                               salary
             ) as result from employees;

--case when then end
select first_name, job_id, salary,
      (case job_id when 'IT_PROG' then salary * 1.1
                   when 'FI_MGR' then salary * 1.2
                   when 'FI_ACCOUNT' then salary * 1.3
                   when 'AD_VP' then salary * 1.4
                   else salary
       END) as result
from employees;

-------------------------------------------------------------------------
--03_함수.pdf의 p.44
--문제 1. 현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 
--근속년수가 10년 이상인 사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요.  
--조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
select * from employees; 
select employee_id as 사원번호, concat(first_name || ' ',last_name) as 사원명, hire_date as 입사일자,
       trunc((sysdate - hire_date) / 365) as 근속년수 from employees
       where trunc((sysdate - hire_date) / 365) >= 10 order by 근속년수 desc;


--문제 2. EMPLOYEE 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다. 
--100이라면 ‘사원’, 120이라면 ‘주임’ 121이라면 ‘대리’ 122라면 ‘과장’ 나머지는 ‘임원’ 으로 출력합니다.
--조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
select first_name, manager_id, department_id,
       DECODE(manager_id, 100, '사원',
                          120, '주임',
                          121, '대리',
                          122, '과장',
                               '임원'
              ) as result from employees where department_id = 50;






