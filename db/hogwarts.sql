-- require ('pry')

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;



CREATE TABLE houses (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);


CREATE TABLE students (
id SERIAL4 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
house VARCHAR(255),
age INT4
);

ALTER TABLE students ADD house_id INT4;

ALTER TABLE students ADD FOREIGN KEY (house_id) REFERENCES houses(id);

ALTER TABLE students DROP COLUMN house;
