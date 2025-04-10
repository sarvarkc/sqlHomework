DROP TABLE IF EXISTS student;

CREATE TABLE student (
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(100),
    classes INT,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (name, classes, tuition_per_class)
VALUES
    ('Alice', 5, 150.00),
    ('Bob', 3, 200.50),
    ('Charlie', 8, 120.75);

SELECT * FROM student;
