drop table if exists EMPLOYEES_N
CREATE TABLE EMPLOYEES_N (
    EMPLOYEE_ID INT NOT NULL,
    FIRST_NAME VARCHAR(20) NULL,
    [HIRE_DATE] DATE NOT NULL
);

INSERT INTO EMPLOYEES_N (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE) VALUES
(1, 'John', '1975-06-01'),
(2, 'Jane', '1976-07-15'),
(3, 'Paul', '1977-03-22'),
(4, 'Mary', '1979-11-30'),
(5, 'Peter', '1980-05-20'),
(6, 'Susan', '1982-04-11'),
(7, 'David', '1983-09-09'),
(8, 'Robert', '1984-08-18'),
(9, 'Linda', '1985-02-25'),
(10, 'Michael', '1990-01-13'),
(11, 'Sarah', '1997-07-07');

select * from
(
select
	(CASE 
		WHEN HireDate + 1 != LeadYear and LeadYear - 1 != HireDate THEN HireDate + 1 
		WHEN LeadYear is NULL THEN HireDate + 1 ELSE NULL END) as StartDate,
	(CASE 
		WHEN HireDate + 1 != LeadYear and LeadYear - 1 != HireDate THEN LeadYear + 1 
		WHEN LeadYear is NULL THEN YEAR(GETDATE()) ELSE NULL END) as EndDate
from
(
select
	YEAR(HIRE_DATE) as HireDate,
	LEAD(YEAR(HIRE_DATE)) OVER(order by HIRE_DATE) as LeadYear
from EMPLOYEES_N
) as Sub1
) as Sub2
where StartDate is not NULL and EndDate is not NULL