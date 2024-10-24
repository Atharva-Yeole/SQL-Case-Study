create database lib;
use lib;

create table books(book_id int Primary Key,
                    title varchar(20),
                    author varchar(20),
                    genre varchar(20),
					publication_year date,
                    available_copie int);
                    
insert into books values (001, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1999-12-01', 25),
(002, 'To Kill a bird', 'Harper Lee', 'Fiction','1999-01-01', 50),
(003, '1984', 'George Orwell', 'Dystopian', '1950-10-01', 30),
(004, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1999-10-01', 40),
(005, 'The Catcher in Rye', 'J.D. Salinger', 'Classic', '1999-08-01', 35),
(006, 'The Girl with Tattoo', 'Stieg Larsson', 'Mystery', '1950-04-01', 20),
(007, 'Gone Girl', 'Gillian Flynn', 'Mystery', '1949-12-01', 15),
(008, 'The Da Vinci Code', 'Dan Brown', 'Thriller', '1999-12-01', 18),
(009, 'The Hunger Games', 'Suzanne Collins', 'Young Adult', '1990-10-01', 45),
(010, 'The Road', 'Cormac McCarthy', 'Post-apocalyptic', '1995-09-15', 22);

create table Members( member_id int Primary Key,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(50),
 phone bigint(30));
 
 INSERT INTO Members VALUES
(101, 'John', 'Doe', 'johndoe@example.com', 1234567890),
(102, 'Jane', 'Smith', 'janesmith@example.com', 987543210),
(103, 'Alice', 'Johnson', 'alicejohnson@example.com', 5551234567),
(104, 'Bob', 'Brown', 'bobbrown@example.com', 7778889999),
(105, 'Emily', 'Davis', 'emilydavis@example.com', 4445556666);

create table Loans( loan_id int Primary Key, 
member_id int,Foreign Key(member_id) references Members(member_id),
book_id int ,Foreign Key(book_id) references books(book_id),
loan_date date,
due_date date,
returned Bool);

INSERT INTO Loans (loan_id, member_id, book_id, loan_date, due_date, returned) VALUES
(1, 101, 1, '2024-05-01', '2024-05-15', FALSE),
(2, 102, 2, '2024-05-03', '2024-05-17', TRUE),
(3, 103, 3, '2024-05-05', '2024-05-19', FALSE),
(4, 104, 4, '2024-05-07', '2024-05-21', TRUE),
(5, 101, 2, '2024-05-10', '2024-05-24', FALSE);

select * from books;
select * from members;
select * from loans;

--  1. Retrieve all books in the "Mystery" genre.
select * from books where genre='Mystery';
select genre,title from books group by genre,title having genre='Mystery';

-- 2. List all members who have borrowed books currently overdue.
select members.first_name, members.last_name from members 
inner join loans on members.member_id = loans.member_id 
where loans.due_date > loans.loan_date and loans.returned=0;

-- 3. Calculate the total number of books borrowed by each member.
select members.member_id, members.first_name, members.last_name, count(loans.loan_id) 
from Members left join loans on members.member_id = loans.member_id 
group by members.member_id, members.first_name, members.last_name;

-- 4. Update the loan status for a specific book when it is returned.
update loans set returned=1 where book_id=1 and member_id=101;
select * from loans;