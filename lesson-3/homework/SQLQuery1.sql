DROP TABLE IF EXISTS Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
    (1, 'Alice', 'Morgan', 'Engineering', 85000.00, '2019-03-15'),
    (2, 'Bob', 'Thompson', 'Human Resources', 22000.00, '2020-06-01'),
    (3, 'Charlie', 'Nguyen', 'Finance', 78000.00, '2018-09-23'),
    (4, 'Diana', 'Lopez', 'Engineering', 91000.00, '2021-01-10'),
    (5, 'Ethan', 'Singh', 'Marketing', 69500.00, '2022-11-04'),
    (6, 'Fiona', 'Khan', 'IT', 88000.00, '2020-02-28'),
    (7, 'George', 'White', 'Legal', 99000.00, '2017-07-17'),
    (8, 'Hannah', 'Petrov', 'Customer Support', 54000.00, '2021-10-05'),
    (9, 'Ian', 'Chen', 'Engineering', 87000.00, '2019-12-19'),
    (10, 'Julia', 'Martins', 'Finance', 81000.00, '2018-05-11');



select TOP 10 PERCENT
	* 
from Employees
ORDER BY Salary Desc

SELECT 
    Department,
    AVG(Salary) AS AverageSalary
FROM 
    Employees
GROUP BY 
    Department
ORDER BY AverageSalary DESC -- 4th task


SELECT *, 
	CASE 
		WHEN Salary > 80000 THEN 'HIGH'
		WHEN Salary between 50000 and 80000 THEN 'MEDIUM'
		ELSE 'LOW'
	END AS SalaryCategory
FROM Employees;

SELECT *
FROM Employees
ORDER BY EmployeeID
OFFSET 2 ROW FETCH NEXT 5 ROWS ONLY;
