-- Step 1: Drop table if exists
DROP TABLE IF EXISTS books;

-- Step 2: Create table with all constraints
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    genre VARCHAR(100) CONSTRAINT df_genre DEFAULT 'Unknown',
    CONSTRAINT chk_title_not_empty CHECK (title <> ''),
    CONSTRAINT chk_price_positive CHECK (price > 0)
);

INSERT INTO books (title, price, genre) VALUES
    ('The Alchemist', 15.99, 'Fiction'),
    ('Clean Code', 39.95, 'Programming');
    --('Invisible Cities', 12.00, DEFAULT);

INSERT INTO books (title, price) VALUES
	('Invisible Cities', 12.00);

SELECT * FROM books;
