--inner join (�� �¾ƶ������¾ָ� ���δ�. ���������� ������� �ʴ´�.)join �տ� inner�� �����ص� �����ϴ�.
select * from info INNER JOIN auth ON info.auth_id = auth.auth_id; --info�� auth�� ��ģ��

--left outer join (������ ������ ��. ���� ��� ����ϰ� ���ʿ� �´� �����͸� �����ʿ� ���δ�.)
select * from info LEFT OUTER JOIN auth ON info.auth_id = auth.auth_id;

--right outer join(���� ����� �ݴ�)
select * from info RIGHT OUTER JOIN auth ON info.auth_id = auth.auth_id;

--full outer join(���� �������� ��� �����͸� ����. ������ �κ��� null������ ä��)
select * from info FULL OUTER JOIN auth ON info.auth_id = auth.auth_id;

--cross join (���� 1���� ������ ��� ��ȣ�� �ٰ� ���� ���ʹ��� �� ������ ��� ��ȣ�� ����.)
--�ϳ��� �࿡ ��� ����� �ٴ�. �߸� �� join
select * from info CROSS JOIN auth ON info.auth_id = auth.auth_id;