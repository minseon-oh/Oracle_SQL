select * from member01;

create table board01(
    num number(10, 0) CONSTRAINT board01_pk PRIMARY KEY,
    id VARCHAR2(30) not null,
    title VARCHAR2(50),
    content VARCHAR2(200)
);
create SEQUENCE board01_seq;
select * from board01;
insert into board01 VALUES (board01_seq.nextval, 'test' || board01_seq.currval, 'test' || board01_seq.currval, 'test' || board01_seq.currval);
COMMIT;

update board01 set id = 'aaa123';
COMMIT;

select * from member01 m
JOIN(
        select *
        from(
            select rownum as rn,
                    num,
                    id,
                    title,
                    content
            from (select num, 
                        id, 
                        title, 
                        content
                        from board01
                        order by num desc)
        )
        where rn > 10 and rn <= 20;
        )b
ON m.id = b.id;        

select 
    m.id,
    m.pw,
    m.name,
    m.email,
    m.address,
    b.num,
    b.title,
    b.content
from member01 m
JOIN board01 b
ON m.id = b.id
where m.id = 'aaa123';











