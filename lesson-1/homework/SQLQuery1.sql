drop table if exists student
create table student(
	id int,
	name varchar(100),
	age int
);

ALTER TABLE student
ALTER COLUMN id int NOT NULL;

insert into student
values 
	(1,'Sardor',16),
	(2,'John',33)

select * from student
		