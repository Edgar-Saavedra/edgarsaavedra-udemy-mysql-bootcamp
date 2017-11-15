# edgarsaavedra-udemy-mysql-bootcamp
A sql udemy course.

|Title | Description|
|-|-|
| [Intro](#v-4) | Simple sql commands |
| [What is](#v-8)| what is sql |
| [Instillation](#v-10) | Installing |
| [Basic Commnands](#v-17) |help; show databases|
| [Using Tables](#sec-3) | create, destroy tables and add columns |
| [Inserting Data](#sec-4) | Inserting values, SELECT |
| [CRUD](#sec-5) ||
| [STRING FUNCTIONS](#sec-7) ||
| [Advanced SELECT](#sec-8) ||
<h2 id="v-4">Intro</h1>

- `SELECT * FROM tableName ;` Will retrive all rows in a table.
- [Try it sql editor](https://www.w3schools.com/sql/trysql.asp?filename=trysql_op_or) for testing sql commands online 
- [Lecture slides](http://webdev.slides.com/coltsteele/mysql-109#/) 
- `SELECT * FROM tableName ORDER BY columnName Desc` to get a items in descending order
- `DROP TABLE tableName` to delete a table entirely

<h2 id="v-8">What is a database</h2>

- A database is a collection of data.
- SQL is the language to access datatabes, structure query language.
- Example `Select * from tableName WHERE column >= 18;` get all columns from a table where a column is greater than or equal to a value.
- Relation Databases : MySQL, SQLite, Postgres etc .., all are database management systems
  - There are slight differences in syntax but they are largely the same.
  - Often database management systems offer different features.
    - How secure is one?
    - How fast is ist?
    - How users premissions work?

<h2 id="v-10">Instillation</h2>

- Three options : 
  - Install on pc, install on mac, install on cloud9


<h2 id="v-17">Basic commands</h2>

- `help` give you information about mysql and things like data types
  - you choose a catagory `help data types`
- `show databases` : the current database in the instance of mysql 

<h2 id="v-19">Navigation commands</h2>

- `mysql -u USERNAME -p` to login into mysql
- `CREATE DATABASE name` to create database
- `DROP DATABASE name` to delete/destroy a database
- `USE databaseName` to using a specific database
- `SELECT database()` to see what what database we are using


<h2 id="sec-3">Tables</h2>

- Database is a bunch of tables, in a relational db, tables hold data;
- COLUMNS = INFORMATION TYPE
- Rows = DATA
- DATA TYPES , not all are used only use some and switch out
  - Numeric Types
    - INT (most used), max of 4,294,967,295
    - SMALLINT
    - TINYINT
    - MEDIUMINT
    - BIGINT
    - DECIMAL
    - NUMERIC
    - FLOAT
    - DOUBLE
    - BIT
  - STRING TYPES
    - CHAR
    - VARCHAR (Most used), allows 1 - 255 characters.
      - We set up like using `varchar(100)` 100 in this chase is how many characters
      - Example: `varchar(15)`, `varchar(140)`
    - BINARY
    - VARBINARY
    - BLOB
    - TINYBLOB
    - MEDIUMBLOB
    - LOGNBLOB
    - TEXT
    - TINYTEXT
    - MEDIUMTEXT
    - LONGTEXT
    - ENUM
  - DATE TYPES
    - DATE
    - DATETIME
    - TIMESTAMP
    - TIME
    - YEAR 
- Implementing tables using datatypes
  - ```sql
    CREATE TABLE tablename 
    (
      column_name data_type,
      column_name data_type
    );
    ```
  - `create database cat_app;`  
  - `use cat_app;`
  - ```sql
    CREATE TABLE cats 
    (
      name VARCHAR(100),
      age INT 
    );
    ``` 
- `SHOW TABLES` see all tables in db
- `SHOW COLUMNS FROM tableName` see structure in table
- `DESC tableName` same as `SHOW COLUMNS FROM tableName`
- `DROP TABLE tableName` to delete a table in db

<h2 id="sec-4">Inserting data</h2>

- to inset data into table
  - ```sql
    INSERT INTO tableNAME(columnName,columnName) VALUES ('value 1',7);
    ``` 
  - ```sql
    CREATE TABLE cats(name VARCHAR(50),age INT );
    ```
  - ```sql
    INSERT INTO cats(name,age)
    VALUES('blue',1);
    ```
  - ```sql  
    # to insert multiple
    INSTER INTO cats(name,age)
    VALUES ('Charlie',10),
           ('Sadie',3),
           ('Lazy Bear',1);
    ```      
  - To see data, use SELECT: 
    - ```sql
      # to see all data;
      SELECT * FROM cats;
      ```
  - ## Errors
    - `SHOW WARNINGS` will show all errors
    - Passing invalid data type to INT it will add as 0
    - `SHOW WARNINGS` only show for the previous commnad given
      - Programming languages will describe warning.
  - ## NULL column
    - null means an unspecified value
    - null happens by default
    - ```sql
      CREATE TABLE cats2 (
        name VARCHAR(100) NOT NULL,
        age INT NOT NULL
      )
      ```
    - doing something like `insert into cats2(name) values('texas');`
      we will get   `Query OK, 1 row affected, 1 warning (0.00 sec)`
      `> SHOW WARNINGS;` 
      ```
      +---------+------+------------------------------------------+
      | Level   | Code | Message                                  |
      +---------+------+------------------------------------------+
      | Warning | 1364 | Field 'age' doesn't have a default value |
      +---------+------+------------------------------------------+
      1 row in set (0.00 sec)
      ```
    - this is becuase we do not allow null, and we are given a default value of 0 since we didn't specify a default value  
    - ## DEFAULT VALUES
      - ```sql
        CREATE TABLE cats3 (
          name VARCHAR(100) DEFAULT 'unnamed',
          age INT DEFAULT 99
        );
        ```
      - We could do something like `INSERT INTO cats3() VALUES()`
    - ## NOT NULL 
      - ```sql
        CREATE TABLE cats4 (
          name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
          age INT NOT NULL DEFAULT 99
        );
        ```
        -  This will prevent us from doing `insert into cats4(name,age) values(null,null);` and get something like `ERROR 1048 (23000): Column 'name' cannot be null`
    -  ## Primary keys
      -  Primary keys help distinguish between identical data
      -  A way to identify a row
      -  ```sql
        CREATE TABLE unique_cats (
          cat_id INT NOT NULL,
          name VARCHAR(100),
          age INT,
          PRIMARY KEY (cat_id) # < --- 
        );
        ```
      - ## AUTO_INCREMENT
        ```sql
        CREATE TABLE unique_cats2 (
          cat_id INT NOT NULL AUTO_INCREMENT,
          name VARCHAR(100),
          age INT,
          PRIMARY KEY (cat_id)
        );
        ```
        And we can just add to the table without specifying a key value
        AUTO_INCREMENT is added to EXTRAS  
        ```
        +--------+--------------+------+-----+---------+----------------+
        | Field  | Type         | Null | Key | Default | Extra          |
        +--------+--------------+------+-----+---------+----------------+
        | cat_id | int(11)      | NO   | PRI | NULL    | auto_increment |
        | name   | varchar(100) | YES  |     | NULL    |                |
        | age    | int(11)      | YES  |     | NULL    |                |
        +--------+--------------+------+-----+---------+----------------+ 
        ```
      - ## Putting all together
        - ```sql
          CREATE TABLE employes ( 
            id INT NOT NULL AUTO_INCREMENT , #PRIMARY KEY **it can be added here too**,
            last_name VARCHAR(100) NOT NULL,
            first_name VARCHAR(100) NOT NULL,
            middle_name VARCHAR(100), 
            age INT NOT NULL, 
            current_status VARCHAR(100) NOT NULL DEFAULT 'employed', 
            PRIMARY KEY (id) 
          );
          ```  
<h2 id="sec-5">CRUD</h2>

- NOTE : never name column as `size` this can cause error
- Inserting data INSERT INTO cats(name,age) VALUES('Taco',14);
- ## CREATE (C):
  - ```sql
    use cat_app;
    # delete cat table
    DROP TABLE cats;

    #create cat table
    CREATE TABLE cats (
      cat_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(100),
      breed VARCHAR(100),
      age INT,
      PRIMARY KEY (cat_id)
    );

    DESC cats;

    INSERT INTO cats(name,breed,age) values
    ('Ringo','Tabby',4)
    ,('Cindy','Maine Coon',10)
    ,('Dumbledore', 'Maine Coon',11)
    ,('Egg','Persian',4)
    ,('Misty','Tabby',13)
    ,('George Michael','Ragdoll',9)
    ,('Jackson','Sphynx',7);

    SELECT * FROM cats;
    ```
  - ## READ (R)
    - `SELECT` clause
      - To retrieve use  `SELECT`
      - `*` means get everything : `SELECT * FROM cats`
      - We specify which columns we want
        - `SELECT name FROM cats` , `SELECT age FROM cats`  
      - We can select multiple columns `SELECT cat_id,age,name FROM cats`
        - The order matters, `SELECT *` will show us our columns in the order we created it.
    - THE `WHERE` clause:
      - `SELECT * FROM cats WHERE age=4;`
        - This will only select data where age  is 4
      - Column descriptions in `WHERE` clauses are case in-sensitive 
        - `SELECT * FROM cats WHERE name='Egg';` is the same as `SELECT * FROM cats WHERE name='EGG';`
      - To get columns that are the same: `SELECT cat_id,age FROM cats WHERE cat_id=age;`  
    - ## Aliases
      - Allow us to use different identifiers for columns, this is really useful when joining tables
  - ## Update (U)
    - `UPDATE cats SET breed='Shorthair' WHERE id=1`;
    - always run a select before running update (withouth the update or set)
      - `SELECT * FROM cats WHERE id=1`;
      - `UPDATE cats SET breed='Shorthair' WHERE id=1`;
  - ## Delete (D)
    - `DELETE FROM cats WHERE name='Egg'` : delete all cats who's name is egg
      - it is really important to do a select
      - primary keys are never changed
    - `DELETE FROM cats` : this deletes all entries;
  - MODIFY table 
      - `ALTER TABLE cats CHANGE username user_name VARCHAR(30)`
      - `ALTER TABLE users ADD email VARCHAR(100) AFTER username;`
      - `ALTER TABLE users DROP email`
  - Functions
    - `NOW()` to get date
    - `IN()` This is useful for matching multiple values.
      - `SELECT * FROM users WHERE created_date IN('monday','tuesday')`
    - `LIKE` This allows you to do wildcard searches.
      - `SELECT * FROM users WHERE email LIKE  '%tuts%';`
    - `ORDER BY Clause` If you want the results to be returned in a specific order, use this clause:
      - `SELECT * FROM users ORDER BY created_date DESC`
    - `LIMIT ... OFFSET ...` You can limit the number of returned results.
      - LIMIT 2 just gets the first 2 results. LIMIT 1 OFFSET 2 gets 1 result, after the first 2 results. LIMIT 2, 1 means the same thing, but note that the first number is the offset and the second number is the limit.
      - `SELECT * FROM users LIMIT 2, 1`

<h2 id="sec-7">STRING FUNCTIONS</h2>

  - `mysql> source FILENAME` will import a file
  - [string functions](https://dev.mysql.com/doc/refman/5.7/en/string-functions.html)
  - Functions 
    - concat
      - `SELECT CONCAT(x,y,z ... n )` you can combine columns
      - `SELECT CONCAT(col1, ' ',col2)`
      - `SELECT CONCAT('hello','world');`
      - ```sql
        SELECT CONCAT(author_fname,' ',author_lname) FROM books;
        SELECT CONCAT(author_fname,' ',author_lname) AS 'full name' FROM books;
        SELECT author_fname AS first, author_lname AS last, CONCAT(author_fname,' ',author_lname) AS full
              FROM books;
        ```
    -  `CONCAT_WS` : to concat with patterns
      - `SELECT CONCAT_WS(' - ', title, author_fname, author_lname) from books;`
    - SUBSTRING : allows to select portions of a string.
      - `SELECT STUBSTRING('HELLO WORLD'1,4);` // indecies start at 1 in my mysql
      - `SELECT SUBSTRING('Hello World',7);` // returns world
      - Giving a negative, starts from end to end
        - `SELECT STRING('Hello World',-3);` // rld
        - `SELECT STRING('Hello World',-7);` // o World
      - to print out first 10 caracaters of every title
        - `SELECT SUBSTRING(title,1,10) AS 'SHORT TITLE' FROM books;` # notice how we pass the table column to function
        - we can use `SUBSTR()` instead of `SUBSTRING()`
      - We can combine string funcs.
        - ```sql 
          SELECT CONCAT(
          SUBSTRING(title,1,10),
          '...') 
          AS 'SHORT TITLE 2'
          FROM books;```
    - REPLACE : replaces parts of a string, and is case sensative
      - `SELECT REPLACE('HELLO WORDL','HELL','@#@#$')`
      - `SELECT REPLACE('chees brea',' ',' and ');`
    - REVERSE : reverses string
      - `SELECT REPLACE('Hello World')`
    - CHAR_LENGTH : tells how many characters in a string
        - `SELECT CHAR_LENGHT('hello world')` // 11
    - UPPER() and LOWER() : change the case of a string
      - `SELECT UPPER('Hello world')` // HELLO WORLD
      - `SELECT LOWER('Hello world')` // hello world


<h2 id="sec-8">Advanced Select, sorting</h2>  

  -  `DISTINCT` 
    - We use with `SELECT` it will give us unique titles
    - Comes right after SELECT 
    - EXAMPLE : `SELECT DISTINCT author_lname FROM books`
    - We can refine `DISTINCT` using `CONCAT`
      - `SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;`
    - We can refine using combining columns
      - `SELECT DISTINCT author_fname,author_lname FROM books;`
      - NOTE : this will take into account ALL columns
  - `ORDER BY`
    - Used to sort the data, in default it list things in ascending order
      - ORDER BY last name `SELECT author_lname FROM books ORDER BY author_lname;`
      - `SELECT title FROM books ORDER BY title`
    - `DESC` and `ASC` are usde to order decending or ascending
      - `SELECT author_lname FROM books ORDER BY author_lname DESC;`
      - numbers workd the same 
        - `SELECT released_year FROM books ORDER BY release_year;`
      - multiple columns wont cuase any issues 
        - `SELECT title,released_year,pages FROM books ORDER BY released_year DESC;`
    - Quirk : `SELECT title, author_fname, author_lname FROM books ORDER BY 2;`
      - The 2 in this case means the second column "author_name", the second thing we are selecting
    - We can order by two columns:
      - `SELECT author_fname, author_lname FROM books ORDER BY author_fname, author_lname;`
      - This says: "get author name and last name from books and order FIRST by first name and THEN by Last Name
  - `LIMIT`
    - Allows us to give us a number
      - LIMIT comes LAST
      - Example : `SELECT title from books LIMIT 3`
    - Most often we use it with `ORDER BY`
      - EXAMPLE : `SELECT title, release_year FROM books ORDER BY release_year DESC LIMIT 5`
      - EXMPALE : `SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 5` 
    - We can specify starting POINT and then how many rows after. The starting point starts at 0.
      - EXAMPLE : `SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,5`
      - We use limit for example in blog sites to show you paginated posts
    - There isn't an elegant way to select from a specify starting POINT to the end of table. You have to do Starting POINT and then some gigantic number
      - EXAMPLE : `SELECT * FROM tbl LIMIT 95, 18446744073709551615;`
  - `LIKE`
    - ALlows to perfomr better searching. 
    - Similar to `WHERE` but allows to do the following
      - "There's a book I am looking for... ; But cant remember the title!; I know the authors first name is David;"
      - EXAMPLE : `SELECT * FROM books WHERE author_fname LIKE '%da%'` 
        - `%` are wild calrds 
        - `%da%` this says "anything before da and anything after da"
      - EXAMPLE : `SELECT * FROM books WHERE author_fname LIKE 'the'`
        - This will look for exactly 'the'
  - `_`
    - An underscore describes a digit
      - EXAMPLE `SELECT * FROM books WHERE sock_quantity LIKE '____'` 
        - Get all books where stock_quantity is 4 digits
      - EXAMPLE `SELECT * FROM numbers WHERE phone LIKE '(__)-(___)-(_____)'` 
  - `\` 
    - Backslash to escape
      - EXAMPLE : `SELECT * FROM books WHERE title LIKE '%\%%'`
        - get everything with a percent sign before and after it.    

<h2 id="additional">Additional resources</h2>

  - [tuts-1](https://code.tutsplus.com/articles/sql-for-beginners-part-2--net-8274)