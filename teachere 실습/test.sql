create table dbtest(
    num number(4) primary key,
    id varchar2(10),
    job varchar2(40) default '사원',
    regdate date default sysdate
);
insert into dbtest(num, id ) values(1, 'aa');

grant select on dbtest to scott;
grant insert on dbtest to scott;
select * from dbtest;
REVOKE select, insert on dbtest FROM scott;
--oracle 버전10  이후에는  connect 롤 ( create session  권한만 있음)





