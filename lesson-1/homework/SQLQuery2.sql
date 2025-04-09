DROP TABLE IF EXISTS product;
CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    CONSTRAINT uq_product_id UNIQUE(product_id)
);

ALTER TABLE product
DROP CONSTRAINT uq_product_id;

ALTER TABLE product
ADD CONSTRAINT uq_product_id UNIQUE(product_id);

ALTER TABLE product
ADD CONSTRAINT uq_product_id_name UNIQUE(product_id, product_name);

INSERT INTO product VALUES
    (1, 'Coke', 12.00),
    (2, 'Pepsi', 14.00);

SELECT * FROM product;
