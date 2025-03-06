---------- stored procedure 1 ----------

CREATE PROCEDURE BorrowBook (
    IN user_pk CHAR(36),
    IN book_pk CHAR(36),
    IN borrow_date DATE,
    IN due_date DATE
)
BEGIN
    INSERT INTO borrowed_books (borrowed_pk, user_fk, book_fk, borrow_date, due_date)
    VALUES (UUID(), user_pk, book_pk, borrow_date, due_date);
END$$ 

CALL BorrowBook('3536d71a-9154-4512-b15f-640dfad4feb2', '127c1766-806f-4802-bacf-6002cf25fbab', '2025-01-14', '2025-01-28');

---------- stored procedure 2 ----------

DELIMITER //

CREATE PROCEDURE AddNewUser(
    IN userID CHAR(36),
    IN userFirstName VARCHAR(100),
    IN userLastName VARCHAR(100),
    IN userDOB DATE,
    IN userEmail VARCHAR(255),
    IN userPhone VARCHAR(15)
)
BEGIN
    INSERT INTO users (user_pk, first_name, last_name, date_of_birth, email, phone_number)
    VALUES (userID, userFirstName, userLastName, userDOB, userEmail, userPhone);
END //

-- DELIMITER ; remove -- before DELIMITER; to add this stored procedure

CALL AddNewUser('Oliver', 'Twist', '1838-01-01', 'oliver@twist.com', '555-4321');


---------- stored procedure 3 ----------

CREATE PROCEDURE GetBooksInCategory(
    IN categoryName VARCHAR(100)
)
BEGIN
    SELECT COUNT(*) AS TotalBooks
    FROM books b
    JOIN book_categories bc ON b.category_fk = bc.category_pk
    WHERE bc.category_name = categoryName;
END //

CALL GetBooksInCategory('Fiction');