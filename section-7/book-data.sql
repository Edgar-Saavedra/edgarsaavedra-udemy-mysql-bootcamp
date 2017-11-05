DROP DATABASE books_app;
CREATE DATABASE books_app;

use books_app;
SELECT database();
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

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
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

-- SHOW TABLES;
SELECT CONCAT(author_fname,' ',author_lname) FROM books;
SELECT CONCAT(author_fname,' ',author_lname) AS 'full name' FROM books;
SELECT author_fname AS first, author_lname AS last, CONCAT(author_fname,' ',author_lname) AS full
			 FROM books;
SELECT CONCAT_WS(' - ', title, author_fname, author_lname) from books;

SELECT SUBSTRING(title,1,10) AS 'SHORT TITLE' FROM books;
SELECT CONCAT(
	SUBSTRING(title,1,10),
	'...') 
	AS 'SHORT TITLE 2'
	FROM books;

SELECT REPLACE(title, 'e', 3) AS 'Replaced' FROM books;

SELECT SUBSTRING(
	REPLACE(
		title,'e','X')
		,1,10) 
	AS 'Sub of Replace'	FROM books;

SELECT REVERSE('meow meow');
SELECT REVERSE(
	author_fname
) FROM books;

SELECT CONCAT(author_fname,REVERSE(author_fname)) AS 'Palamdrome' FROM books;
SELECT CHAR_LENGTH('hello world');

SELECT author_lname AS 'lname', CHAR_LENGTH(author_fname) AS 'lenght' FROM books;

SELECT CONCAT(
		author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long'
) FROM books;

SELECT UPPER(title) FROM books;
SELECT CONCAT(
	'MY FAVORITE BOOK IS ',
	UPPER(title)
) FROM books;

\! echo  "/*****************************************************/" ;
\! echo  " -- STRING FUNCTION CHALLANGE" ;
\! echo  "/*****************************************************/" ;

\! echo "1";
SELECT UPPER(
	REVERSE('Why does my cat look at me with such hatred?')
);
\! echo "\n2";
SELECT REPLACE(
	CONCAT('I',' ','like',' ','cats'),' ','-'
);

\! echo "\n3";
SELECT REPLACE(
	title,' ','->'
) AS title FROM books;

\! echo "\n4";
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;


\! echo "\n5";
SELECT UPPER(CONCAT(author_fname,' ',author_lname)) AS 'full name in caps' FROM books;

\! echo "\n6";
SELECT CONCAT(title,' was released in ',released_year) AS 'blurb' FROM books;

\! echo "\n7";
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;


\! echo "\n8";
SELECT CONCAT(SUBSTRING(title,1,10),'...') AS "Short title", 
	CONCAT(author_lname,',',author_fname) AS 'author', 
	CONCAT(stock_quantity,' in stock') AS 'Quantity' 
from books; 
