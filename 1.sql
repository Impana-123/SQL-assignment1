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

"Alter table"

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