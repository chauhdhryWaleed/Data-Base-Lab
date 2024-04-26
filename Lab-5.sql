CREATE TABLE Member (
  member_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL ,
  phone TEXT NOT NULL
);

CREATE TABLE Book (
  book_id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  publisher TEXT NOT NULL,
  price INTEGER NOT NULL,
  category TEXT NOT NULL,
  publication_date DATE
);

CREATE TABLE Borrow (
  id INTEGER PRIMARY KEY,
  book_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  borrow_date DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES Book(book_id),
  FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

---- Insert records for Member table
INSERT INTO Member (member_id, first_name, last_name, email, phone)
VALUES
(101, 'John', 'Doe', 'johndoe@gmail.com', '555-1234'),
(102, 'Jane', 'Doe', 'janedoe@yahoo.com', '555-5678'),
(103, 'Bob', 'Smith', 'bobsmith@hotmail.com', '555-9012'),
(104, 'Alice', 'Johnson', 'alicejohnson@gmail.com', '555-3456'),
(105, 'Tom', 'Wilson', 'tomwilson@yahoo.com', '555-7890');
insert into Member values (106,'Tom','Hanks','hanks@yahoo.com','555-6270');

-- Insert records for Book table
INSERT INTO Book (book_id, title, author, publisher, publication_date, price, category)
VALUES
(101, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '1925-04-10', 12.99, 'Classic'),
(102, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960-07-11', 9.99, 'Classic'),
(103, '1984', 'George Orwell', 'Secker & Warburg', '1949-06-08', 10.99, 'Science Fiction'),
(104, 'The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 'Pan Books', '1979-10-12', 8.99, 'Science Fiction'),
(105, 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003-03-18', 14.99, 'Mystery'),
(106, 'Gone Girl', 'Gillian Flynn', 'Crown', '2012-06-05', 13.99, 'Mystery'),
(107, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Press', '2008-09-14', 11.99, 'Young Adult'),
(108, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury', '1997-06-26', 9.99, 'Young Adult');

-- Insert records for Borrow table
INSERT INTO Borrow (id,member_id, book_id, borrow_date, return_date)
VALUES
(1,101, 101, '2022-01-01', '2022-01-15'),
(2,101, 102, '2022-01-01', '2022-01-15')
insert into borrow values
(12,101, 103, '2022-01-01', '2022-01-15');
insert into borrow values
(13,101, 104, '2022-01-01', '2022-01-15');
insert into borrow values
(14,101, 105, '2022-01-01', '2022-01-15');
insert into borrow values
(15,101, 106, '2022-01-01', '2022-01-15');
insert into borrow values
(16,101, 107, '2022-01-01', '2022-01-15');
insert into borrow values
(17,101, 108, '2022-01-01', '2022-01-15');  
(3,102, 103, '2022-01-01', '2022-01-15'),
(4,102, 104, '2022-01-01', '2022-01-15'),
(5,103, 105, '2022-01-01', '2022-01-15'),
(6,103, 106, '2022-01-01', '2022-01-15'),
(7,104, 107, '2022-01-01', '2022-01-15'),
(8,104, 108, '2022-01-01', '2022-01-15'),
(9,105, 107, '2022-01-01', '2022-01-15'),
(10,105, 108, '2022-01-01', '2022-01-15');
insert into borrow values
(11,105, 108, '2022-02-01', '2022-02-15');

--query 1
select member_id,first_name,email
from Member
where member_id in (select borrow.member_id
                    from Borrow
					)



--query 2

select title
from book
where  book.book_id in (select borrow.book_id
        from borrow join member on member.member_id=borrow.member_id
		where member.email like '%gmail%'
		)


--query 3
select first_name,last_name
from Member
where member.member_id in (select borrow.member_id
from borrow join book on book.book_id=borrow.book_id
where book.category like 'Mystery' and datediff(day,borrow.borrow_date,borrow.return_date)>10)


--query 4

select title
from book join borrow on book.book_id=Borrow.book_id
where borrow.member_id in (select borrow.member_id
from borrow join book on book.book_id=borrow.book_id
where book.category like 'Classic')

--query 5
select title
from book
where book.book_id in (select book.book_id
                       from book join borrow on book.book_id=borrow.book_id
					   group by book.book_id
					   having count(borrow.book_id)>1)

--query 6
select member.first_name,member.last_name,member.phone
from member
where member.member_id in (select borrow.member_id
                           from borrow join book on book.book_id=borrow.book_id
						   where book.price>10)
		
		


--query 7
select member.member_id,count(book_id)
from member left join borrow on member.member_id=borrow.member_id
where member.member_id in (select member.member_id
                         from member left join borrow on member.member_id=borrow.member_id)
group by member.member_id 


--query 8


select title
from book 
where book.book_id in (select borrow.book_id
                           from member join borrow on borrow.member_id=member.member_id
						   where member.last_name like 'D%')

--query 9


select member.first_name,member.last_name
from member
where member.member_id in (select member.member_id
                           from book join borrow on borrow.book_id=book.book_id
						   where book.publication_date<'1990-01-01')


--query 10
select title
from book 
where book.book_id in (select borrow.book_id
                           from member join borrow on borrow.member_id=member.member_id
						   where member.first_name like 'J%' And member.last_name like '%n' )

--query 11


select borrow.member_id
from borrow
where borrow.book_id in (select borrow.book_id
                      from borrow )
group by borrow.member_id,borrow.book_id
having count(borrow.book_id)>1



--query 12
select member.member_id
from member 
where member_id not in (select member.member_id
from member join borrow on borrow.member_id=member.member_id)


--query 13
select book.title,book.book_id
from book
where book.book_id in (select book.book_id 
                       from book join borrow on borrow.book_id=book.book_id)

--query 14

select title
from book 
where book.book_id in (select borrow.book_id
                           from member join borrow on borrow.member_id=member.member_id
						   where member.last_name like 'Doe')


--query 15
select member.member_id
from member
where member.member_id in (select borrow.member_id
                           from   book join borrow on book.book_id =borrow.book_id
						   where borrow.return_date is null)


--query 16


select b.member_id
from borrow as bo join member as b on b.member_id=bo.member_id
group by b.member_id
having count(distinct book_id)=(select distinct count(*)
                               from book)

