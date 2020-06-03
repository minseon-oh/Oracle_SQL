--inner join (딱 맞아떨어지는애만 붙인다. 맞지않으면 출력하지 않는다.)join 앞에 inner를 생략해도 무관하다.
select * from info INNER JOIN auth ON info.auth_id = auth.auth_id; --info와 auth를 합친다

--left outer join (왼쪽이 기준이 됨. 왼쪽 모두 출력하고 왼쪽에 맞는 데이터만 오른쪽에 붙인다.)
select * from info LEFT OUTER JOIN auth ON info.auth_id = auth.auth_id;

--right outer join(왼쪽 기능의 반대)
select * from info RIGHT OUTER JOIN auth ON info.auth_id = auth.auth_id;

--full outer join(양쪽 기준으로 모든 데이터를 붙임. 부족한 부분을 null값으로 채움)
select * from info FULL OUTER JOIN auth ON info.auth_id = auth.auth_id;

--cross join (왼쪽 1번에 오른쪽 모든 번호가 붙고 다음 왼쪽번에 또 오른쪽 모든 번호가 붙음.)
--하나의 행에 모든 결과가 붙는. 잘못 된 join
select * from info CROSS JOIN auth ON info.auth_id = auth.auth_id;