BOOKS

-- Query 1: Search for books containing a specific word in the title

SELECT * FROM books WHERE MATCH(title) AGAINST('Mockingbird');

-- Description: This query searches the "books" table for titles that contain the word "Mockingbird". 
It uses the Full-Text Search index on the "title" column to find relevant results.


-- Query 2: Search for multiple books containing a specific word in the title

SELECT * FROM books WHERE MATCH(title) AGAINST('Mockingbird Gatsby');

-- Query 3: Search for a book containing a specific letter in the title

SELECT * FROM books WHERE title LIKE '%t%';


AUTHORS 

-- Query 1: find authors with a specific keyword in their name

SELECT * FROM authors WHERE MATCH(first_name, last_name) AGAINST('Jane');


-- Query 2: Search for Multiple Keywords in Author Names

SELECT * FROM authors WHERE MATCH(first_name, last_name) AGAINST('John Smith');

-- Query 3: Search for a book containing a specific letter in the title

SELECT * FROM authors WHERE first_name LIKE '%t%' OR last_name LIKE '%t%';
