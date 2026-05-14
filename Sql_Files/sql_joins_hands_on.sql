-- -- Table 1: Departments
-- CREATE TABLE departments (
--     dept_id      NUMBER PRIMARY KEY,
--     dept_name    VARCHAR2(50) NOT NULL,
--     location     VARCHAR2(50)
-- );

-- -- Table 2: Employees 
-- CREATE TABLE employees (
--     emp_id        NUMBER PRIMARY KEY,
--     emp_name      VARCHAR2(50) NOT NULL,
--     dept_id       NUMBER,
--     manager_id    NUMBER,
--     salary        NUMBER(10,2),
--     hire_date     DATE,
--     CONSTRAINT fk_emp_dept
--         FOREIGN KEY (dept_id)
--         REFERENCES departments(dept_id)
-- );


-- -- Departments 
-- INSERT INTO departments VALUES (10, 'Sales',      'Mumbai');
-- INSERT INTO departments VALUES (20, 'Engineering','Bengaluru');
-- INSERT INTO departments VALUES (30, 'HR',         'Delhi');
-- INSERT INTO departments VALUES (40, 'Finance',    'Pune');
-- INSERT INTO departments VALUES (50, 'Legal',      'Chennai');

-- -- Employees
-- -- One-to-many mapping example:
-- -- dept 20 has multiple employees
-- INSERT INTO employees VALUES (101, 'Asha',   10, 900, 60000, DATE '2022-01-10');
-- INSERT INTO employees VALUES (102, 'Bharat', 20, 901, 80000, DATE '2021-03-15');
-- INSERT INTO employees VALUES (103, 'Charu',  20, 901, 75000, DATE '2023-07-01');
-- INSERT INTO employees VALUES (104, 'Deep',   20, NULL, NULL, DATE '2024-02-20');
-- INSERT INTO employees VALUES (105, 'Esha',   30, 902, 50000, DATE '2020-11-05');
-- INSERT INTO employees VALUES (106, 'Farhan', NULL, 903, 45000, DATE '2024-01-12'); -- NULL dept
-- INSERT INTO employees VALUES (107, 'Gauri',  40, 904, 90000, DATE '2019-08-25');
-- INSERT INTO employees VALUES (108, 'Hari',   NULL, NULL, NULL, DATE '2025-01-01'); -- NULL dept + NULL salary

-- COMMIT;


-- -- 1 basic innner join
-- select e.emp_id, e.emp_name, d.dept_name
-- from employees e
-- inner join departments d
--     on e.dept_id = d.dept_id;

-- -- 2 left jojn outer join 
-- select e.emp_id, e.emp_name, d.dept_name
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- order by e.emp_id;

-- --3 right outer join 
-- select d.dept_id, d.dept_name, e.emp_name
-- from employees e
-- right join departments d
--     on e.dept_id = d.dept_id
-- order by d.dept_id, e.emp_name;

-- --4 full joijn
-- select e.emp_name, d.dept_name
-- from employees e
-- full outer join departments d
--     on e.dept_id = d.dept_id
-- order by d.dept_name, e.emp_name;

-- --5 employees with no matching department
-- select e.emp_id, e.emp_name, e.dept_id
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- where d.dept_id is null;

-- --6 Departments with no employees
-- select d.dept_id, d.dept_name
-- from departments d
-- left join employees e
--     on d.dept_id = e.dept_id
-- where e.emp_id is null;

-- -- 7 inner join with filter on location 
-- select e.emp_name, d.dept_name, d.location
-- from employees e
-- join departments d
--     on e.dept_id = d.dept_id
-- where d.location = 'Bengaluru';

-- -- 8 count employees per department
-- select d.dept_id,
--        d.dept_name,
--        count(e.emp_id) AS employee_count
-- from departments d
-- left join employees e
--     on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- order by d.dept_id;

-- -- 9 Average slary per department
-- select d.dept_name,
--        round(AVG(e.salary), 2) AS avg_salary
-- from departments d
-- left join employees e
--     on d.dept_id = e.dept_id
-- group by d.dept_name
-- order by d.dept_name;

-- --10 show no 'Department'
-- select e.emp_name,
--        nvl(d.dept_name, 'No Department') AS dept_label
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- order by e.emp_id;

-- --11 employees hired after 2023 with depart ment
-- select e.emp_name, e.hire_date, d.dept_name
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- where e.hire_date >= DATE '2023-01-01'
-- order by e.hire_date;

-- --12 Department having at least 2 employyes
-- select d.dept_name, count(*) as emp_count
-- from departments d
-- join employees e
--     on d.dept_id = e.dept_id
-- group by d.dept_name
-- having count(*) >= 2;

-- --13 employee count + total salary by department
-- select d.dept_name,
--        count(e.emp_id) as emp_count,
--        sum(e.salary) AS total_salary
-- from departments d
-- left join employees e
--     on d.dept_id = e.dept_id
-- group by d.dept_name
-- order by d.dept_name;

-- -- 14 usa coalesce for salary display
-- select e.emp_name,
--        COALESCE(TO_CHAR(e.salary), 'Salary Missing') AS salary_text,
--        d.dept_name
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id;

-- --15  find employees in depatments located in mumbai or delhi
-- select e.emp_name, d.dept_name, d.location
-- from employees e
-- join departments d
--     on e.dept_id = d.dept_id
-- where d. location in ('Mumbai', 'Delhi');

-- --16 sort by department then highest salary
-- select d.dept_name, e.emp_name, e.salary
-- from departments d
-- left join employees e
--     on d.dept_id = e.dept_id
-- order by d.dept_name, e.salary desc nulls last;

-- --17 anti - join style using not exists
-- select d.dept_id, d.dept_name
-- from departments d
-- where not exists (
--     select 1
--     from employees e
--     where e.dept_id = d.dept_id
-- );

-- -- 18 join with computer bucket (high/medium/salary)
-- select e.emp_name,
--        d.dept_name,
--        case
--            when e.salary >= 80000 then 'High'
--            when e.salary >= 50000 then 'Medium'
--            when e.salary IS NULL then 'Unknown'
--            ELSE 'Low'
--        end AS salary_band
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id;

-- --19 count null department empolees via jon result
-- select count(*) as no_dept_employees
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- where d.dept_id is null;

-- --20 cross join (all combinations)
-- select d.dept_name, e.emp_name 
-- from departments d 
-- cross join employees e;