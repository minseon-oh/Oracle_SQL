--Ʈ�����
--Ŀ��Ȯ��
show AUTOCOMMIT;
--����Ŀ�� ��
set AUTOCOMMIT ON;
--����Ŀ�� ����
set AUTOCOMMit OFF;

delete from depts;
select * from depts;
rollback; --���� Ŀ�� �������� ���ư�

delete from depts where department_id = 10;
--���̺�����Ʈ
SAVEPOINT delete_10;
delete from depts where department_id = 20;

rollback;
select * from depts;
rollback to SAVEPOINT delete_10;

--Ŀ�� ���Ŀ��� ��� ������ε� �ǵ��� �� ����
commit;