CREATE TABLE Groupings (
    StepNumber INT PRIMARY KEY,
    Status VARCHAR(10)
);

INSERT INTO Groupings (StepNumber, Status) VALUES
(1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10, 'Passed'),
(11, 'Passed'),
(12, 'Passed');

SELECT 
    MIN(StepNumber) AS MinStepNumber,
    MAX(StepNumber) AS MaxStepNumber,
    Status,
    COUNT(*) AS ConsecutiveCount
FROM (
    SELECT 
        StepNumber,
        Status,
        SUM(CASE WHEN PrevStatus IS NULL OR Status != PrevStatus THEN 1 ELSE 0 END) 
            OVER (ORDER BY StepNumber) AS grp
    FROM (
        SELECT 
            StepNumber,
            Status,
            LAG(Status) OVER (ORDER BY StepNumber) AS PrevStatus
        FROM Groupings
    ) AS Sub1
) AS Sub2
GROUP BY Status, grp
ORDER BY MinStepNumber;


