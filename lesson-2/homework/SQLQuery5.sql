drop table if exists worker;
create table worker
(
	id int primary key,
	name varchar(100)
);

BULK INSERT worker
FROM 'C:\Users\mumin\Desktop\Python\SQL\sqlHomework\lesson-2\homework\sample.csv'
WITH (
	firstrow=2,
	fieldterminator=',',
	rowterminator='\n'
);

select * from worker