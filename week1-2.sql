#Integrantes:
#JHON WILLIAM MAMANI CONDORI 2020-119018
#GUSTAVO JOAQUIN CALIZAYA LEON 2020-119035

CREATE DATABASE week1_2;
USE practica1;
#week1
#. Create a table called Employee with the following structure
CREATE TABLE empleado(
  emp_no INT NOT NULL AUTO_INCREMENT,
  emane VARCHAR(20) NULL,
  job VARCHAR(20) NULL,
  mgr INT NULL,
  sal INT NULL,
  PRIMARY KEY (emp_no));
#a. Add a column commission with domain to the Employee table.
ALTER TABLE empleado ADD comision INT NULL;
#b. Insert any five records into the table.
INSERT INTO empleado (comision) VALUES (12);
INSERT INTO empleado (comision) VALUES (13);
INSERT INTO empleado (comision) VALUES (14);
INSERT INTO empleado (comision) VALUES (15);
INSERT INTO empleado (comision) VALUES (16);
SELECT * FROM empleado;
#c. Update the column details of job
UPDATE empleado SET job='job1' WHERE emp_no=1;
#d. Rename the column of Employ table using alter command.
ALTER TABLE empleado RENAME COLUMN job TO job_1;
#e. Delete the employee whose empno is 19. 
DELETE FROM empleado WHERE emp_no=5;
SELECT * FROM empleado;

#2. Create department table with the following structure. 
CREATE TABLE departamento(
  dep_no INT NOT NULL AUTO_INCREMENT,
  depname VARCHAR (20) NULL,
  location VARCHAR(20) NULL,
PRIMARY KEY (dep_no));
#a. Add column designation to the department table.
ALTER TABLE departamento ADD designation INT NULL;
#b. Insert values into the table.
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (1, 'nombre1', 'location1', 1);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (2, 'nombre2', 'location1', 2);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (3, 'nombre3', 'location1', 3);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (4, 'nombre4', 'location1', 4);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (5, 'nombre5', 'location1', 5);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (6, 'nombre6', 'location1', 6);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (7, 'nombre7', 'location1', 7);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (8, 'nombre8', 'location1', 8);
INSERT INTO departamento (dep_no, depname, location, designation) VALUES (9, 'nombre9', 'location1', 9);
#c. List the records of emp table grouped by deptno.
SELECT dep_no FROM departamento GROUP BY dep_no;
#d. Update the record where deptno is 9.
UPDATE departamento SET depname='depname1' WHERE dep_no=9;
#e. Delete any column data from the table. 
DELETE depname FROM departamento WHERE dep_no=4;
#3. Create a table called Customer table 
CREATE TABLE customer (
   custname VARCHAR(20),
   custstreet VARCHAR(20),
   custcity VARCHAR(20));
#a. Insert records into the table.
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
INSERT INTO customer (custname, custstreet, custcity) VALUES ('custaname1', 'custstreet', 'custcity');
#b. Add salary column to the table.
ALTER TABLE customer ADD salary INT NULL;
#c. Alter the table column domain.
#d. Drop salary column of the customer table.
ALTER TABLE customer DROP COLUMN salary;
#e. Delete the rows of customer table whose cust_city is 
DELETE custmane FROM customer WHERE custcity='hyde';

#4. Create a table called sailor table 
CREATE TABLE sailor(
   sid INT NOT NULL,
   sname VARCHAR(20) NULL,
   rating VARCHAR(20) NULL,
   PRIMARY KEY (sid));
#a. Add column age to the sailor table. 
ALTER TABLE sailor ADD age INT NULL;
#b. Insert values into the sailor table. 
INSERT INTO sailor (sid, sname, rating) VALUES (1, 'sname1', 'rating');
INSERT INTO sailor (sid, sname, rating) VALUES (2, 'sname1', 'rating');
INSERT INTO sailor (sid, sname, rating) VALUES (3, 'sname1', 'rating');
INSERT INTO sailor (sid, sname, rating) VALUES (4, 'sname1', 'rating');
INSERT INTO sailor (sid, sname, rating) VALUES (5, 'sname1', 'rating');
INSERT INTO sailor (sid, sname, rating) VALUES (6, 'sname1', 'rating');
#c. Delete the row with rating >8. 
DELETE FROM sailor WHERE sid>8;
#d. Update the column details of sailor. 
#e. Insert null values into the table. 
INSERT INTO sailor (sid, sname, rating) VALUES (7, NULL, NULL);

#5. Create a table called reserves table 
CREATE TABLE reserve (
   boat_id INTEGER NOT NULL,
   sid INTEGER,
   day INTEGER,
   PRIMARY KEY (boat_id));
