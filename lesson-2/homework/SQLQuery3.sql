DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
    id INT PRIMARY KEY,
    photo VARBINARY(MAX)
);

insert into photos
select 1, BulkColumn from openrowset(
	BULK 'C:\Users\mumin\Pictures\Screenshots\Снимок экрана 2025-02-20 220823.png', SINGLE_BLOB
) AS img;

SELECT * FROM photos;