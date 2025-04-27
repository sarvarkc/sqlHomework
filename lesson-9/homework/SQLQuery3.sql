;WITH cte AS (
    SELECT
        1 AS num,
        0 AS prev_fibo,
        1 AS curr_fibo
    UNION ALL
    SELECT
        num + 1 as num,
        curr_fibo as prev_fibo,
        prev_fibo + curr_fibo as curr_fibo
    FROM cte
    WHERE num < 10
)
SELECT num, curr_fibo AS Fibonacci
FROM cte;
