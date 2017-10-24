#CREATE
-- \! echo "\n*********************************************";
-- \! echo "use cat_app;";
-- \! echo "*********************************************\n";
use cat_app;
# delete cat table

-- \! echo "\n*********************************************";
-- \! echo "DROP TABLE cats";
-- \! echo "*********************************************\n";
DROP TABLE cats;

-- \! echo "\n*********************************************";
-- \! echo "CREATE TABLE cats";
-- \! echo "*********************************************\n";
#create cat table
CREATE TABLE cats (
  cat_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT,
  PRIMARY KEY (cat_id)
);

-- \! echo "\n*********************************************";
-- \! echo "DESC cats;";
-- \! echo "*********************************************\n";
DESC cats;

INSERT INTO cats(name,breed,age) values
('Ringo','Tabby',4)
,('Cindy','Maine Coon',10)
,('Dumbledore', 'Maine Coon',11)
,('Egg','Persian',4)
,('Misty','Tabby',13)
,('George Michael','Ragdoll',9)
,('Jackson','Sphynx',7);

\! echo "\n********************************************* ";
\! echo "SELECT * FROM cats ... ";
\! echo "*********************************************\n";
SELECT * FROM cats;

# Getting data from columns

\! echo "\n********************************************* ";
\! echo "SELECT name FROM cats ... ";
\! echo "*********************************************\n";
SELECT name FROM cats;

\! echo "\n********************************************* ";
\! echo "SELECT name,name FROM cats ... ";
\! echo "*********************************************\n";
SELECT age,name FROM cats;


\! echo "\n********************************************* ";
\! echo "SELECT * FROM cats WHERE age=4 ";
\! echo "*********************************************\n";
SELECT * FROM cats WHERE age=4;


\! echo "\n********************************************* ";
\! echo "SELECT * FROM cats WHERE name='Egg' ";
\! echo "*********************************************\n";
SELECT * FROM cats WHERE name='Egg';

\! echo "\n********************************************* ";
\! echo "SELECT cat_id FROM cats";
\! echo "*********************************************\n";
SELECT cat_id FROM cats;
\! echo "\n********************************************* ";
\! echo "SELECT name,breed FROM cats";
\! echo "*********************************************\n";
SELECT name,breed FROM cats;

\! echo "\n********************************************* ";
\! echo "SELECT name,age FROM cats WHERE breed='Tabby' ";
\! echo "*********************************************\n";
SELECT name,age FROM cats WHERE breed='Tabby';

\! echo "\n********************************************* ";
\! echo "SELECT cat_id,age FROM cats WHERE cat_id=age";
\! echo "*********************************************\n";
SELECT cat_id,age FROM cats WHERE cat_id=age;

\! echo "\n********************************************* ";
\! echo "SELECT cat_id AS id, name FROM cats; # using aliases";
\! echo "*********************************************\n";
SELECT cat_id AS id, name, breed FROM cats;

\! echo "\n********************************************* ";
\! echo "UPDATE cats SET breed='Shorthair' WHERE id=1";
\! echo "*********************************************\n";
UPDATE cats SET breed='Shorthair' WHERE cat_id=1;
UPDATE cats SET name='Jack' where name='Jackson';
UPDATE cats set breed='British Shorthair' where name='Ringo';
UPDATE cats set age=12 where breed='Maine Coon';  

\! echo "\n********************************************* ";
\! echo "SELECT cat_id AS id, name FROM cats; # using aliases";
\! echo "*********************************************\n";
SELECT cat_id AS id, name, breed, age FROM cats;


\! echo "\n********************************************* ";
\! echo "DELETE FROM cats WHERE name='Egg'";
\! echo "*********************************************\n";
DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats;
DELETE FROM cats WHERE age=4;
SELECT * FROM cats;
DELETE FROM cats WHERE age=cat_id;
SELECT * FROM cats;
DELETE FROM cats;
SELECT * FROM cats;