DROP TABLE IF EXISTS test_identity;

CREATE TABLE test_identity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255)
);

insert into test_identity values
	('A'), ('B'), ('C'), ('D'), ('E')

/*
DELETE FROM test_identity WHERE id=5
-- Delete doesn't affects the whole funcionality of table. As you can see on the result after id 5 deleted new added item woulnd't be id 5 because of its unapperance but will be id 6
insert into test_identity values
	('F')
*/

/*TRUNCATE TABLE test_identity  -- Truncate won't delete whole table but just whole info and in some degree funcitionality */

DROP TABLE test_identity -- Drop just deletes whole table