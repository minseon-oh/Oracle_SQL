--트랜잭션
--커밋확인
show AUTOCOMMIT;
--오토커밋 온
set AUTOCOMMIT ON;
--오토커밋 오프
set AUTOCOMMit OFF;

delete from depts;
select * from depts;
rollback; --최종 커밋 직전으로 돌아감

delete from depts where department_id = 10;
--세이브포인트
SAVEPOINT delete_10;
delete from depts where department_id = 20;

rollback;
select * from depts;
rollback to SAVEPOINT delete_10;

--커밋 이후에는 어떠한 방법으로도 되돌릴 수 없다
commit;