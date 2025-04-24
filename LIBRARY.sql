CREATE DATABASE `Labrary`
CREATE TABLE `Books`(
BookID INT AUTO_INCREMENT Primary Key,
Title VARCHAR(250) NOT NULL,
Author VARCHAR(250) NOT NULL,
Genre VARCHAR(250) ,
Availability BOOLEAN DEFAULT TRUE
); 
CREATE TABLE `Members`(
MemberID INT AUTO_INCREMENT PRIMARY KEY,
Member_Name VARCHAR(100) NOT NULL,
Contact VARCHAR(15),
MembershipDate DATE NOT NULL
);
CREATE TABLE `Transactions` (
TransactionID INT AUTO_INCREMENT PRIMARY KEY,
BookID INT,
MemberID INT,
IssueDate DATE NOT NULL,
ReturnDate DATE ,
FOREIGN KEY (BookID) REFERENCES Books(BookID),
FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO `Books`(Title, Author, Genre, Availability)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', TRUE),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', TRUE),
('1984', 'George Orwell', 'Dystopian', TRUE);

INSERT INTO `Members` (Member_Name, Contact, MembershipDate) VALUES
('John Doe', '1234567890', '2024-01-01'),
('Jane Smith', '9876543210', '2024-02-15');

INSERT INTO Transactions (BookID, MemberID, IssueDate) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-12-05');
