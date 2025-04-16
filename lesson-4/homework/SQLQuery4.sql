DROP TABLE IF EXISTS letters
create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

SELECT letter
FROM letters
ORDER BY 
    CASE WHEN letter = 'b' THEN 0 ELSE 1 END,
    letter;

SELECT letter
FROM letters
ORDER BY 
    CASE WHEN letter = 'b' THEN 1 ELSE 0 END,
    letter;


SELECT letter FROM (
    SELECT TOP 2 letter 
    FROM letters 
    WHERE letter <> 'b' 
    ORDER BY letter
) AS FirstPart

UNION ALL

SELECT 'b' AS letter

UNION ALL

SELECT letter 
FROM (
    SELECT letter 
    FROM letters 
    WHERE letter <> 'b' 
    ORDER BY letter
    OFFSET 2 ROWS FETCH NEXT 100 ROWS ONLY
) AS RestPart;