#a. Insert values into the reserves table.
INSERT INTO reserve (boat_id, sid, day) VALUES (1, 2, 10);
INSERT INTO reserve (boat_id, sid, day) VALUES (2, 3, 11);
INSERT INTO reserve (boat_id, sid, day) VALUES (3, 4, 12);
INSERT INTO reserve (boat_id, sid, day) VALUES (4, 5, 13);
INSERT INTO reserve (boat_id, sid, day) VALUES (5, 6, 14);
#b. Add column time to the reserves table.
ALTER TABLE reserve ADD COLUMN time INTEGER;

#c. Alter the column day data type to date.
ALTER TABLE reserve MODIFY day INT NULL;
#d. Drop the column time in the table.
ALTER TABLE reserve DROP time;
#e. Delete the row of the table with some condition. 
DELETE FROM reserve WHERE boat_id=2;

/----------------
#week 2
#ejercicio1
# a. Create a user and grant all permissions to the user.
#b. Insert the any three records in the employee table and use rollback. Check the result.
#c. Add primary key constraint and not null constraint to the employee table.
#d. Insert null values to the employee table and verify the result
CREATE USER 'user'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';

SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO empleado (emp_no, emane) VALUES (7, 'ename1');
INSERT INTO empleado (emp_no, emane) VALUES (8, 'ename1');
INSERT INTO empleado (emp_no, emane) VALUES (9, 'ename1');
SELECT * FROM empleado;
ROLLBACK;
ALTER TABLE empleado MODIFY emp_no INTEGER ;
ALTER TABLE empleado MODIFY emane VARCHAR (40) NOT NULL;
INSERT INTO empleado (emp_no, emane) VALUES (10, 'ename1');
INSERT INTO empleado (emp_no, emane) VALUES (11, 'ename1');
INSERT INTO empleado (emp_no, emane) VALUES (12, 'ename1');

#ejercicio2
# a. Create a user and grant all permissions to the user.
#b. Insert values in the department table and use commit.
#c. Add constraints like unique and not null to the department table.
#d. Insert repeated values and null values into the table. 
CREATE USER 'user1'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost';

SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO departamento (dep_no, depname, location) VALUES (10, 'depname1', 'location1');
INSERT INTO departamento (dep_no, depname, location) VALUES (11, 'depname1', 'location1');
INSERT INTO departamento (dep_no, depname, location) VALUES (12, 'depname1', 'location1');
SELECT * FROM departamento;
COMMIT;
DELETE FROM departamento WHERE dep_no IN (10,11,12);

#ejercicio3
# a. Create a user and grant all permissions to the user.
#b. Insert values into the table and use commit. 
#c. Delete any three records in the department table and use rollback.
#d. Add constraint primary key and foreign key to the table. 
CREATE USER 'user2'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user2'@'localhost';

SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO departamento (dep_no, depname, location) VALUES (10, 'depname1', 'location1');
INSERT INTO departamento (dep_no, depname, location) VALUES (11, 'depname1', 'location1');
INSERT INTO departamento (dep_no, depname, location) VALUES (12, 'depname1', 'location1');
SELECT * FROM departamento;
COMMIT;
DELETE FROM departamento WHERE dep_no IN (10,11,12);
ROLLBACK;

#ejercicio4
# a. Create a user and grant all permissions to the user.
#. Insert records in the sailor table and use commit.
#c. Add save point after insertion of records and verify save point.
#d. Add constraints not null and primary key to the sailor table.

CREATE USER 'user3'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user3'@'localhost';
SET AUTOCOMMIT=0;
START TRANSACTION;
INSERT INTO sailor (sid, sname, rating) VALUES (10, 'saname', 'rating1');
INSERT INTO sailor (sid, sname, rating) VALUES (11, 'saname', 'rating1');
INSERT INTO sailor (sid, sname, rating) VALUES (12, 'saname', 'rating1');
COMMIT;
SELECT * FROM sailor;
DELETE FROM sailor WHERE dep_no IN (10,11,12);
ROLLBACK;
ALTER TABLE sailor MODIFY sid INT NOT NULL;
#ejercicio5
#a. Create a user and grant all permissions to the user.
#b. Use revoke command to remove user permissions.
#c. Change password of the user created.
#d. Add constraint foreign key and not null. 
CREATE USER 'user3'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user3'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user3'@'localhost';
UPDATE USER SET PASSWORD=PASSWORD('12345') WHERE USER='user3';
SET PASSWORD FOR 'user3'@'localhost'=PASSWORD('gustavo');
SET AUTOCOMMIT=0;
#ejercicio6
# a. Create a user and grant all permissions to the user.
#b. Update the table reserves and use savepoint and rollback.
#c. Add constraint primary key , foreign key and not null to the reserves table
#d. Delete constraint not null to the table column
CREATE USER 'user4'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'user4'@'localhost';
SET AUTOCOMMIT=0;
START TRANSACTION;
UPDATE reserve SET sid=1232 WHERE boat_id=2;
COMMIT;
ROLLBACK;