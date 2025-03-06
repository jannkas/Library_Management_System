------------ Row-Level Trigger ------------
CREATE TABLE borrowed_books_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    borrowed_pk CHAR(36),
    user_fk CHAR(36),
    book_fk CHAR(36),
    borrow_date DATE,
    due_date DATE,
    operation_type VARCHAR(10), -- 'INSERT', 'UPDATE', etc.
    operation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_borrowed_books_insert
AFTER INSERT ON borrowed_books
FOR EACH ROW
BEGIN
    INSERT INTO borrowed_books_log (borrowed_pk, user_fk, book_fk, borrow_date, due_date, operation_type)
    VALUES (NEW.borrowed_pk, NEW.user_fk, NEW.book_fk, NEW.borrow_date, NEW.due_date, 'INSERT');
END$$
DELIMITER ;

------------ Statement level triggers ------------
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    operation VARCHAR(10),
    rows_affected INT,
    operation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_borrowed_books_delete
AFTER DELETE ON borrowed_books
BEGIN
    DECLARE affected_rows INT;
    SET affected_rows = ROW_COUNT();
    INSERT INTO audit_log (table_name, operation, rows_affected)
    VALUES ('borrowed_books', 'DELETE', affected_rows);
END$$
DELIMITER ;

------------ Testing the trigger ------------
DELETE FROM borrowed_books WHERE borrowed_pk = 'B001';

SELECT * FROM audit_log;

INSERT INTO borrowed_books (borrowed_pk, user_fk, book_fk, borrow_date, due_date, return_date)
VALUES ('', 'user_fk', 'book_fk', CURRENT_DATE, 'due date', NULL);

SELECT * FROM borrowed_books_log;


DELETE FROM borrowed_books
WHERE borrowed_pk = '<uuid4-of-a-row-you-want-to-delete>';

SELECT * FROM audit_log;
