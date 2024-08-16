-- Create and connect to the database
CREATE DATABASE real_estate;
\c real_estate;

-- Drop the revenue table if it exists
DROP TABLE IF EXISTS revenue;

-- Show contents of tables
SELECT * FROM owner;
SELECT * FROM realtor;
SELECT * FROM customer;
SELECT * FROM transaction;
SELECT * FROM property;

-- Create table and insert values
CREATE TABLE owner (o_id INT PRIMARY KEY, o_name VARCHAR(50), o_city VARCHAR(50), o_phone VARCHAR(15));
INSERT INTO owner (o_id, o_name, o_city, o_phone) VALUES (1, 'John Doe', 'Mumbai', '9876543210');

CREATE TABLE realtor (r_id INT PRIMARY KEY, r_name VARCHAR(50), r_city VARCHAR(50), r_phone VARCHAR(15));
INSERT INTO realtor (r_id, r_name, r_city, r_phone) VALUES (1, 'Jane Smith', 'Mumbai', '9876543211');

CREATE TABLE customer (c_id INT PRIMARY KEY, c_name VARCHAR(50), c_city VARCHAR(50), c_phone VARCHAR(15));
INSERT INTO customer (c_id, c_name, c_city, c_phone) VALUES (1, 'Alice Brown', 'Delhi', '9876543212');

CREATE TABLE property (p_id INT PRIMARY KEY, area INT, p_city VARCHAR(50), price INT);
INSERT INTO property (p_id, area, p_city, price) VALUES (1, 1200, 'Mumbai', 5000000);

CREATE TABLE transaction (transaction_id INT PRIMARY KEY, date DATE, p_id INT, o_id INT, c_id INT, r_id INT);
INSERT INTO transaction (transaction_id, date, p_id, o_id, c_id, r_id) VALUES (1, '2023-08-15', 1, 1, 1, 1);

-- Add column emi to property table
ALTER TABLE property ADD COLUMN emi VARCHAR(3);

-- Show property table description before and after adding emi column
\d property;

-- Update emi to yes for specific p_ids
UPDATE property SET emi = 'yes' WHERE p_id IN (101, 102, 103, 107);
UPDATE property SET emi = 'yes' WHERE p_id IN (104, 105, 106);

-- Show contents of property table
SELECT * FROM property;

-- Change o_name to ‘Charles’ where o_city is ‘Mumbai’
UPDATE owner SET o_name = 'Charles' WHERE o_city = 'Mumbai';

-- Delete the transaction having t_id as ‘1004’
DELETE FROM transaction WHERE transaction_id = 1004;

-- Display the properties having price 5000000
SELECT * FROM property WHERE price = 5000000;

-- Display those realtors who are from Mumbai
SELECT * FROM realtor WHERE r_city = 'Mumbai';

-- Display those properties whose price is greater than 5000000
SELECT * FROM property WHERE price > 5000000;

-- Change the data type of price column to float
ALTER TABLE property ALTER COLUMN price TYPE FLOAT;

-- Increase all the prices by 1000000
UPDATE property SET price = price + 1000000;

-- Change p_city to ‘Pune’ where p_city is ‘Kolkata’
UPDATE property SET p_city = 'Pune' WHERE p_city = 'Kolkata';

-- Change c_city to ‘Ujjain’ where c_city is ‘Lucknow’
UPDATE customer SET c_city = 'Ujjain' WHERE c_city = 'Lucknow';

-- Using compound conditions
SELECT * FROM property WHERE price > 5000000 AND p_city = 'Mumbai';

-- Aggregate functions
SELECT SUM(price) FROM property;
SELECT AVG(price) FROM property;
SELECT MIN(price) FROM property;
SELECT MAX(price) FROM property;
SELECT COUNT(*) FROM property;

-- Group by, order by clauses
SELECT p_city, COUNT(*) FROM property GROUP BY p_city;
SELECT * FROM property ORDER BY price DESC;

-- Adding primary key
ALTER TABLE owner ADD PRIMARY KEY (o_id);

-- Adding foreign key
ALTER TABLE transaction ADD FOREIGN KEY (p_id) REFERENCES property (p_id);

-- Adding default constraint - Set default p_city as ‘Mumbai’
ALTER TABLE property ALTER COLUMN p_city SET DEFAULT 'Mumbai';

-- Adding check constraint
ALTER TABLE property ADD CONSTRAINT price_check CHECK (price > 0);

-- Rename property table as property_details
ALTER TABLE property RENAME TO property_details;

-- Rename price column as selling_price
ALTER TABLE property_details RENAME COLUMN price TO selling_price;

-- Joins
SELECT owner.o_name, property_details.selling_price
FROM owner
INNER JOIN transaction ON owner.o_id = transaction.o_id
INNER JOIN property_details ON transaction.p_id = property_details.p_id;

-- Rename database estate to real_estate
ALTER DATABASE estate RENAME TO real_estate;

-- Create views
CREATE VIEW mumbai_properties AS
SELECT * FROM property_details WHERE p_city = 'Mumbai';

-- Create index
CREATE INDEX price_index ON property_details (selling_price);

-- Drop index
DROP INDEX IF EXISTS price_index;
