alter session set "_oracle_script"=true;
create user oraclestudy
IDENTIFIED by oracle;

--create session 권한 부여 : 데이터베이스 접근
grant create session to oraclestudy;

--1. ORCLSTUDY 계정 생성 비번  oracle
create user ORCLSTUDY  IDENTIFIED by oracle;

-- 2.  ORCLSTUDY 계정 create session 권한 부여
grant create session to ORCLSTUDY;

--3. ORCLSTUDY 계정 비번 변경 orcl
alter user ORCLSTUDY IDENTIFIED by orcl;
--4. ORCLSTUDY 삭제
drop user ORCLSTUDY;

-------------------
grant create table to ORCLSTUDY;
-- 롤
grant resource, connect  to ORCLSTUDY;


alter session set "_oracle_script"=true;
drop user oraclestudy CASCADE;
drop user orclstudy CASCADE;

-----
--1. test 계정 생성 비번  test
--2. test 계정 권한 부여 resource, connect ,unlimited tablespace 

create user test IDENTIFIED by test;
grant  resource, connect, unlimited tablespace  to test;

--p416 연습문제
-- 1. PREV_HW  계정생성 (비번  oracle) 접속 가능하도록 생성
create user PREV_HW IDENTIFIED by oracle;
grant  resource, connect, unlimited tablespace  to PREV_HW;








