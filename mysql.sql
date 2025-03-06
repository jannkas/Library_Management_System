-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 03, 2025 at 01:08 PM
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
CREATE DATABASE IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `company`;

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
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_pk`, `first_name`, `last_name`) VALUES
('26e65a6e-a7d4-469a-9328-bb9ce2c1f4c7', 'Jane', 'Austen'),
('2adc93ee-6579-4a9f-85d8-375d0a1f7b7f', 'Harper', 'Lee'),
('4755c108-d2d4-4ada-935c-61979f06a0a2', 'J.D.', 'Salinger'),
('7309d64b-4954-447a-9d7f-5de1054fb519', 'F. Scott', 'Fitzgerald'),
('8ad44ca0-9c66-417d-b689-d73f85b179de', 'George', 'Orwell');

-- --------------------------------------------------------

--
-- Stand-in structure for view `author_books`
-- (See below for the actual view)
--
CREATE TABLE `author_books` (
`author_pk` char(36)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`book_pk` char(36)
,`title` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_pk` char(36) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isbn` char(13) NOT NULL,
  `publisher_fk` char(36) NOT NULL,
  `category_fk` char(36) NOT NULL,
  `publication_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_pk`, `title`, `isbn`, `publisher_fk`, `category_fk`, `publication_year`) VALUES
('261c8336-8fe7-49fe-ab8d-ed93208968df', '1984', '9780451524935', '13a301f5-5324-4beb-b668-50753c3cc137', 'f6fcdfcd-0c20-4345-8b6d-6e69efd4c2df', 1949),
('45e7c70e-8b20-4a8a-8f4a-27504e43759b', 'Blue Melody', '9788767435131', 'f0d9e508-0bf0-4038-9463-f1cc0bb04b28', '8aca56f2-752d-4c97-b679-338c969cc29a', 1948),
('64d89eb7-1e94-4735-8805-0307c71b8ad7', 'To Kill a Mockingbird', '9780060935467', 'f0d9e508-0bf0-4038-9463-f1cc0bb04b28', '22eb2be4-8cb4-48ca-83f2-a1794c931364', 1960),
('844477a1-93bf-473a-b0a5-d69c5e3e37dd', 'Pride and Prejudice', '9780141439518', '34bd84de-1b26-4ecb-b681-3a191f69df74', '259bf0da-8409-404f-9e87-fc9eca695dde', 1813),
('8d7ab430-2f9f-49c8-a183-609e77248de1', 'The Catcher in the Rye', '9780316769488', 'f0d9e508-0bf0-4038-9463-f1cc0bb04b28', '8aca56f2-752d-4c97-b679-338c969cc29a', 1951),
('ba7f0132-dc1b-4cab-9571-70e95ae85a99', 'The Great Gatsby', '9780743273565', '9773a68a-8b88-44c6-a69d-0416daff40d8', '8aca56f2-752d-4c97-b679-338c969cc29a', 1925);

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
('844477a1-93bf-473a-b0a5-d69c5e3e37dd', '26e65a6e-a7d4-469a-9328-bb9ce2c1f4c7'),
('64d89eb7-1e94-4735-8805-0307c71b8ad7', '2adc93ee-6579-4a9f-85d8-375d0a1f7b7f'),
('45e7c70e-8b20-4a8a-8f4a-27504e43759b', '4755c108-d2d4-4ada-935c-61979f06a0a2'),
('8d7ab430-2f9f-49c8-a183-609e77248de1', '4755c108-d2d4-4ada-935c-61979f06a0a2'),
('ba7f0132-dc1b-4cab-9571-70e95ae85a99', '7309d64b-4954-447a-9d7f-5de1054fb519'),
('261c8336-8fe7-49fe-ab8d-ed93208968df', '8ad44ca0-9c66-417d-b689-d73f85b179de');

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

CREATE TABLE `book_categories` (
  `category_pk` char(36) NOT NULL,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book_categories`
--

