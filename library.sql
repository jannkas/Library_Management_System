DROP TABLE IF EXISTS borrowed_books;
DROP TABLE IF EXISTS book_authors;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS book_categories;

--####################################

CREATE TABLE books (
    book_id             TEXT,
    title               TEXT,
    isbn                TEXT,
    publisher_fk        TEXT,
    category_fk         TEXT,
    publication_year    TEXT,
    PRIMARY KEY (book_id)
    FOREIGN KEY (publisher_fk) REFERENCES publishers(publisher_id),
    FOREIGN KEY (category_fk) REFERENCES book_categories(category_id)
)WITHOUT ROWID;


INSERT INTO Books (book_id, title, isbn, publisher_fk, category_fk, publication_year) VALUES
    (1, 'To Kill a Mockingbird', '9780060935467', 1, 1, 1960),
    (2, '1984', '9780451524935', 2, 2, 1949),
    (3, 'Pride and Prejudice', '9780141439518', 3, 3, 1813),
    (4, 'The Great Gatsby', '9780743273565', 4, 4, 1925);


SELECT * FROM books;

--####################################

CREATE TABLE publishers (
    publisher_id        TEXT,
    name                TEXT,
    country             TEXT,
    founded_year        TEXT,
    PRIMARY KEY (publisher_id)
)WITHOUT ROWID;

INSERT INTO Publishers (publisher_id, name, country, founded_year) VALUES
    (1, 'J.B. Lippincott & Co.', 'United States', 1836),
    (2, 'Secker & Warburg', 'United Kingdom', 1935),
    (3, 'T. Egerton', 'United Kingdom', 1784),
    (4, 'Charles Scribners Sons', 'United States', 1846);


SELECT * FROM publishers;

--####################################

CREATE TABLE book_categories (
    category_id         TEXT,
    category_name       TEXT,
    PRIMARY KEY (category_id)
)WITHOUT ROWID; 

INSERT INTO Book_Categories (category_id, category_name) VALUES
    (1, 'Fiction'),
    (2, 'Dystopian'),
    (3, 'Romance'),
    (4, 'Classic Literature');

SELECT * FROM book_categories;


--####################################

CREATE TABLE authors (
    author_id           TEXT,
    first_name          TEXT,
    last_name           TEXT,
    PRIMARY KEY (author_id)
)WITHOUT ROWID;

INSERT INTO authors (author_id, first_name, last_name) VALUES
    ('A001', 'Harper', 'Lee'),
    ('A002', 'George', 'Orwell'),
    ('A003', 'Jane', 'Austen'),
    ('A004', 'F. Scott', 'Fitzgerald');

SELECT * FROM authors; 


--####################################


CREATE TABLE users (
    user_id             TEXT,
    first_name          TEXT,
    last_name           TEXT,
    date_of_birth       TEXT,
    email               TEXT,
    phone_number        TEXT,
    PRIMARY KEY (user_id)
)WITHOUT ROWID;

INSERT INTO users (user_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
    ('U001', 'Alice', 'Johnson', '1990-04-15', 'alice.johnson@example.com', '555-1234'),
    ('U002', 'Bob', 'Smith', '1985-06-22', 'bob.smith@example.com', '555-5678'),
    ('U003', 'Carol', 'Williams', '1978-01-30', 'carol.williams@example.com', '555-9101'),
    ('U004', 'David', 'Brown', '1992-11-02', 'david.brown@example.com', '555-1122'),
    ('U005', 'Emma', 'Davis', '2000-03-25', 'emma.davis@example.com', '555-3344');

    SELECT * FROM users;

--####################################


CREATE TABLE book_authors (
    book_fk             TEXT,
    author_fk           TEXT,
    PRIMARY KEY (book_fk, author_fk),
    FOREIGN KEY (book_fk) REFERENCES books(book_id),
    FOREIGN KEY (author_fk) REFERENCES authors(author_id)
)WITHOUT ROWID;

INSERT INTO book_authors (book_fk, author_fk) VALUES
    ('1', 'A001'),  -- To Kill a Mockingbird by Harper Lee
    ('2', 'A002'),  -- 1984 by George Orwell
    ('3', 'A003'),  -- Pride and Prejudice by Jane Austen
    ('4', 'A004');  -- The Great Gatsby by F. Scott Fitzgerald

SELECT * FROM book_authors;

--####################################


CREATE TABLE borrowed_books (
    borrow_id           TEXT,
    user_fk             TEXT,
    book_fk             TEXT,
    borrow_date         TEXT,
    due_date            TEXT,
    return_date         TEXT,
    PRIMARY KEY (borrow_id)
    FOREIGN KEY (user_fk) REFERENCES users(user_id),
    FOREIGN KEY (book_fk) REFERENCES Books(book_id)
)WITHOUT ROWID;

INSERT INTO borrowed_books (borrow_id, user_fk, book_fk, borrow_date, due_date, return_date) VALUES
    ('B001', 'U001', '1', '2023-10-01', '2023-10-15', '2023-10-12'),
    ('B002', 'U002', '2', '2023-10-03', '2023-10-17', NULL),  -- Not yet returned
    ('B003', 'U003', '3', '2023-10-05', '2023-10-19', '2023-10-18'),
    ('B004', 'U004', '4', '2023-10-07', '2023-10-21', NULL);  -- Not yet returned

SELECT * FROM borrowed_books; 

--#################################### JOIN STATEMENTS ####################################-- 

-- Query to join books, publishers, and categories for combined information
SELECT 
    books.book_id,
    books.title,
    books.isbn,
    publishers.name AS publisher,
    publishers.country AS publisher_country,
    book_categories.category_name AS category,
    books.publication_year
FROM 
    books
LEFT JOIN 
    publishers ON books.publisher_fk = publishers.publisher_id
LEFT JOIN 
    book_categories ON books.category_fk = book_categories.category_id;

-- List All Books Borrowed by Each User with Due Dates

SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    books.title,
    books.publication_year,
    borrowed_books.borrow_date,
    borrowed_books.due_date,
    borrowed_books.return_date
FROM 
    borrowed_books
JOIN 
    users ON borrowed_books.user_fk = users.user_id
JOIN 
    books ON borrowed_books.book_fk = books.book_id
ORDER BY 
    users.user_id, borrowed_books.borrow_date;


--List Users Who Borrowed a Specific Book, Including Author Information

SELECT 
    books.title,
    authors.first_name || ' ' || authors.last_name AS author_name,
    users.user_id,
    users.first_name AS user_first_name,
    users.last_name AS user_last_name,
    borrowed_books.borrow_date,
    borrowed_books.due_date,
    borrowed_books.return_date
FROM 
    borrowed_books
JOIN 
    books ON borrowed_books.book_fk = books.book_id
JOIN 
    users ON borrowed_books.user_fk = users.user_id
JOIN 
    book_authors ON books.book_id = book_authors.book_fk
JOIN 
    authors ON book_authors.author_fk = authors.author_id
WHERE 
    books.book_id = '3';  -- Replace '1' with the specific book_id you want to query

--#################################### ACID PRINCIPLES ####################################-- 

--Atomicity
--the transaction of borrowing a book that affects borrowed_books & users table

BEGIN TRANSACTION;
INSERT INTO borrowed_books (borrow_id, user_fk, book_fk, borrow_date, due_date) VALUES (...);
UPDATE books SET status = 'borrowed' WHERE book_id = ...;
COMMIT; -- Commits only if both commands succeed


