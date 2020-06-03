--����1
create table depts as select * from departments;
dese depts;
insert into depts values(280, '����', null, 1800);
insert into depts values(290, 'ȸ���', null, 1800);
insert into depts values(300, '����', 301, 1800);
insert into depts values(310, '�λ�', 302, 1800);
insert into depts values(320, '����', 303, 1700);
select * from depts;
commit;

--����2
select * from depts where department_name = 'IT Support';
update depts set department_name = 'IT_BANK' where department_name = 'IT Support';
select * from depts where department_name = 'IT_BANK';

select * from depts where department_id = 290;
update depts set manager_id = 301 where department_id = 290;

select * from depts where department_name = 'IT Helpdesk';
update depts set department_name = 'IT Help', manager_id = 303, location_id = 1800 where department_name = 'IT Helpdesk';
select * from depts where department_name = 'IT Help';

update depts set manager_id = 301 where department_id in (280, 300, 310, 320);
select * from depts;
commit;

--����3
select * from depts;
delete from depts where department_id = 320;

select * from depts where department_name = 'NOC';
delete from depts where department_id = 220;
commit;

--����4
delete from depts where department_id >= 200;
select * from depts;
update depts set manager_id = 100 where manager_id is not null;

MERGE INTO depts a --0Ÿ�����̺�
    USING (select * from departments) b
    ON (a.department_id = b.department_id)
WHEN MATCHED THEN
    UPDATE SET
    a.department_name = b.department_name,
    a.manager_id = b.manager_id,
    a.location_id = b.location_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.department_id, b.department_name, b.manager_id, b.location_id);

select * from depts;

--����5
select * from jobs;
create table jobs_it as (select * from jobs where min_salary >= 6000);
select * from jobs_it;

insert into jobs_it values('IT_DEV', '����Ƽ������', 6000, 20000);
insert into jobs_it values('NET_DEV', '��Ʈ��ũ������', 5000, 20000);
insert into jobs_it values('SEC_DEV', '���Ȱ�����', 6000, 19000);

MERGE INTO jobs_it a
    USING (select * from jobs where min_salary >= 0) b
    ON (a.job_id = b.job_id)
WHEN MATCHED THEN
    UPDATE SET
    a.min_salary = b.min_salary,
    a.max_salary = b.max_salary,
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);

