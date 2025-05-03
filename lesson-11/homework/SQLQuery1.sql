CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 7000),
(3, 'Charlie', 'Sales', 6000),
(4, 'David', 'HR', 5500),
(5, 'Emma', 'IT', 7200);


CREATE TABLE #EmployeeTransfers (
    EmployeeID INT,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary INT
);

;with ect as (
  select 
    EmployeeID,
    Name,
    (CASE WHEN Department = 'HR' THEN 'IT'
          WHEN Department = 'IT' THEN 'Sales' ELSE 'HR' END) as NewDp,
    Salary from Employees
)

INSERT INTO #EmployeeTransfers 
select * from ect
    
select * from #EmployeeTransfers
    