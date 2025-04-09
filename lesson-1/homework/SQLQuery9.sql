DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Member;

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT CHECK (published_year >= 0)
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

INSERT INTO Book (book_id, title, author, published_year) VALUES
    (1, '1984', 'George Orwell', 1949),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
    (3, 'Clean Code', 'Robert C. Martin', 2008);

INSERT INTO Member (member_id, name, email, phone_number) VALUES
    (1, 'Sardor Karimov', 'sardor@example.com', '+998901234567'),
    (2, 'Emma Johnson', 'emma@example.com', '+998907654321');

INSERT INTO Loan (loan_id, book_id, member_id, loan_date, return_date) VALUES
    (1, 1, 1, '2025-04-01', '2025-04-08'), 
    (2, 2, 1, '2025-04-02', NULL),        
    (3, 3, 2, '2025-04-03', '2025-04-07');
