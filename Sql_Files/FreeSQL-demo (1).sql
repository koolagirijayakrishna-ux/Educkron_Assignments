--Eeception handling examples1.
DECLARE
    a number := 10;
    b number :=0;
    c number;

BEGIN
    c:=a/b;
    DBMS_OUTPUT.PUT_LINE(c);
exception
    when zero_divide THEN
    DBMS_OUTPUT.PUT_LINE('cannot divide by zero');


end;
/
-- exception handling example 2.
DECLARE
    a number := 10;
    b number :=4;
    c number;

BEGIN
    c:=a/b;
    DBMS_OUTPUT.PUT_LINE(c);
exception
    when zero_divide THEN
    DBMS_OUTPUT.PUT_LINE('cannot divide by zero');


end;
/
-- example 3
DECLARE
    a number := 10;
    b number := 0;
    c number;
    d number(2);

BEGIN
    c := a/b;
    
    d := 99999;

EXCEPTION
    when zero_divide  THEN
        DBMS_OUTPUT.PUT_LINE('Divide by zero error');

    when value_error then
        DBMS_OUTPUT.PUT_LINE('value size exceeded');

end;

--practice section is given below
DECLARE
    product_id number := 101;
    product_name VARCHAR2(20);

    availabel_stock number ;
BEGIN

end;
/