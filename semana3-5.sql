#Integrantes:
#JHON WILLIAM MAMANI CONDORI 2020-119018
#GUSTAVO JOAQUIN CALIZAYA LEON 2020-119035
DROP DATABASE IF EXISTS week3; 
CREATE DATABASE week3 CHARACTER SET utf8mb4; 
USE week3;

CREATE TABLE emp(e_id int, nombre varchar(20), gerente varchar(20),
nombre_dept varchar(20), edad int, salario integer, dept_no int);

#3. a. Show that two substring as single string.
SELECT CONCAT(nombre,',',edad) as nombre_edad FROM emp;

#b. List all employee names, salary and 15% rise in salary.
SELECT nombre, salario,  salario*1.15 FROM emp;

#c. Display lowest paid emp details under each manager
SELECT emp.nombre FROM empleado WHERE emp.salario<=(SELECT MIN(emp.salario) FROM emp WHERE emp.gerente='si');

#d. Display the average monthly salary bill for each deptno.
SELECT nombre_dept, AVG(salario) FROM emp
GROUP BY nombre_dept;
#e. Show the average salary for all departments employing more than two people.
SELECT nombre_dept, AVG(salario) FROM emp
GROUP BY nombre_dept
HAVING COUNT(nmbre_dept)>2;

#------------------------
CREATE DATABASE semana4;
USE semana4;
DELIMITER $$
CREATE PROCEDURE proce1(numero INT)
BEGIN
    DECLARE numeroinv, i INT;
    SET i=0;
    SET numeroinv=0;
    WHILE numero>0 DO
        SET numeroinv=numeroinv*10+numero%10;
        SET numero=numero/10;
    END WHILE;
    SELECT numeroinv;
    
END$$
DELIMITER ;

CALL proced1(1234);


#----------------
#week 5
#ejercicio1
#. Write a function to accept employee number as parameter and return Basic +HRA together as single column. 
USE semana5;
DROP TABLE empleado;
CREATE TABLE empleado(
  emp_no INT NOT NULL AUTO_INCREMENT,
  emane VARCHAR(20) NULL,
  job VARCHAR(20) NULL,
  mgr INT NULL,
  sal INT NULL,
  base FLOAT,
  hra FLOAT,
  año INT,
  PRIMARY KEY (emp_no));
INSERT INTO empleado(emp_no, sal, base, hra, año) VALUES (1, 2100, 23, 30, 21);
INSERT INTO empleado(emp_no, sal, base, hra, año) VALUES (2, 2100, 23, 30, 10);
INSERT INTO empleado(emp_no, sal, base, hra, año) VALUES (3, 2100, 23, 30, 5);
DELIMITER $$
CREATE FUNCTION suma(base FLOAT, hra FLOAT) RETURNS float
DETERMINISTIC
BEGIN
    DECLARE sum FLOAT;
    SET sum = base+hra;
    RETURN sum;
END$$
DELIMITER ;
SELECT suma(base, hra) AS suma FROM empleado;

#ejercicio2
#Accept year as parameter and write a Function to return the total net salary spent for a given year. 
DELIMITER $$
CREATE FUNCTION salario(año1 INT) RETURNS float
DETERMINISTIC
BEGIN
    DECLARE sal FLOAT;
    SET sal=(SELECT sal FROM empleado WHERE año=año1);
    RETURN sal;
END$$
DELIMITER ;
SELECT sal(año) FROM empleado;
#ejercicio3
#. Create a function to find the factorial of a given number and hence find NCR. 
DELIMITER $$
CREATE FUNCTION factorial(numero INT) RETURNS float
DETERMINISTIC
BEGIN
    DECLARE i INT;
    SET i=1;
    WHILE numero>=1 DO
       SET i=numero*i;
       SET numero=numero-1;
    END WHILE;
    RETURN i;
END$$
DELIMITER ;
SELECT factorial(5) AS factorial;
#ejercicio4
#Write a PL/SQL block o pint prime Fibonacci series using local functions. 
DELIMITER $$
CREATE FUNCTION fibonacci(numero INT) RETURNS float
DETERMINISTIC
BEGIN
    DECLARE i INT;
    DECLARE f1, f2 INT;
    SET i=2, f1=1, f2=1;
    WHILE i<=numero DO
       SET i=i+1;
       SET f2=f1+f2;
       SET f1=f2-f1;
    END WHILE;
    RETURN f2;
END$$
DELIMITER ;
SELECT fibonacci(5);
#ejercicio5
#Create a procedure to find the lucky number of a given birth date. 
DELIMITER $$
CREATE FUNCTION num_suerte(d INT, m INT, a INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE s INT;
    SET s=0;
    IF d<10 THEN
	   SET s=d;
	ELSE
       SET s=(d/10)+d%10;
	END IF;
    IF m<10 THEN
	   SET s=s+m;
	ELSE
       SET s=s+(m/10)+d%10;
	END IF;
    WHILE a>0 DO
       SET s=s+s%10;
       SET a=a/10;
    END WHILE;
    RETURN s;
END$$
DELIMITER ;
SELECT num_suerte(5, 10, 1985);
#ejercicio 6.
#Create function to the reverse of given number
CREATE TABLE inv(
    numero INT NULL,
    numinverso INT NULL
);
DELIMITER $$
CREATE PROCEDURE inverso(IN numero INT)
DETERMINISTIC
BEGIN
    DECLARE numero1 INT;
    DECLARE numinverso INT;
    DECLARE resto INT;
    SET numinverso=0;
    SET numero1=numero;
    WHILE numero>0 DO
        SET resto=numero%10;
        SET numero=numero%10;
        SET numinverso=numinverso*10+resto;
    END WHILE;
    INSERT INTO inv(numero, numinverso) VALUES (numero, numinverso);
    SELECT * FROM inv;
END $$
DELIMITER ;
CALL inverso(1234);

