DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT not null,
    customer_name VARCHAR(100),
    order_date DATE,
    CONSTRAINT pk_order_id primary key(order_id)
);

ALTER TABLE orders
DROP CONSTRAINT pk_order_id;

ALTER TABLE orders
ADD CONSTRAINT pk_order_id primary key(order_id);

INSERT INTO orders VALUES
    (1, 'Sardor', '2025-02-12'),
    (2, 'John', '2025-05-15');

SELECT * FROM orders;