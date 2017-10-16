# edgarsaavedra-udemy-mysql-bootcamp
A sql udemy course.

|Title | Description|
|-|-|
| [Intro](#v-4) | Simple sql commands |
| [What is](#v-8)| what is sql |
| [Instillation](#v-10) | Installing |
| [Basic Commnands](#v-17) |help; show databases|

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

<h2 id="v-19"></h2>