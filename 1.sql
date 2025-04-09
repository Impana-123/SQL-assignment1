CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL CHECK (price > 0),
    stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_price DECIMAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount_paid DECIMAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

--"Alter table"

Alter table Customers
ADD column zipcode varchar(10)

alter table Customers alter column phone set data type varchar(30)

Drop the column description from the Products table.
alter table products
drop column description;

Add a unique constraint to email in the Customers table
ALTER TABLE Customers ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE Payments
RENAME COLUMN amount_paid TO paid_amount;

--"Insert"

INSERT INTO Customers (customer_id, name, email, phone, address, zipcode) 
VALUES (1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', '12345');

INSERT INTO Products (product_id, product_name, price, stock_quantity) 
VALUES (1, 'Laptop', 1000.00, 50);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status) 
VALUES (1, 1, '2023-10-01', 1000.00, 'Pending');

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, item_price) 
VALUES (1, 1, 1, 1, 1000.00);

INSERT INTO Payments (payment_id, order_id, payment_method, payment_date, paid_amount) 
VALUES (1, 1, 'Credit Card', '2023-10-02', 1000.00);

--"Update"
    
UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;

UPDATE Customers SET email = 'new.email@example.com' WHERE customer_id = 1;

UPDATE Orders SET status = 'Shipped' WHERE order_id = 1;

UPDATE Products SET price = price * 1.10 WHERE price < 500;

UPDATE Payments SET payment_method = 'PayPal' WHERE payment_id = 1;

--"Delete"

-- Delete Data
ALTER TABLE Orders
ADD CONSTRAINT orders_customer_id_fkey
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
ON DELETE set null;

-- Delete a customer by customer_id
DELETE FROM Customers WHERE customer_id = 1;

-- Drop the existing foreign key constraint
ALTER TABLE OrderItems DROP CONSTRAINT orderitems_product_id_fkey;
-- Add a new foreign key constraint with ON DELETE CASCADE
ALTER TABLE OrderItems
ADD CONSTRAINT orderitems_product_id_fkey
FOREIGN KEY (product_id)
REFERENCES Products(product_id)
ON DELETE CASCADE;
-- Delete a product from the catalog by product_id
DELETE FROM Products WHERE product_id = 1;




