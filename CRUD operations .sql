USE temp;

-- Customer table
CREATE TABLE customer (
    id INTEGER PRIMARY KEY,
    cname VARCHAR(225),
    address VARCHAR(225),
    gender CHAR(2), 
    city VARCHAR(225),
    pincode INTEGER
);

-- Insert data into customer
INSERT INTO customer VALUES 
(1251, 'ram kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(1300, 'shyam singh', 'Ludhiana MO', 'M', 'Ludhiana', 141001),
(245, 'Neelam Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana MO', 'M', 'Ludhiana', 141001);

INSERT INTO customer VALUES
(1252, 'ram kumari', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

INSERT INTO customer (id, cname) VALUES (121, 'Bob');

-- Update address and gender for Bob
UPDATE customer 
SET address = 'Mumbai', gender = 'M' 
WHERE id = 121;

-- Disable SQL_SAFE_UPDATES if required
SET SQL_SAFE_UPDATES = 0;

-- Update all pincode values
UPDATE customer SET pincode = 110000;

-- Increment all pincode values by 1
UPDATE customer SET pincode = pincode + 1;

-- Delete customer with id = 121
DELETE FROM customer WHERE id = 121;

-- Order details table with ON DELETE CASCADE
CREATE TABLE order_details (
    order_id INTEGER PRIMARY KEY, 
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id) ON DELETE CASCADE
);

-- Insert into order_details
INSERT INTO order_details 
VALUES (3, '2019-03-11', 1251);

-- View data in order_details
SELECT * FROM order_details;

-- Delete customer with id = 1251
DELETE FROM customer WHERE id = 1251;

-- Verify cascading delete in order_details
SELECT * FROM order_details;

USE temp;

-- Replace into customer with correct column alignment
REPLACE INTO customer (id, city, address) 
VALUES (1333, 'codehelp', 'colony');

-- Replace into customer using SET syntax
REPLACE INTO customer 
SET id = 1300, cname = 'mac', city = 'utah';

-- Replace into customer using data from the same table

REPLACE INTO customer (cname, city) 
SELECT cname, city 
FROM customer 
WHERE id = 500;