INSERT INTO `book_categories` (`category_pk`, `category_name`) VALUES
('22eb2be4-8cb4-48ca-83f2-a1794c931364', 'Fiction'),
('259bf0da-8409-404f-9e87-fc9eca695dde', 'Romance'),
('8aca56f2-752d-4c97-b679-338c969cc29a', 'Classic Literature'),
('f6fcdfcd-0c20-4345-8b6d-6e69efd4c2df', 'Dystopian');

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
('a20df48a-eafc-4113-ba13-656a7c543aa5', '660f4ac9-4ba9-420f-8547-2a6624a44492', '844477a1-93bf-473a-b0a5-d69c5e3e37dd', '2023-10-05', '2023-10-19', '2023-10-18'),
('a26e2bf8-135f-4ff5-9937-6b141a170fc8', '46b54f65-e181-464f-8ccb-828f4b3f9d88', '64d89eb7-1e94-4735-8805-0307c71b8ad7', '2023-10-01', '2023-10-15', '2023-10-12'),
('eded526f-30ae-4d7a-811c-ffa973c2ee41', '36ec8eb4-7ada-4983-a79e-29825fd4e547', '8d7ab430-2f9f-49c8-a183-609e77248de1', '2025-01-15', '2025-01-29', NULL),
('f996b4bf-bbfa-4748-a0b7-990817c08422', '7852bf19-b77b-4d71-93b5-748880a92ec4', 'ba7f0132-dc1b-4cab-9571-70e95ae85a99', '2023-10-07', '2023-10-21', NULL),
('fb938060-0a6f-4022-8b41-8ca6ab5a0533', '2a546aa4-de2d-4dce-8a1d-cb0971673dab', '261c8336-8fe7-49fe-ab8d-ed93208968df', '2023-10-03', '2023-10-17', NULL);

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

--
-- Dumping data for table `borrowed_books_log`
--

INSERT INTO `borrowed_books_log` (`log_id`, `borrowed_pk`, `user_fk`, `book_fk`, `borrow_date`, `due_date`, `operation_type`, `operation_time`) VALUES
('', 'eded526f-30ae-4d7a-811c-ffa973c2ee41', '36ec8eb4-7ada-4983-a79e-29825fd4e547', '8d7ab430-2f9f-49c8-a183-609e77248de1', '2025-01-15', '2025-01-29', 'INSERT', '2025-01-15 11:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `publisher_pk` char(36) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `founded_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_pk`, `name`, `country`, `founded_year`) VALUES
('13a301f5-5324-4beb-b668-50753c3cc137', 'Secker & Warburg', 'United Kingdom', 1935),
('34bd84de-1b26-4ecb-b681-3a191f69df74', 'T. Egerton', 'United Kingdom', 1784),
('9773a68a-8b88-44c6-a69d-0416daff40d8', 'Charles Scribners Sons', 'United States', 1846),
('f0d9e508-0bf0-4038-9463-f1cc0bb04b28', 'J.B. Lippincott & Co.', 'United States', 1836);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_pk` char(36) NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_number`) VALUES
('123e4567-e89b-12d3-a456-426614174000', 'Anna', 'Smith', '1999-09-09', 'anna@example.com', '12344321'),
('2a546aa4-de2d-4dce-8a1d-cb0971673dab', 'Bob', 'Smith', '1985-06-22', 'bob.smith@example.com', '555-5678'),
('36ec8eb4-7ada-4983-a79e-29825fd4e547', 'Mia', 'Thomsen', '1999-02-04', 'mia@thomsen.com', '555-172'),
('46b54f65-e181-464f-8ccb-828f4b3f9d88', 'Alice', 'Johnson', '1990-04-15', 'alice.johnson@example.com', '555-1234'),
('660f4ac9-4ba9-420f-8547-2a6624a44492', 'Carol', 'Williams', '1978-01-30', 'carol.williams@example.com', '555-9101'),
('7852bf19-b77b-4d71-93b5-748880a92ec4', 'David', 'Brown', '1992-11-02', 'david.brown@example.com', '555-1122'),
('d8b1db97-9acc-4ec5-b500-4f8ee153bcdf', 'Emma', 'Davis', '2000-03-25', 'emma.davis@example.com', '555-3344');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_borrowing_history`
-- (See below for the actual view)
--
CREATE TABLE `user_borrowing_history` (
`user_pk` char(36)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`title` varchar(255)
,`publication_year` int
,`borrow_date` date
,`due_date` date
,`return_date` date
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
  ADD PRIMARY KEY (`book_fk`,`author_fk`),
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
