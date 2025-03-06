-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 13, 2025 at 06:44 PM
-- Server version: 9.1.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` char(36) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `operation` varchar(10) DEFAULT NULL,
  `rows_affected` int DEFAULT NULL,
  `operation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_pk` char(36) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_pk`, `first_name`, `last_name`) VALUES
('2190adf3-992c-4175-b2ba-8d4612e0e1d7', 'George', 'Orwell'),
('69615cf1-9010-4928-abbf-81bff3c3f55a', 'Harper', 'Lee'),
('b22b8586-d966-4848-91fb-41a2f57f1560', 'Jane', 'Austen'),
('d33cb186-0799-4e5a-8e35-b98521125b99', 'F. Scott', 'Fitzgerald');

-- --------------------------------------------------------

--
-- Stand-in structure for view `author_books`
-- (See below for the actual view)
--
CREATE TABLE `author_books` (
`author_pk` char(36)
,`book_pk` char(36)
,`first_name` varchar(100)
,`last_name` varchar(100)
,`title` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_pk` char(36) NOT NULL,
  `title` varchar(100) NOT NULL,
  `isbn` char(13) NOT NULL,
  `publisher_fk` char(36) NOT NULL,
  `category_fk` char(36) NOT NULL,
  `publication_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_pk`, `title`, `isbn`, `publisher_fk`, `category_fk`, `publication_year`) VALUES
('127c1766-806f-4802-bacf-6002cf25fbab', 'To Kill a Mockingbird', '9780060935467', '7e45bbde-5c45-41b6-9e47-2526f8f42e37', 'ffd1126c-07ab-483e-9eef-1ac72e0f0bce', 1960),
('3f85016b-4a53-439b-a451-4dfc6a295dfd', 'Pride and Prejudice', '9780141439518', '5065816a-3444-4804-987d-f6e1a2d28122', '9d0ea126-06a2-4466-aafb-07a7a68c2254', 1813),
('c28f57ef-b9f1-4504-8773-5a8fd67c77a6', '1984', '9780451524935', '6b02a9bc-ccf8-4083-b5ea-a345febebef8', '00064e81-8ab5-4b7f-89a7-f8cbf85f731b', 1949),
('ca6a9a7f-e93b-4117-af77-e5ee1892a53c', 'The Great Gatsby', '9780743273565', 'ff24f51a-4cef-4363-a677-f449fdb14062', '127c7187-566a-412b-9717-566b7c28f855', 1925);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `book_fk` char(36) NOT NULL,
  `author_fk` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`book_fk`, `author_fk`) VALUES
('127c1766-806f-4802-bacf-6002cf25fbab', '69615cf1-9010-4928-abbf-81bff3c3f55a'),
('c28f57ef-b9f1-4504-8773-5a8fd67c77a6', '2190adf3-992c-4175-b2ba-8d4612e0e1d7'),
('3f85016b-4a53-439b-a451-4dfc6a295dfd', 'b22b8586-d966-4848-91fb-41a2f57f1560'),
('ca6a9a7f-e93b-4117-af77-e5ee1892a53c', 'd33cb186-0799-4e5a-8e35-b98521125b99');

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

CREATE TABLE `book_categories` (
  `category_pk` char(36) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_categories`
--

INSERT INTO `book_categories` (`category_pk`, `category_name`) VALUES
('00064e81-8ab5-4b7f-89a7-f8cbf85f731b', 'Dystopian'),
('127c7187-566a-412b-9717-566b7c28f855', 'Classic Literature'),
('9d0ea126-06a2-4466-aafb-07a7a68c2254', 'Romance'),
('ffd1126c-07ab-483e-9eef-1ac72e0f0bce', 'Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `borrowed_pk` char(36) NOT NULL,
  `user_fk` char(36) NOT NULL,
  `book_fk` char(36) NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`borrowed_pk`, `user_fk`, `book_fk`, `borrow_date`, `due_date`, `return_date`) VALUES
('6fe59367-f5ac-4e13-b635-44b864c072d1', '3536d71a-9154-4512-b15f-640dfad4feb2', 'c28f57ef-b9f1-4504-8773-5a8fd67c77a6', '2023-10-03', '2023-10-17', NULL),
('7c9dc372-5d92-4b13-ad9e-8fab3d37151b', '2c14341f-61c7-44a6-87b3-7b727198740a', '127c1766-806f-4802-bacf-6002cf25fbab', '2023-10-01', '2023-10-15', '2023-10-12'),
('7e45bbde-5c45-41b6-9e47-2526f8f42e37', '4bb62057-8c1c-46b1-a468-1ac4ab996387', 'ca6a9a7f-e93b-4117-af77-e5ee1892a53c', '2023-10-07', '2023-10-21', NULL),
('cf79fe2d-1e36-4fbd-8a29-e9e91d3b1bbf', '4e60b16f-2d9d-4ebe-82db-606828521098', '3f85016b-4a53-439b-a451-4dfc6a295dfd', '2023-10-05', '2023-10-19', '2023-10-18');

--
-- Triggers `borrowed_books`
--
DELIMITER $$
CREATE TRIGGER `after_borrowed_books_delete` AFTER DELETE ON `borrowed_books` FOR EACH ROW BEGIN
    DECLARE affected_rows INT;
    SET affected_rows = ROW_COUNT();
    INSERT INTO audit_log (table_name, operation, rows_affected)
    VALUES ('borrowed_books', 'DELETE', affected_rows);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_borrowed_books_insert` AFTER INSERT ON `borrowed_books` FOR EACH ROW BEGIN
    INSERT INTO borrowed_books_log (borrowed_pk, user_fk, book_fk, borrow_date, due_date, operation_type)
    VALUES (NEW.borrowed_pk, NEW.user_fk, NEW.book_fk, NEW.borrow_date, NEW.due_date, 'INSERT');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books_log`
--

CREATE TABLE `borrowed_books_log` (
  `log_id` char(36) NOT NULL,
  `borrowed_pk` char(36) DEFAULT NULL,
  `user_fk` char(36) DEFAULT NULL,
  `book_fk` char(36) DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `operation_type` varchar(10) DEFAULT NULL,
  `operation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `publisher_pk` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `founded_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_pk`, `name`, `country`, `founded_year`) VALUES
('5065816a-3444-4804-987d-f6e1a2d28122', 'T. Egerton', 'United Kingdom', 1784),
('6b02a9bc-ccf8-4083-b5ea-a345febebef8', 'Secker & Warburg', 'United Kingdom', 1935),
('7e45bbde-5c45-41b6-9e47-2526f8f42e37', 'J.B. Lippincott & Co.', 'United States', 1836),
('ff24f51a-4cef-4363-a677-f449fdb14062', 'Charles Scribners Sons', 'United States', 1846);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_pk` char(36) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`) VALUES
('2c14341f-61c7-44a6-87b3-7b727198740a', 'Alice', 'Johnson', '1990-04-15', 'alice.johnson@example.com', '555-1234'),
('3536d71a-9154-4512-b15f-640dfad4feb2', 'Bob', 'Smith', '1985-06-22', 'bob.smith@example.com', '555-5678'),
('4bb62057-8c1c-46b1-a468-1ac4ab996387', 'David', 'Brown', '1992-11-02', 'david.brown@example.com', '555-1122'),
('4e60b16f-2d9d-4ebe-82db-606828521098', 'Carol', 'Williams', '1978-01-30', 'carol.williams@example.com', '555-9101'),
('a2000dd1-17bd-4e35-80f6-5014a1156464', 'Emma', 'Davis', '2000-03-25', 'emma.davis@example.com', '555-3344');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_borrowing_history`
-- (See below for the actual view)
--
CREATE TABLE `user_borrowing_history` (
`borrow_date` date
,`due_date` date
,`first_name` varchar(100)
,`last_name` varchar(100)
,`publication_year` int
,`return_date` date
,`title` varchar(100)
,`user_pk` char(36)
);

-- --------------------------------------------------------

--
-- Structure for view `author_books`
--
DROP TABLE IF EXISTS `author_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `author_books`  AS SELECT `authors`.`author_pk` AS `author_pk`, `authors`.`first_name` AS `first_name`, `authors`.`last_name` AS `last_name`, `books`.`book_pk` AS `book_pk`, `books`.`title` AS `title` FROM ((`authors` join `book_authors` on((`authors`.`author_pk` = `book_authors`.`author_fk`))) join `books` on((`book_authors`.`book_fk` = `books`.`book_pk`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_borrowing_history`
--
DROP TABLE IF EXISTS `user_borrowing_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `user_borrowing_history`  AS SELECT `users`.`user_pk` AS `user_pk`, `users`.`first_name` AS `first_name`, `users`.`last_name` AS `last_name`, `books`.`title` AS `title`, `books`.`publication_year` AS `publication_year`, `borrowed_books`.`borrow_date` AS `borrow_date`, `borrowed_books`.`due_date` AS `due_date`, `borrowed_books`.`return_date` AS `return_date` FROM ((`borrowed_books` join `users` on((`borrowed_books`.`user_fk` = `users`.`user_pk`))) join `books` on((`borrowed_books`.`book_fk` = `books`.`book_pk`))) ORDER BY `users`.`user_pk` ASC, `borrowed_books`.`borrow_date` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_pk`);
ALTER TABLE `authors` ADD FULLTEXT KEY `first_name` (`first_name`,`last_name`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_pk`),
  ADD KEY `category_fk` (`category_fk`),
  ADD KEY `books_ibfk_2` (`publisher_fk`);
ALTER TABLE `books` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD KEY `author_fk` (`author_fk`),
  ADD KEY `book_fk` (`book_fk`);

--
-- Indexes for table `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`category_pk`);

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`borrowed_pk`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `book_fk` (`book_fk`);

--
-- Indexes for table `borrowed_books_log`
--
ALTER TABLE `borrowed_books_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_pk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_pk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_fk`) REFERENCES `book_categories` (`category_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_fk`) REFERENCES `publishers` (`publisher_pk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`author_fk`) REFERENCES `authors` (`author_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`book_fk`) REFERENCES `books` (`book_pk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`book_fk`) REFERENCES `books` (`book_pk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
