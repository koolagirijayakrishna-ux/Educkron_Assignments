-- -- sql pl/sql - 20 functions and 20 procedures
-- --1. addition funtion


-- create or REPLACE function fn_add(a number, b number)
-- return NUMBER
-- is 
-- BEGIN
--     return a+b;
    
-- end;
-- /
-- select fn_add(4,5);

-- --2. subtraction funtion
-- create or replace function fn_sub(a number, b number)
-- return number
-- is 
-- BEGIN
--     return a-b;
-- end;
-- /
-- select fn_sub(5,8)

-- --3. multiplication function
-- create or replace function fn_mul(a number, b number)
-- return number
-- is 
-- BEGIN
--     return a*b;
-- end;
-- /
-- select fn_mul(5,5)

-- --4. division function 
-- create or replace function fn_div(a number, b number)
-- return number
-- is 
-- begin 
--     return a/b;
-- END;
-- /
-- select fn_div(10,5) 
-- --5. square functions 
-- create or replace function fn_squre(a number)
-- return NUMBER
-- is 
-- begin
--     return a*a;
-- end;
-- /
-- select fn_squre(3)

-- --6.cube function 
-- create or replace function fn_cube(a number)
-- return NUMBER
-- is 
-- BEGIN
--     return a*a*a;
-- end;
-- /
-- select fn_cube(3)
--7. even or odd function
-- create or replace function  fn_even_odd( a number)
-- return varchar2
-- is 
-- BEGIN
--     if mod(a,2)= 0 then
--         return 'even';
--     else
--         return 'odd';
--     end if;
-- end;
-- /
-- select fn_even_odd(5)

-- -- 8. maximum number function 
-- create or replace function fn_max(a number, b number)
-- return NUMBER
-- is 
-- BEGIN
--     if a>b then
--         return a;
--     else
--         return b;
--     end if;
-- end;
-- /
-- select fn_max(8,10)

-- --9. minimum number function 
-- create or replace function fn_min(a number, b number)
-- return NUMBER
-- is 
-- BEGIN
--     if a < b then
--         return a;
--     else
--         return b;
--     end if;
-- end;
-- /
-- select fn_min(8,9)
-- --10. factorial fuction 
-- create or replace function fn_fact(n number)
-- return NUMBER
-- is
--     fact number :=1;
-- BEGIN
--     for i in 1..n loop
--         fact := fact * i;
--     end loop;
--     return fact;
-- end;
-- /
-- select fn_fact(5)

-- -- 11. string lenth function
-- create or replace function fn_strlen( txt varchar2)
-- return number
-- is 
-- BEGIN
--     return length(txt);
-- end;
-- /
-- select fn_strlen('skjdfj')

-- --12 upper case function 
-- create or replace function fn_upper(txt varchar2)
-- return varchar2
-- is 
-- begin
--     return upper(txt);
-- end;
-- /
-- select fn_upper('gjejoije')
--13. lower case function 
-- create or replace function fn_lower(txt varchar2)
-- return varchar2
-- is 
-- begin 
--     return lower(txt);
-- end;
/
--select fn_lower('AJDKJH')
--14. reverse string functions
-- create or replace function fn_reverse(txt varchar2)
-- return varchar2
-- is 
-- begin 
--     return reverse(txt);
-- end;
-- /
--  select fn_reverse('keiuitiu')

-- --15. current date function 
-- create or replace function fn_current_date
-- return date
-- is 
-- begin 
--     return sysdate;
-- end;
-- /
--  select fn_current_date()

-- --16. age calculation function
-- create or replace function fn_age(dob date)
-- return number
-- is 
-- BEGIN
--     return trunc(months_between(sysdate,dob )/12);
-- end;
-- /
-- select fn_age(to_date('20/03/2004','dd/mm/yyyy'))from dual;

-- --17. simple intrest function 
-- create or replace function fn_simple( p number,r number, t number)
-- return NUMBER
-- is 
-- BEGIN
--     return (p*t*r)/100;
-- end;
-- /
-- select fn_simple(5000,2,5)from dual;

--18. circle  are function 
-- create or replace function fn_circle(radius number )
-- return NUMBER
-- is
-- begin 
--     return 3.141 * radius *radius;
-- end;
-- /
-- select fn_circle(4) from dual;
-- 19. palindrome function 
create or replace function fn_palin( txt varchar2)
return varchar2
is 
begin
    if txt = reverse(txt) then
        return 'palindrome';
    else
        return 'not a palindrome';
    end if;
end;
/
select fn_palin('madam')from dual

CREATE OR REPLACE FUNCTION fn_palin(txt VARCHAR2)
RETURN VARCHAR2
IS
    rev_txt VARCHAR2(100) := '';
