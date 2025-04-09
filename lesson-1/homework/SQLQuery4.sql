DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category_id INT,
    CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id)
);

ALTER TABLE item
DROP CONSTRAINT fk_category_id;

ALTER TABLE item
ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);
