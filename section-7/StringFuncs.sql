DROP DATABASE cat_app;
CREATE DATABASE cat_app;
use cat_app;

CREATE TABLE cats (
  cat_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  AGE INT,
  PRIMARY KEY(cat_id)
);

INSERT INTO cats(name,AGE) VALUES('Charlie',17);
INSERT INTO cats(name,AGE) VALUES('Connie',10);

SELECT * FROM cats;