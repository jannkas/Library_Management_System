---------- CREATE ----------

INSERT INTO users (user_pk, first_name, last_name, date_of_birth, email, phone_number)
VALUES ('123e4567-e89b-12d3-a456-426614174000', 'Anna', 'Smith', '1999-09-09', 'anna@example.com', '12344321');

INSERT INTO books (book_pk, title, isbn, publisher_fk, category_fk, publication_year)
VALUES ('baca37be-2057-42de-ae64-4c5a88d4d108', 'Databases', '1234567891111', '13a301f5-5324-4beb-b668-50753c3cc137', '22eb2be4-8cb4-48ca-83f2-a1794c931364', 1998)

---------- READ ----------

SELECT * FROM books -- get all books

SELECT * FROM books WHERE book_pk = '64d89eb7-1e94-4735-8805-0307c71b8ad7'; -- find a specific book by book_pk

SELECT * FROM books WHERE publication_year > 1980; -- find books published after 1980

SELECT * FROM books WHERE publisher_fk = '13a301f5-5324-4beb-b668-50753c3cc137'; -- find books by a specific publisher

SELECT * FROM books WHERE title LIKE '%kill%'; -- search for books by title (Partial Match)

SELECT * FROM books ORDER BY publication_year DESC LIMIT 1; -- find the most recently published book

---------- UPDATE ----------

-- updating a books title --
UPDATE books  
SET title = 'The Great Gatsby - Updated Version'  
WHERE book_pk = 'ba7f0132-dc1b-4cab-9571-70e95ae85a99'; 

-- updating a books publication year --
UPDATE books  
SET publication_year = 2020  
WHERE book_pk = 'ba7f0132-dc1b-4cab-9571-70e95ae85a99';

-- update all books from a certain publisher --
UPDATE books  
SET publication_year = 2021  
WHERE publisher_fk = '13a301f5-5324-4beb-b668-50753c3cc137';

---------- DELETE ----------

-- deletes a book with specific book_pk --
DELETE FROM books  
WHERE book_pk = '';

-- delete all books by a specific publisher --
DELETE FROM books  
WHERE publisher_fk = '';

-- delete borrowed books for a user --
DELETE FROM borrowed_books  
WHERE user_fk = '';