BEGIN
    FOR i IN REVERSE 1 .. LENGTH(txt)
    LOOP
        rev_txt := rev_txt || SUBSTR(txt, i, 1);
    END LOOP;

    IF txt = rev_txt THEN
        RETURN 'palindrome';
    ELSE
        RETURN 'not a palindrome';
    END IF;
END;
/
select fn_palin('madam')

-- 20. salary hike function
create or replace function fn_salary (salary number, percent number)
return number
is 
BEGIN
    return salary + (salary * percent/100);
end;
/
SELECT fn_salary(50000, 10) AS new_salary
FROM dual;

==========================================================
-- proceducres 

==========================================================

--1. hello world procedere
create or replace procedure pr_hello
is
begin 
    dbms_output.put_line('hello ');
end;
/
call pr_hello();

select salary from employees where emp_id = 101;


create or replace procedure update_salary(
    id number
)
is
begin 
    update employees 
    set salary = salary + 10000
    where emp_id = id;
end;
/
call update_salary();

--2. print number
create or replace procedure pr_number(n number)
is
BEGIN
    dbms_output.put_line('number: ' || n);
end;
/
call pr_number

--3. addition procedure
create or replace procedure pr_add(a number , b number)
IS
    c number;
begin
    c := a+b;
    dbms_output.put_line('sum: '|| c);
end;
/
call pr_add(10, 20);

--4. subtraction procedure
create or replace procedure pr_subtract ( a number, b number)
is 
begin 
    dbms_output.put_line('subtraction: ' || (a-b));
end;
/
call pr_subtract(30,10);

--5. mutltiplication procedure
create or replace procedure pr_multiplay(a number , b number)
is 
BEGIN
    dbms_output.put_line('multiplication : ' || (a*b));
end;
/
call pr_multiplay(5,6)

--6. divition procedure
create or replace procedure pr_div( a number , b number)
is 
BEGIN
    dbms_output.put_line(' divition: ' || (a/b));
end;
/
call pr_div(20,2)

--7. employee inset procedure
create or replace procedure pr_insert(
    p_id number,
    p_name varchar2,
    p_salary number

)
is 
begin 
    insert into employees(emp_id, emp_name,salary)
    values(p_id, p_name, p_salary);

    commit;
end;
/

--8. employee update employees( emp_id, emp_name, salary)
create or replace procedure pr_update(
    p_id number,
    p_salary number
)
IS
BEGIN
    update employee
    set salary = p_salary
    where emp_id = p_id;


    commit;
end;
/

--9. empoyee delete procedure
create or replace procedure pr_delere(p_id number)
is 
begin
    delete from employees
    where emp_id = p_id;


    commit;
end;
/

--10. print curent date
create or replace procedure pr_current
is
BEGIN
    dbms_output.put_line(sysdate);
end;
/
call pr_current()

--11. even or odd numbers
create or replace procedure pr_even(n number)
is
BEGIN
    if mod(n,2)=0 then
        dbms_output.put_line('even');
    ELSE
        dbms_output.put_line('odd');
    end if;
end;
/
call pr_number(2)

-- 12. factorial procedure
create or replace procedure pr_fact(n number)
is 
    fact number := 1;
BEGIN
    for i in 1..n loop
        fact := fact* i;
    end loop;


    dbms_output.put_line('factorial: '|| fact);
end;
/
--13. looo numbers procedure
create or replace procedure pr_loops
is 
begin
    for i 1..10 LOOP
        dbms_output.put_line(i);
    end loop;
end;
/


--14. prin temployees count
create or replace procedure pr_employee 
is 
     total number;
BEGIN
    select count(*) into total
    from empoyee;


    dbms_output.put_line('total employees :' || total);
end;
/

--15. print temployee salary
create or replace procedure pr_employees(p_id number)
IS
    sal number;
BEGIN
    select selary into salary
    from employee
    where emp_id = p_id;

    dbms_output.put_line('salary:'|| sal);

end;
/

--16. string reverse procedure
create or replace procedure pr_reverse( txt varchar2)
is 
BEGIN
    dbms_output.put_line(reverse(txt));
end;
/

--17.uppersase procedure
create or replace procedure pr_upper(txt varchar2)
is
BEGIN
    dbms_output.put_line(upper(txt));
end;
/

--18.lower case procedure
create or replace procedure pr_lower(txt varchar2)
is
begin
    dbms_output.put_line(lowera(txt));
end;
/

--19. bonus calculation procedure
create or replace procedure pr_bonus(
    salary number,
    bonus_percent number
)
is 
    bonus number;
BEGIN
    bonus := salary * bonus_percent/100;


    dbms_output.put_line('bonus: ' || bonus);
end;
/
--20. swap two nubers procedure
create or replace procedure pr_swap(
    a in out number,
    b in put number
)
is
    temp number;
begin
    temp := a;
    a := b;
    b := temp;
end;
/