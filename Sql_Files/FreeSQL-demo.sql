--1. simple procedures
create or replace PROCEDURe hello_world
is
begin 
    DBMS_OUTPUT.PUT_LINE('HELlo WOrld');
end;
/
call hello_world();


--2. procedure with imput parameter
create or replace PROCEDURE show_employee
(
    p_emp_name VARCHAR2
)
is 
begin 
    dbms_output.PUT_LINE('Employee Name: ' || p_emp_name);
end;
/
 
call show_employee('john');

--3. procedure with addition 
create or REPLACE PROCEDURE add_numbers
(
    a number,
    b number
)
is 
    c number;
begin
    c:= a+b;


    DBMS_OUTPUT.PUT_LINE('sum = ' || c);
end;
/
call add_numbers(5,7);

--4. procedure with out parameter

create or replace PROCEDURE get_square
(
    p_num in number,
    p_square out number
)
is 
begin 
    p_square := p_num * p_num;

end;
/
DECLARE
    result number;

begin 
    get_square(5, result);

    dbms_output.put_line('Square = ' || result);
end;
/

--5. empolyees salary update
create or replace update_salary
(
    p_empid number,
    p_increment number
)
is 
begin
    update empolyees
    set salary = salary + p_increment
    where employee_id = p_empid;

    commit;

    dbms_output.put_line('salary updated');
end;
/

--6. insert employees record
create or replace procedure insert_employee
(
    p_id number,
    p_name VARCHAR2
    p_salary number
)
is 
begin 
    insert into employees(employees_id , employees_name, salary)
    values(p_id,p_name,p_salary);


    commit;


    dbms_output.put_line('Record Inserted');
end;
/
call insert_employee(101,'raju',30000);

--7.delete empolyee
create or replace procedure delete_employee(
    p_empid number
)
is 
begin 
    delete from employees
    where employee_id = p_empid;


    commit;

    dbms_output.put_line('Employee Deleted');

end;
/
call delete_employee();

--8. find the maximum salary 
create or replace procedure max_salary
is 
    v_max number;
begin
    select max(salary)
    into v_max
    from employees;


    dbms_output.put_line('Maximum Salary = ' || v_max);
end;
/

call max_salary();

--9. procedure with Exception Handling
create or replace procedure divide_numbers
(
    a number,
    b number
)
is
    c number;
begin
    c := a/b;

    dbms_output.put_line('Result = ' || c);


exception 
    when zero_divide then
        dbms_output.put_line('Cannot divide by zero');
end;
/
call divide_numbers(8,0);

--10. Cursor procedure

create or replace procedure employees_details
is
    cursor emp_cursor is
        select emp_name, salary
        from employees;


    v_name employees.emp_name % type;
    v_salary employees.salary % type;

begin 
    open emp_cursor;

    loop
        fetch emp_cursor into v_name,v_salary;

        exit when emp_cursor % notfound;


        dbms_output.put_line(v_name || ' - '|| v_salary);
    end loop;

    close emp_cursor;
end;
/
call employee_details()