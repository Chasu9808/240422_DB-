set serveroutput on;
select * from employees;
select * from employees where employee_id = 200;
--employee_id = 200 �� ȸ����� id�� �̸� ���
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
----employee_id = 200 �� ȸ����� id�� �޿� ���
DECLARE
    vno      employees.employee_id%type;
    vsalary  employees.salary%type;

BEGIN
    select employee_id, salary into vno,vsalary
    from employees
    where employee_id=200;
    dbms_output.put_line('���̵�  ����');
    dbms_output.put_line(vno || ' ' || vsalary);
end;
/
------employee_id = 200 �� ȸ����� ��� ���� �����ؼ� ���̵�, �̸�, �Ի��� ���
select * from employees where employee_id=200;
DECLARE
 vemployee  employees%rowType;
BEGIN
     select *  into vemployee
     from employees 
     where employee_id=200;
     dbms_output.put_line('���̵�  �̸�  �Ի���');
     dbms_output.put_line(vemployee.employee_id || ' ' ||
                          vemployee.first_name||' ' ||vemployee.hire_date);
end;
/
----
/*
EMPLOYEES ���� DEPARTMENT_ID, FIRST_NAME,SALARY, PHONE_NUMBER,��Ÿ�� ����ϵ� 
�޿��� õ���� �и� ��ȣ ���
�޿��� 5000������ ��� ��Ÿ�� '���ӱ�', 5000~10000 '�����ӱ�',
10000 �ʰ� '���ӱ�'  
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
        if i.SALARY > 10000 then etc := '���ӱ�';
        ELSIF i.SALARY > 5000 then etc :='�����ӱ�';
        ELSIF i.SALARY <= 5000 then etc :='���ӱ�';
        end if;
    
        dbms_output.put_line(i.DEPARTMENT_ID ||' '||i.FIRST_NAME ||' '
        ||to_char(i.SALARY,'999,999') ||' '||i.PHONE_NUMBER||' '||etc);
  
    end loop;

end;
/

--case �� ���
DECLARE
    CURSOR etc_cursor is
    select DEPARTMENT_ID,FIRST_NAME,SALARY, PHONE_NUMBER
    from EMPLOYEES;
    
    etc VARCHAR2(20);
BEGIN
 dbms_output.put_line('--EMPLOYEES �ӱ�����(case���)---');
    for  i in etc_cursor   loop
        case
        when i.SALARY > 10000 then etc := '���ӱ�';
        when i.SALARY > 5000 then etc :='�����ӱ�';
        when i.SALARY <= 5000 then etc :='���ӱ�';
        end case;
    
        dbms_output.put_line(i.DEPARTMENT_ID ||' '||i.FIRST_NAME ||' '
        ||to_char(i.SALARY,'999,999') ||' '||i.PHONE_NUMBER||' '||etc);
  
    end loop;

end;
/
----
/*
���, ����, �μ��ڵ�, �μ���, ��Ÿ�� ����ϵ�,
�μ��ڵ尡 80�̸� '�츮�μ�', �ƴϸ� 'Ÿ�μ�'�� ��Ÿ �ڸ��� ���.
EMPLOYEES   DEPARTMENTS
*/
select e.employee_id, e.first_name, d.department_id, d.department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id;
-----------
DECLARE
    etc1 VARCHAR2(20);
    CURSOR c1 is 
      select e.employee_id ���, e.first_name �̸�, 
             d.department_id �μ��ڵ�, d.department_name �μ���
      from EMPLOYEES e, DEPARTMENTS d
      where e.department_id = d.department_id;
BEGIN
    for i in c1 loop
        if i.�μ��ڵ� = 80 then etc1:='�츮�μ�';
        ELSIF i.�μ��ڵ� <> 80 then etc1 :='Ÿ�μ�';
        --else etc1:='Ÿ�μ�';
        end if;
        dbms_output.put_line(i.���||' '||i.�̸�||' '||i.�μ��ڵ�||' '||i.�μ���||' '||etc1);
    end loop;
end;
/
-- join~on ���

DECLARE
    etc1 VARCHAR2(20);
    CURSOR c1 is 
      select e.employee_id ���, e.first_name �̸�, 
             d.department_id �μ��ڵ�, d.department_name �μ���
      from EMPLOYEES e join DEPARTMENTS d
      on e.department_id = d.department_id;
BEGIN
    dbms_output.put_line('-- join on  ���--');
    for i in c1 loop
        if i.�μ��ڵ� = 80 then etc1:='�츮�μ�';
        else etc1:='Ÿ�μ�';
        end if;
        dbms_output.put_line(i.���||' '||i.�̸�||' '||i.�μ��ڵ�||' '||i.�μ���||' '||etc1);
    end loop;
end;
/






