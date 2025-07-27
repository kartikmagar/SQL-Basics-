# SQL Basics 
# Assignment Questions
# SQL >> STRUCTURED QUERY LANGUAGE 

# 1. SQL Query to Create Table with All Constraints?
CREATE TABLE employees_NEWS(
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(100)UNIQUE,
    salary DECIMAL(10, 2) DEFAULT 30000.00
);


# 2. Purpose of Constraints and Examples:

# Purpose:
# Constraints are rules enforced on data in a table. They help ensure data accuracy, integrity, and reliability by preventing invalid data from being inserted or modified.
# Common Types of Constraints:
# PRIMARY KEY: Uniquely identifies each row (no NULLs, no duplicates).
# NOT NULL: Prevents NULL values in a column.
# UNIQUE: Ensures all values in a column are different.
# CHECK: Validates data based on a condition.
# DEFAULT: Sets a default value if none is provided.
# FOREIGN KEY: Ensures referential integrity between tables.


# 3. Why Use NOT NULL? Can Primary Key Contain NULL?

# Why apply NOT NULL:
# To make sure that a column always contains a value (i.e., the data is required).
# Can Primary Key contain NULL?
# No, a primary key cannot contain NULL values because:
# It uniquely identifies each record.
# NULL means “unknown,” so two NULLs cannot be compared for uniqueness.


# 4. Add & Remove Constraints (with Example)

ALTER TABLE employees_NEWS
ADD CONSTRAINT chk_age CHECK (age >= 18);

ALTER TABLE employees_NEWS
DROP CHECK chk_age;

# 5. Consequences of Violating Constraints:

# If you violate constraints, errors will be raised, and the operation will fail.
# Example Error:
# Trying to insert a NULL in emp_id:

INSERT INTO employees_NEWS(emp_id, emp_name) VALUES (1, 'John');
# ERROR 1048 (23000): Column 'emp_id' cannot be null


# 6. Modify the products Table to Add Constraints

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE products
MODIFY COLUMN price DECIMAL(10, 2) DEFAULT 50.00;

# 7. Fetch each student’s name and their class name (INNER JOIN)

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    class_id INT
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100)
);

INSERT INTO classes VALUES (1, 'Science'), (2, 'Commerce');
INSERT INTO students VALUES (101, 'John', 1), (102, 'Ravi', 2);

SELECT 
    s.student_name,
    c.class_name
FROM 
    Students AS s
INNER JOIN 
    Classes AS c
  ON s.class_id = c.class_id;
  
# 8. List all products with their order and customer info

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

# 9. Query to find total sales amount for each product using INNER JOIN and SUM()

CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

CREATE TABLE Products_NEWS (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Tablet');

INSERT INTO Sales VALUES
(101, 1, 50000.00),
(102, 1, 52000.00),
(103, 2, 15000.00),
(104, 2, 18000.00),
(105, 3, 22000.00);

SELECT 
    p.product_name,
    SUM(s.amount) AS total_sales
FROM 
    Sales AS s
INNER JOIN 
    Products AS p ON s.product_id = p.product_id
GROUP BY 
    p.product_name;
    
# 10. Query to display order_id, customer_name, and quantity of products ordered

CREATE TABLE order_details (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

SELECT 
    o.order_id,
    c.customer_name,
    od.quantity
FROM 
    Orders AS o
INNER JOIN 
    Customers AS c ON o.customer_id = c.customer_id
INNER JOIN 
    Order_Details AS od ON o.order_id = od.order_id
    
# SQL Command 
# 1. Identify primary keys and foreign keys in Maven Movies DB:
# Primary Key: Uniquely identifies each record.
# Foreign Key: Links two tables by referencing the primary key.

# 2. List all details of actors:
SELECT * FROM actor;

# 3. List all customer information from DB:
SELECT * FROM Customer_new;

# 4. List different countries:
SELECT DISTINCT country FROM country;

# 5. Display all active customers:
SELECT * FROM customer WHERE active = 1;

# 6. List all rental IDs for customer with ID 1:
SELECT rental_id FROM rental WHERE customer_id = 1;

# 7. Display all the films whose rental duration is greater than 5:
SELECT * FROM film WHERE rental_duration > 5;

# 8. Total number of films with replacement cost > $15 and < $20:
SELECT COUNT(*) FROM film 
WHERE replacement_cost > 15 AND replacement_cost < 20;

# 9. Count of unique first names of actors:
SELECT COUNT(DISTINCT first_name) FROM actor;

# 10. First 10 records from customer table:
SELECT * FROM customer LIMIT 10;

# 11. First 3 customers whose first name starts with 'b':
SELECT * FROM customer 
WHERE first_name LIKE 'b%' 
LIMIT 3;

# 12. Names of first 5 movies rated 'G':
SELECT title FROM film 
WHERE rating = 'G' 
LIMIT 5;

# 13. Customers whose first name starts with 'a':
SELECT * FROM customer 
WHERE first_name LIKE 'a%';

# 14. Customers whose first name ends with 'a':
SELECT * FROM customer 
WHERE first_name LIKE '%a';

# 15. First 4 cities that start and end with 'a':
SELECT * FROM city 
WHERE city LIKE 'a%a' 
LIMIT 4;

# 16. Customers whose first name has 'NI' in any position:
SELECT * FROM customer 
WHERE first_name LIKE '%NI%';

# 17. Customers with 'r' in the second position:
SELECT * FROM customer 
WHERE first_name LIKE '_r%';

# 18. Customers whose first name starts with 'a' and has at least 5 characters:
SELECT * FROM customer 
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

# 19. Customers whose first name starts with 'a' and ends with 'o':
SELECT * FROM customer 
WHERE first_name LIKE 'a%o';

# 20. Films with PG and PG-13 ratings (using IN):

SELECT * FROM film 
WHERE rating IN ('PG', 'PG-13');

# 21. Films with length between 50 and 100:
SELECT * FROM film 
WHERE length BETWEEN 50 AND 100;

# 22. Top 50 actors (using LIMIT):
SELECT * FROM actor 
LIMIT 50;

# 23. Get distinct film IDs from inventory table:
SELECT DISTINCT film_id FROM inventory;



