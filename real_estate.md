1. **Create and connect to the database:**
   ```sql
   CREATE DATABASE real_estate;
   \c real_estate;
   ```

2. **Drop the `revenue` table:**
   ```sql
   DROP TABLE IF EXISTS revenue;
   ```

3. **Show contents of the `owner` table:**
   ```sql
   SELECT * FROM owner;
   ```

4. **Show contents of the `realtor` table:**
   ```sql
   SELECT * FROM realtor;
   ```

5. **Show contents of the `customer` table:**
   ```sql
   SELECT * FROM customer;
   ```

6. **Show contents of the `transaction` table:**
   ```sql
   SELECT * FROM transaction;
   ```

7. **Show contents of the `property` table:**
   ```sql
   SELECT * FROM property;
   ```

8. **Create table and insert values:**
   ```sql
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
   ```

9. **Add column `emi` to `property` table:**
   ```sql
   ALTER TABLE property ADD COLUMN emi VARCHAR(3);
   ```

10. **Show `property` table description before and after adding `emi` column:**
    ```sql
    \d property;
    ```

11. **Update `emi` to `yes` for the following `p_ids`:**
    ```sql
    UPDATE property SET emi = 'yes' WHERE p_id IN (101, 102, 103, 107);
    UPDATE property SET emi = 'yes' WHERE p_id IN (104, 105, 106);
    ```

12. **Show contents of `property` table:**
    ```sql
    SELECT * FROM property;
    ```

13. **Change the `o_name` to ‘Charles’ where `o_city` is ‘Mumbai’:**
    ```sql
    UPDATE owner SET o_name = 'Charles' WHERE o_city = 'Mumbai';
    ```

14. **Delete the transaction having `t_id` as ‘1004’:**
    ```sql
    DELETE FROM transaction WHERE transaction_id = 1004;
    ```

15. **Display the properties having price `5000000`:**
    ```sql
    SELECT * FROM property WHERE price = 5000000;
    ```

16. **Display those realtors who are from Mumbai:**
    ```sql
    SELECT * FROM realtor WHERE r_city = 'Mumbai';
    ```

17. **Display those properties whose price is greater than `5000000`:**
    ```sql
    SELECT * FROM property WHERE price > 5000000;
    ```

18. **Change the data type of `price` column to `float`:**
    ```sql
    ALTER TABLE property ALTER COLUMN price TYPE FLOAT;
    ```

19. **Increase all the prices by `1000000`:**
    ```sql
    UPDATE property SET price = price + 1000000;
    ```

20. **Change `p_city` to ‘Pune’ where `p_city` is ‘Kolkata’:**
    ```sql
    UPDATE property SET p_city = 'Pune' WHERE p_city = 'Kolkata';
    ```

21. **Change `c_city` to ‘Ujjain’ where `c_city` is ‘Lucknow’:**
    ```sql
    UPDATE customer SET c_city = 'Ujjain' WHERE c_city = 'Lucknow';
    ```

22. **Using compound conditions:**
    ```sql
    SELECT * FROM property WHERE price > 5000000 AND p_city = 'Mumbai';
    ```

23. **Aggregate functions:**
    ```sql
    SELECT SUM(price) FROM property;
    SELECT AVG(price) FROM property;
    SELECT MIN(price) FROM property;
    SELECT MAX(price) FROM property;
    SELECT COUNT(*) FROM property;
    ```

24. **`Group by`, `order by` clauses:**
    ```sql
    SELECT p_city, COUNT(*) FROM property GROUP BY p_city;
    SELECT * FROM property ORDER BY price DESC;
    ```

25. **Adding primary key:**
    ```sql
    ALTER TABLE owner ADD PRIMARY KEY (o_id);
    ```

26. **Adding foreign key:**
    ```sql
    ALTER TABLE transaction ADD FOREIGN KEY (p_id) REFERENCES property (p_id);
    ```

27. **Adding default constraint - Set default `p_city` as ‘Mumbai’:**
    ```sql
    ALTER TABLE property ALTER COLUMN p_city SET DEFAULT 'Mumbai';
    ```

28. **Adding check constraint:**
    ```sql
    ALTER TABLE property ADD CONSTRAINT price_check CHECK (price > 0);
    ```

29. **Rename `property` table as `property_details`:**
    ```sql
    ALTER TABLE property RENAME TO property_details;
    ```

30. **Rename `price` column as `selling_price`:**
    ```sql
    ALTER TABLE property_details RENAME COLUMN price TO selling_price;
    ```

31. **Joins:**
    ```sql
    SELECT owner.o_name, property_details.selling_price
    FROM owner
    INNER JOIN transaction ON owner.o_id = transaction.o_id
    INNER JOIN property_details ON transaction.p_id = property_details.p_id;
    ```

32. **Rename database `estate` to `real_estate`:**
    ```sql
    ALTER DATABASE estate RENAME TO real_estate;
    ```

33. **Create views:**
    ```sql
    CREATE VIEW mumbai_properties AS
    SELECT * FROM property_details WHERE p_city = 'Mumbai';
    ```

34. **Create index:**
    ```sql
    CREATE INDEX price_index ON property_details (selling_price);
    ```

35. **Drop index:**
    ```sql
    DROP INDEX IF EXISTS price_index;
    ```
