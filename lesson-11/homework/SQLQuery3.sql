CREATE TABLE WorkLog (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    WorkDate DATE,
    HoursWorked INT
);

INSERT INTO WorkLog (EmployeeID, EmployeeName, Department, WorkDate, HoursWorked) VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);

CREATE VIEW vw_MonthlyWorkSummary AS
WITH EmployeeTotals AS (
    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        SUM(HoursWorked) AS TotalHoursWorked
    FROM WorkLog
    GROUP BY EmployeeID, EmployeeName, Department
),
DepartmentTotals AS (
    SELECT
        Department,
        SUM(HoursWorked) AS TotalHoursDepartment
    FROM WorkLog
    GROUP BY Department
),
DepartmentAverages AS (
    SELECT
        Department,
        AVG(HoursWorked * 1.0) AS AvgHoursDepartment
    FROM WorkLog
    GROUP BY Department
)
SELECT 
    E.EmployeeID,
    E.EmployeeName,
    E.Department,
    E.TotalHoursWorked,
    D.TotalHoursDepartment,
    A.AvgHoursDepartment
FROM EmployeeTotals E
JOIN DepartmentTotals D ON E.Department = D.Department
JOIN DepartmentAverages A ON E.Department = A.Department;

select * from vw_MonthlyWorkSummary
