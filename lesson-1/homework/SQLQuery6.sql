DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100) CONSTRAINT df_city DEFAULT 'Unknown'
);

ALTER TABLE customer
DROP CONSTRAINT df_city;

ALTER TABLE customer
ADD CONSTRAINT df_city DEFAULT 'Unknown' FOR city;
