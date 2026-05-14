--6. salary bonus check
DECLARE
    salary number := 50000;
BEGIN
    if salary > 40000 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus Applicable');
    end if;

end;

--7. Leap Year Check
DECLARE
    year NUMBER := 2024;
BEGIN
    if MOD(year,400)=0 or (MOD(year,4)=0 and MOD(year,100)! = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Leap year');
    else
        DBMS_OUTPUT.PUT_LINE('Not Leap Year');
    end if;

end;

--8. check null value 
DECLARE
    name varchar2(20);
BEGIN
    if name is null THEN
        DBMS_OUTPUT.PUT_LINE('Value');
    end if;

end;

-- 9. find Largest of three numbers
DECLARE
    a number:=10;
    b number:=40;
    c number:=30;
BEGIN
    if a>b and a>c then
        DBMS_OUTPUT.PUT_LINE('A Largest');
    elsif b>c THEN
        DBMS_OUTPUT.PUT_LINE('B Largest');
    else
        DBMS_OUTPUT.PUT_LINE('C Largest');
    end if;

end;