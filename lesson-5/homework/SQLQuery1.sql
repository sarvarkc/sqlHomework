drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'Alice Johnson', 'Engineering', 85000.00, '2019-03-15'),
(2, 'Bob Smith', 'Marketing', 62000.00, '2020-06-21'),
(3, 'Carlos Diaz', 'Human Resources', 57000.00, '2018-10-30'),
(4, 'Diana Prince', 'Engineering', 91000.00, '2017-04-12'),
(5, 'Evan Miller', 'Sales', 69000.00, '2021-02-10'),
(6, 'Fiona Zhang', 'Finance', 73000.00, '2022-01-05'),
(7, 'George Patel', 'Engineering', 88000.00, '2016-11-09'),
(8, 'Hannah Lee', 'Marketing', 64000.00, '2019-08-27'),
(9, 'Ivan Novak', 'Sales', 67500.00, '2020-03-02'),
(10, 'Julia Kim', 'Finance', 75500.00, '2021-07-19'),
(11, 'Kevin O’Brien', 'Human Resources', 59000.00, '2018-12-17'),
(12, 'Laura Singh', 'Engineering', 93000.00, '2015-05-30'),
(13, 'Mike Brown', 'Sales', 70500.00, '2019-11-13'),
(14, 'Nina Garcia', 'Marketing', 66000.00, '2020-09-01'),
(15, 'Oscar Niemann', 'Engineering', 95000.00, '2023-02-25'),
(16, 'Priya Mehta', 'Finance', 74000.00, '2022-06-11'),
(17, 'Quentin Black', 'Sales', 69500.00, '2017-08-08'),
(18, 'Rachel Adams', 'Human Resources', 58000.00, '2016-02-14'),
(19, 'Steve Rogers', 'Engineering', 91000.00, '2018-04-20'),
(20, 'Tina Fey', 'Marketing', 67000.00, '2023-03-01');

-- Task 1
select *, ROW_NUMBER() OVER(order by Salary) as SalaryID
from Employees

-- Task 2
SELECT *
FROM (
    SELECT 
		*,
        DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
) AS RankedList
WHERE SalaryRank IN (
    SELECT SalaryRank
    FROM (
        SELECT 
            DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
        FROM Employees
    ) AS RanksOnly
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
)
ORDER BY SalaryRank, Salary DESC; -- analyze!

-- Task 3
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryID
    FROM Employees
) AS RankedEmployees
WHERE SalaryID in (1,2);

-- Task 4
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary) AS SalaryID
    FROM Employees
) AS RankedEmployees
WHERE SalaryID = 1;

-- Task 5
select 
		*,
		sum(salary) over() as JustWholeSum,
		sum(salary) over(partition by Department order by HireDate) as Adding
from Employees
order by Department;

-- Task 6
select 
		distinct Department,
		sum(salary) over(partition by department) as SumByDep
from Employees

-- Task 7
select 
		distinct Department,
		avg(salary) over(partition by department) as AvgSalary
from Employees

-- Task 8
select 
		*,
		avg(salary) over(partition by department) as AvgSalary,
		Salary - avg(salary) over(partition by department) as Differencee 
from Employees

-- Task 9
select 
		*,
		avg(salary) over(order by Salary rows between 1 preceding and 1 following) as MovingAverage
from Employees

-- Task 10
select 
		*,
		sum(salary) over(order by HireDate rows between current row and 2 following) as Previous3Sum
from Employees

-- Task 11
select
		*,
		avg(salary) over(order by Salary rows between unbounded preceding and current row) as AvgALLPrevious
from Employees

-- Task 12
select 
		*,
		max(salary) over(order by Salary rows between 2 preceding and 2 following) as MovingAverage
from Employees

-- Task 13
select
		*,
		100 * Salary / sum(Salary) over(partition by department) as Contribution
from Employees


