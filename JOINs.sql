---------- INNER JOIN ----------
SELECT users.first_name, books.title
FROM users
INNER JOIN borrowed_books ON users.user_pk = borrowed_books.user_fk
INNER JOIN books ON borrowed_books.book_fk = books.book_pk;

-- This will only show users who borrowed books, excluding users with no borrowed books.
-- Returns only matching rows between two tables.

---------- LEFT JOIN ----------
SELECT users.first_name, books.title
FROM users
LEFT JOIN borrowed_books ON users.user_pk = borrowed_books.user_fk
LEFT JOIN books ON borrowed_books.book_fk = books.book_pk;

-- This will show all users, even those who haven’t borrowed books.
-- Returns all rows from the left table, even if there’s no match in the right table.

---------- RIGHT JOIN ----------
SELECT books.title, users.first_name
FROM books
RIGHT JOIN borrowed_books ON books.book_pk = borrowed_books.book_fk
RIGHT JOIN users ON borrowed_books.user_fk = users.user_pk;

-- This will show all borrowed books and their borrowers.
-- Returns all rows from the right table, even if there’s no match in the left table.

---------- FULL JOIN ----------
SELECT users.first_name, books.title
FROM users
LEFT JOIN borrowed_books ON users.user_pk = borrowed_books.user_fk
LEFT JOIN books ON borrowed_books.book_fk = books.book_pk
UNION
SELECT users.first_name, books.title
FROM books
RIGHT JOIN borrowed_books ON books.book_pk = borrowed_books.book_fk
RIGHT JOIN users ON borrowed_books.user_fk = users.user_pk;

-- This will show all users and borrowed books, regardless of whether there’s a match.
-- Returns all records from both tables, even if there's no match.

---------- CROSS JOIN ----------
SELECT users.first_name, books.title
FROM users
CROSS JOIN books;

-- If you have 5 users and 3 books, this query will produce 15 rows (5 × 3), showing every user paired with every book.
-- Returns every possible combination of rows from two tables.

---------- SELF JOIN ----------
SELECT a.title AS book1, b.title AS book2, a.publication_year
FROM books a
INNER JOIN books b ON a.publication_year = b.publication_year
WHERE a.book_pk != b.book_pk;

-- This compares the books table to itself to find pairs of books with the same publication year.
-- Joins a table to itself.