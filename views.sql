---- author_books ----

-- purpose of this view is to display information about authors and their books

CREATE VIEW author_books AS
SELECT authors.author_pk, authors.first_name, authors.last_name, books.book_pk, books.title
FROM authors
JOIN books ON authors.author_pk = books.author_fk;

---- user_borrowing_history ----

-- purpose of this view is to provide a summary of the users and their borrowing history

CREATE VIEW user_borrowing_history AS
SELECT users.user_pk, users.first_name, users.last_name, books.title, books.publication_year, borrowed_books.borrow_date, borrowed_books.due_date, borrowed_books.return_date
FROM users
JOIN borrowed_books ON users.user_pk = borrowed_books.user_fk
JOIN books ON borrowed_books.book_fk = books.book_pk;

----  user_names ----

-- creating a simple view with the purpose of displaying specific columns from the users table, such as user_pk, first_name and last_name

CREATE VIEW user_names AS
SELECT user_pk, first_name, last_name
FROM users;
