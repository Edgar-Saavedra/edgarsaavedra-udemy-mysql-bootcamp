USE cat_app;

CREATE TABLE employees ( 
  id INT NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  middle_name VARCHAR(100), 
  age INT NOT NULL, 
  current_status VARCHAR(100) NOT NULL DEFAULT 'employed', 
  PRIMARY KEY (id) 
);

INSERT INTO employees(first_name,last_name,age) VALUES('Dora','Smith',58);
INSERT INTO employees(first_name,last_name,age) VALUES('Edgar','Saavedra',100);