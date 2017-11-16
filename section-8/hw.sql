DROP DATABASE udemy_mysql_bootcamp_books_app;
CREATE DATABASE udemy_mysql_bootcamp_books_app;

use udemy_mysql_bootcamp_books_app;
select database();
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title,author_fname,author_lname,released_year,stock_quantity,pages) 
    VALUES ('10% Happier','Dan','Harris',2014,29,256),
    ('fake_book','Freida','Harris',2001,287,428),
    ('Licoln In The Barrio','George','Saunders',2017,1000,367),
    ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
    ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
    ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
    ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
    ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
    ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
    ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
    ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
    ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
    ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
    ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
    ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
    ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
    ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
    ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
    ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

\! echo  "/*****************************************************/" ;
\! echo  " -- SELECT ALL STORY COLLECTIONS" ;
-- \! echo  " \SELECT title FROM books WHERE title LIKE  %stories% ; ";
\! echo  "/*****************************************************/" ;   
SELECT title FROM books WHERE title LIKE '%stories%';

\! echo  "/*****************************************************/" ;
\! echo  " -- Find longes book" ;
\! echo  "/*****************************************************/" ;   
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;


\! echo  "/*****************************************************/" ;
\! echo  " -- PRINT SUMMARY , with 3 of most recent books" ;
\! echo  "/*****************************************************/" ; 
SELECT CONCAT(title,' - ',released_year) FROM books ORDER BY released_year DESC LIMIT 3;

\! echo  "/*****************************************************/" ;
\! echo  " -- Find all books white author name that contains a space" ;
\! echo  "/*****************************************************/" ; 
SELECT title,author_lname FROM books WHERE author_lname LIKE '% %';


\! echo  "/*****************************************************/" ;
\! echo  " -- FIND 3 books with the lowest stock" ;
\! echo  "/*****************************************************/" ; 
SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity ASC, released_year DESC  LIMIT 3;



\! echo  "/*****************************************************/" ;
\! echo  " -- print title and author lastname sorted by author last name then by title" ;
\! echo  "/*****************************************************/" ; 
SELECT title,author_lname FROM books ORDER BY author_lname, title;


\! echo  "/*****************************************************/" ;
\! echo  " -- YELL" ;
\! echo  "/*****************************************************/" ; 
SELECT CONCAT('MY FAVORITE AUTHOR IS ',author_fname,' ',author_lname,'!') as Yell FROM books ORDER BY author_lname;