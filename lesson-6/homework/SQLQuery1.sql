CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);

--Task 1: Inner Join
select 
	Employees.*,
	Departments.DepartmentName
from Employees -- left table
inner join Departments -- right table
on Employees.DepartmentID = Departments.DepartmentID

-- Task 2: Left Join
select 
	Employees.*,
	Departments.DepartmentName
from Employees
left join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- Task 3: Right Join
select 
	Employees.*,
	Departments.DepartmentName
from Employees
right join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- Task 4: Outer Join
select 
	Employees.*,
	Departments.DepartmentName
from Employees
full outer join Departments
on Employees.DepartmentID = Departments.DepartmentID

-- Task 5: Expenses
select 
	distinct Departments.DepartmentName,
	ISNULL(SUM(Employees.Salary) OVER(partition by Departments.DepartmentName),0)
from Employees
right join Departments
on Employees.DepartmentID = Departments.DepartmentID

--Task 6: Cross Join
select 
	*
from Departments
cross join Projects

-- Task 7: Multiple Joins
select 
	Employees.*,
	Departments.DepartmentName,
	Projects.ProjectName
from Employees
left join Departments
on Employees.DepartmentID = Departments.DepartmentID
left join Projects
on Employees.EmployeeID = Projects.EmployeeID