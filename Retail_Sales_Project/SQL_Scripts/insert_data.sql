-- Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@email.com', '1234567890', 'Dhaka', '2023-01-10'),
(2, 'Bob', 'bob@email.com', '1234567891', 'Chattogram', '2023-02-15'),
(3, 'Carol', 'carol@email.com', '1234567892', 'Khulna', '2023-03-05');

-- Products
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 80000, 50),
(2, 'Smartphone', 'Electronics', 40000, 100),
(3, 'Headphones', 'Accessories', 3000, 200),
(4, 'Keyboard', 'Accessories', 2000, 150);

-- Orders
INSERT INTO Orders VALUES
(1, 1, '2023-04-01', 'Completed'),
(2, 2, '2023-04-02', 'Completed'),
(3, 3, '2023-04-02', 'Pending');

-- OrderItems
INSERT INTO OrderItems VALUES
(1, 1, 1, 1, 80000),
(2, 1, 3, 2, 3000),
(3, 2, 2, 1, 40000),
(4, 2, 4, 1, 2000);

-- Payments
INSERT INTO Payments VALUES
(1, 1, '2023-04-01', 86000, 'Card'),
(2, 2, '2023-04-02', 42000, 'Cash');
