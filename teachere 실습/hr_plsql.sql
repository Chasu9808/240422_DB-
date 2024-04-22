set serveroutput on;
select * from employees;
select * from employees where employee_id = 200;
--employee_id = 200 인 회사원의 id와 이름 출력
select employee_id, first_name from employees where employee_id = 200;

DECLARE
 vid number(4);
 vname VARCHAR2(10);
BEGIN
    select employee_id, first_name into  vid,vname
    from employees
    where employee_id=200;
    dbms_output.put_line(vid || ' ' || vname);
end;
/
----employee_id = 200 인 회사원의 id와 급여 출력
DECLARE
    vno      employees.employee_id%type;
    vsalary  employees.salary%type;

BEGIN
    select employee_id, salary into vno,vsalary
    from employees
    where employee_id=200;
    dbms_output.put_line('아이디  월급');
    dbms_output.put_line(vno || ' ' || vsalary);
end;
/
------employee_id = 200 인 회사원의 모든 정보 추출해서 아이디, 이름, 입사일 출력
select * from employees where employee_id=200;
DECLARE
 vemployee  employees%rowType;
BEGIN
     select *  into vemployee
     from employees 
     where employee_id=200;
     dbms_output.put_line('아이디  이름  입사일');
     dbms_output.put_line(vemployee.employee_id || ' ' ||
                          vemployee.first_name||' ' ||vemployee.hire_date);
end;
/
----
/*
EMPLOYEES 에서 DEPARTMENT_ID, FIRST_NAME,SALARY, PHONE_NUMBER,기타를 출력하되 
급여는 천단위 분리 기호 사용
급여가 5000이하인 경우 기타에 '저임금', 5000~10000 '보통임금',
10000 초과 '고임금'  
*/
select * from EMPLOYEES;
select DEPARTMENT_ID,FIRST_NAME,SALARY, PHONE_NUMBER from EMPLOYEES;

DECLARE
    CURSOR etc_cursor is
    select DEPARTMENT_ID,FIRST_NAME,SALARY, PHONE_NUMBER
    from EMPLOYEES;
    
    etc VARCHAR2(20);
BEGIN
    for  i in etc_cursor   loop
        if i.SALARY > 10000 then etc := '고임금';
        ELSIF i.SALARY > 5000 then etc :='보통임금';
        ELSIF i.SALARY <= 5000 then etc :='저임금';
        end if;
    
        dbms_output.put_line(i.DEPARTMENT_ID ||' '||i.FIRST_NAME ||' '
        ||to_char(i.SALARY,'999,999') ||' '||i.PHONE_NUMBER||' '||etc);
  
    end loop;

end;
/

--case 문 사용
DECLARE
    CURSOR etc_cursor is
    select DEPARTMENT_ID,FIRST_NAME,SALARY, PHONE_NUMBER
    from EMPLOYEES;
    
    etc VARCHAR2(20);
BEGIN
 dbms_output.put_line('--EMPLOYEES 임금정보(case사용)---');
    for  i in etc_cursor   loop
        case
        when i.SALARY > 10000 then etc := '고임금';
        when i.SALARY > 5000 then etc :='보통임금';
        when i.SALARY <= 5000 then etc :='저임금';
        end case;
    
        dbms_output.put_line(i.DEPARTMENT_ID ||' '||i.FIRST_NAME ||' '
        ||to_char(i.SALARY,'999,999') ||' '||i.PHONE_NUMBER||' '||etc);
  
    end loop;

end;
/
----
/*
사번, 성명, 부서코드, 부서명, 기타를 출력하되,
부서코드가 80이면 '우리부서', 아니면 '타부서'를 기타 자리에 출력.
EMPLOYEES   DEPARTMENTS
*/
select e.employee_id, e.first_name, d.department_id, d.department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id;
-----------
DECLARE
    etc1 VARCHAR2(20);
    CURSOR c1 is 
      select e.employee_id 사번, e.first_name 이름, 
             d.department_id 부서코드, d.department_name 부서명
      from EMPLOYEES e, DEPARTMENTS d
      where e.department_id = d.department_id;
BEGIN
    for i in c1 loop
        if i.부서코드 = 80 then etc1:='우리부서';
        ELSIF i.부서코드 <> 80 then etc1 :='타부서';
        --else etc1:='타부서';
        end if;
        dbms_output.put_line(i.사번||' '||i.이름||' '||i.부서코드||' '||i.부서명||' '||etc1);
    end loop;
end;
/
-- join~on 사용

DECLARE
    etc1 VARCHAR2(20);
    CURSOR c1 is 
      select e.employee_id 사번, e.first_name 이름, 
             d.department_id 부서코드, d.department_name 부서명
      from EMPLOYEES e join DEPARTMENTS d
      on e.department_id = d.department_id;
BEGIN
    dbms_output.put_line('-- join on  사용--');
    for i in c1 loop
        if i.부서코드 = 80 then etc1:='우리부서';
        else etc1:='타부서';
        end if;
        dbms_output.put_line(i.사번||' '||i.이름||' '||i.부서코드||' '||i.부서명||' '||etc1);
    end loop;
end;
/






