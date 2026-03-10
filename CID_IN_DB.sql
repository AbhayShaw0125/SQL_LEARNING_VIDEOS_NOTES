SHOW databases;

CREATE database retail_db;

SELECT database(); 

USE retail_db;

SELECT database();

#####CREATE TABLE###
CREATE TABLE orders(
order_id int ,
order_date datetime,
customer_id int,
order_status varchar(30) 
);


SHOW tables;

SELECT * FROM orders;

INSERT INTO orders VALUES(1,"2013-07-05 00:00:00.0",115,"CLOSED");
INSERT INTO orders VALUES(1,"2013-08-06 ",1115,"PROCESSING");

CREATE TABLE customers(
customer_id int,
customer_fname varchar(20),
customer_lname varchar(20),
customer_email varchar(30),
customer_phone varchar(30),
customer_address varchar(50),
city varchar(20),
state varchar(5),
pincode int
);
INSERT INTO customers VALUES(1,"Akash","Pandey","akashpandey1@gmail.com","+91 897854521","10 DL Roy Street","BANGALORE","KTK",56100);

 
CREATE TABLE order_items(
order_item_id int ,
order_item_order_id int,
product_id int,
quantity int,
total_amount int,
price int
);

SELECT * FROM order_items;
ALTER TABLE order_items MODIFY COLUMN total_amount FLOAT;   
ALTER TABLE order_items MODIFY COLUMN price FLOAT;

INSERT INTO order_items VALUES(1,1,957,1,299.98,299.98);
INSERT INTO order_items VALUES(2,2,1073,1,199.99,199.99);
INSERT INTO order_items VALUES(3,2,502,5,250.0,50.0);
INSERT INTO order_items VALUES(4,2,403,1,129.99,129.99);
INSERT INTO order_items VALUES(5,4,897,2,49.98,24.99);

DESCRIBE order_items;

SELECT * FROM customers;

SELECT * FROM orders;

CREATE VIEW customers_v AS
SELECT customer_fname AS FNAME,customer_lname AS LNAME, customer_address AS CADDR FROM customers;

SELECT * FROM customers_v LIMIT 10;

### Giving access to AnalyticsX #####
CREATE USER 'analyticsx'@'localhost' identified by 'analytics123';

## GRANTING ACCES ##
GRANT SELECT ON retail_db.customers_v TO 'analyticsx'@'localhost';

###REVOKING ACCESS ###
REVOKE SELECT ON retail_db.customers_v FROM 'analyticsx'@'localhost';

GRANT SELECT,DELETE,DROP ON retail_db.orders TO 'analyticsx'@'localhost';

# REVOKE DROP PERMISSION
REVOKE DROP ON retail_db.orders FROM 'analyticsx'@'localhost';


### HOW TO DELETE A USER
DROP USER 'analyticsx'@'localhost';

###DBA 
## CAN DROP/CREATE USER 
## DBA CAN GRANT/REVOKE ACCESS

## HOW TO VIEW WHICH TABLES FALL UNDER VIEW CATEGORY
###STEP 1 USE INFORMATION_SCHEMA AS CATALOGUE
USE information_schema;

SHOW tables;
### FROM ABOVE QUERY YOU CAN SEE A TABLE NAMED TABLES
SELECT * FROM TABLES;
## THE RESULT SHOWS TABLE TYPE 
SELECT * FROM TABLES WHERE table_schema='retail_db';
## THIS ALSO SHOWS TABLE WITH TABLE TYPE VIEW


###TCL - Transaction Control Language
### TWO COMMANDS
### 1.ROLLBACK
### 2.COMMIT

### IF YOU PERFORM DML OPERATION : YOUR TRANSACTION IS IN OPEN STATE
### SO TRANSACTION CAN BE SAVED PERMANENTLY TO DB OR ROLLED BACK
## SUPPOSE YOU DELETED A ROW IN TABLE BUT NOW YOU WANT IT BACK YOU USE TCL
###
###OPEN STATE : CAN BE SAVED FULLY(COMMIT) OR AVOIDED FULLY(ROLLBACK)

## TCL COMMANDS ONLY WORK ON DML AND NOT ON DDL since they are autocommit

##ALSO A CASE : IF YOU PERFORM A DDL :SINCE THEY ARE AUTOCOMMIT IN NATURE YOU CAN'T ROLLBACK

##ALTER COMMANDS
ALTER TABLE orders ADD order_item VARCHAR(20);
#### ALTER CHANGE THE STRUCTURE OF EXISTING TABLE
####ALSO LETS ADD NEW COLUMN, RENAME COLUMN OR MODIFY DATATYPE OF A COLUMN

####NEW COLUMN IS ALWAYS ADDED AT THE END

## DROP A COLUMN
## ALTER TABLE order DROP COLUMN total_price;
### RENAME
###ALTER TABLE order RENAME COLUMN order_data TO order_time;
