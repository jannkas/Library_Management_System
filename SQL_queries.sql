---------- UNION ----------
SELECT title FROM books
UNION
SELECT title FROM borrowed_books
JOIN books ON borrowed_books.book_fk = books.book_pk;

---------- GROUP BY ----------
SELECT user_fk, COUNT(book_fk) AS total_borrowed
FROM borrowed_books
GROUP BY user_fk;

---------- HAVING ----------
SELECT user_fk, COUNT(book_fk) AS total_borrowed
FROM borrowed_books
GROUP BY user_fk
HAVING COUNT(book_fk) > 1;

