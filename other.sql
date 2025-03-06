---------- ALIAS ----------

SELECT title AS "Book Title" 
FROM books;

---------- LIMIT ----------

SELECT * FROM books LIMIT 3;

SELECT * FROM books LIMIT 2,2; -- Skips first two rows, returns the second two rows
