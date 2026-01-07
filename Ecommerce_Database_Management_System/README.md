## 🛒 E-Commerce Database Management System (DBMS Project)

A complete E-Commerce Database Management System designed using MySQL. This project demonstrates relational database design, SQL operations, and CRUD functionality for an e-commerce environment.

## 📘 1. Project Overview

The E-Commerce DBMS Project models the core functions of an online shopping system — managing customers, products, categories, orders, and payments. It uses MySQL for storing all data is stored in normalized
relational tables with constraints, keys, and relationships to ensure data integrity and performance.

## 🎯 2. Objectives

- Design and normalize a relational e-commerce database.  
- Implement real-world SQL operations and joins.  
- Enable CRUD operations for customers, products, and orders.  
- Provide analytical reports using views and stored procedures.  
- Integrate the database with a functional web application or mobile application in future.

## 🧱 3. Database Design

Database Name: `EcommerceDB`

The database is normalized up to Third Normal Form (3NF) and contains 9 tables interconnected by primary and foreign keys.

----------------------------------------------------------------------------------
| Table Name |                  Description                                      |
|------------|-------------------------------------------------------------------|
| Customer   | Stores user information (name, email, password).                  |
| Category   | Defines product categories (e.g., Electronics, Books).            |
| Product    | Contains product details such as price, stock, and category link. |
| Cart       | Represents a customer’s shopping cart.                            |
| Cart_Items | Links products to a specific cart (many-to-many).                 |
| Orders     | Stores order information and status.                              |
| Order_Items| Contains product details per order.                               |
| Payment    | Tracks payment type, status, and transaction ID.                  |
| Address    | Manages user shipping addresses.                                  |
----------------------------------------------------------------------------------

## 🧩 4. Relationships Overview
----------------------------------------------------------------------------------
| Entity             | Relationship | Type                                       |
|--------------------|--------------|--------------------------------------------|
| Customer → Orders  | One-to-Many  | Each customer can place many orders.       |
| Category → Product | One-to-Many  | Each category has multiple products.       |
| Orders ↔ Product   | Many-to-Many | Through the `Order_Items` table.           |
| Customer → Address | One-to-Many  | Each customer can have multiple addresses. |
| Orders → Payment   | One-to-One   | Each order has a unique payment record.    |
----------------------------------------------------------------------------------

## 🧠 5. Functional Modules
---------------------------------------------------------------------------------
| Module                  | Functionality                                       |
|-------------------------|-----------------------------------------------------|
| Customer Management     | Register, view, and maintain customer records.      |
| Product Management      | Add, categorize, and manage products.               |
| Order Management        | Process customer orders and update status.          |
| Payment System          | Handle multiple payment methods.                    |
| Cart Management         | Store temporary product selections before checkout. |
| Admin Panel             | Manage orders and view overall sales.               |
---------------------------------------------------------------------------------


 ## 🧍‍♂️ Customer Management

 **Register**  (Add a new customer when a user signs up) : `INSERT INTO Customer (Name, Email,Password)          VALUES ('Tasikul Islam', 'tasikul@example.com', 'pass456');`

 **View Customers** (Display all registered customers ) : `SELECT * FROM Customer`
                                                                                
 **Update Customer Info** (Modify customer details such as name or email) : `UPDATE Customer SET Name = 'Tasikul I.' WHERE User_ID = 2; ` 
                                               
 **Delete Customer** (Remove a customer record (if account is deactivated) ) : `DELETE FROM Customer WHERE User_ID = 3; `      

 **Search Customer** (Retrieve customer details by email or name) : `SELECT * FROM Customer WHERE Email = 'tasikul@example.com'; `                                              


 ## 🛍️ Product Management

 **Add Product** (Insert new product under a category) : `INSERT INTO Product (Name, Price, Description, Stock_Quantity, C_ID) VALUES ('Smartphone X1', 299.99, '6.5 inch display, 128GB storage', 50, 1); ` 

 **View Products** (Display all available products) : `SELECT * FROM Product`
                                                                                                              
 **Update Product Info** (Modify product details like price or stock) : `UPDATE Product SET Price = 279.9 Stock_Quantity = 45 WHERE P_ID = 1;`  

 **Delete Product** (Remove a product from catalog) : `DELETE FROM Product WHERE P_ID=5`

 **Search Product** (Retrieve products by category or name) : `SELECT * FROM Product WHERE Name LIKE '%Laptop%';`


 ## 🛒 Cart Management

 **Create Cart** (Create a cart for new user) : `INSERT INTO Cart (User_ID) VALUES (1)`   
                                                                                                            
 **Add Product to Cart** (Add product with quantity to cart) : `INSERT INTO Cart_Items (Cart_ID, P_ID, Quantity) VALUES (1, 3, 2)`        

 **View Cart Items** (Display items in a user’s cart) : `SELECT c.Cart_ID, p.Name, ci.Quantity FROM Cart c JOIN Cart_Items ci ON c.Cart_ID = ci.Cart_ID JOIN Product p ON ci.P_ID = p.P_ID WHERE c.User_ID = 1; ` 

 **Update Quantity** (Modify product quantity in cart) : `UPDATE Cart_Items SET Quantity = 3 WHERE Cart_Item_ID = 1;`

 **Remove Product from Cart** (Delete product from cart) : `DELETE FROM Cart_Items WHERE Cart_ID = 1 AND P_ID = 3; `                            


 ## 📦 Order Management

 **Place Order** (Add new order record after checkout) : `INSERT INTO Orders (User_ID, Order_Amount, Shipping_Address, Order_Status) VALUES (1, 329.99, '12 Lake Road, Dhaka', 'Pending'); `

 **Add Ordered Products** (Add products linked to order) : `INSERT INTO Order_Items (Order_ID, P_ID, Quantity, Unit_Price) VALUES (1, 1, 1, 299.99);` 

 **View Orders** (Show all orders with customer info) : `SELECT o.Order_ID, c.Name, o.Order_Amount, o.Order_Status, o.Order_Date FROM Orders o JOIN Customer c ON o.User_ID = c.User_ID; `

 **Update Order Status** (Change order progress) : `UPDATE Orders SET Order_Status = 'Delivered' WHERE Order_ID = 4; `

 **Delete Order** (Cancel or remove an order) : `DELETE FROM Orders WHERE Order_ID = 5`


 ## 💳 Payment Management

 **Add Payment** (Record new payment transaction) : `INSERT INTO Payment (Order_ID, Type, Amount, Payment_Status, Transaction_ID) VALUES (1, 'Credit Card', 329.99, 'Completed', 'TXN1001'); `                                 
 **View Payments** (Show all payments with order info) : `SELECT p.Payment_ID, c.Name, pay.Type, pay.Amount, pay.Payment_Status FROM Payment pay JOIN Orders o ON pay.Order_ID = o.Order_ID JOIN Customer c ON o.User_ID = c.User_ID; ` 
 **Update Payment Status** (Modify payment status after processing) `UPDATE Payment SET Payment_Status = 'Completed' WHERE Payment_ID = 4;`

 **Refund Payment** (Mark payment as refunded) : `UPDATE Payment SET Payment_Status = 'Refunded' WHERE Transaction_ID = 'TXN1005'; `
  
 **Pending Payments** (Find all orders with pending payments) : `SELECT Name, Email FROM Customer WHERE User_ID IN (SELECT o.User_ID FROM Orders o JOIN Payment p ON o.Order_ID = p.Order_ID WHERE p.Payment_Status = 'Pending'); ` 


 ## 🏠 Address Management
 
 **Add Address** (Insert a new address for customer) : `INSERT INTO Address (User_ID, Address_Type, Street_Address, City, State, Zip_Code, Country, Is_Default) VALUES (1, 'Home', '12 Lake Road', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', TRUE); ` 

 **View Addresses** (Retrieve all addresses for a customer) :`SELECT * FROM Address WHERE User_ID = 1;` 

 **Update Address** (Modify street or city details) : `UPDATE Address SET City = 'Chittagong' WHERE Address_ID = 3; `    

 **Set Default Address** (Mark one address as default) : `UPDATE Address SET Is_Default = TRUE WHERE Address_ID = 1;`

 **Delete Address** (Remove old or duplicate address) : `DELETE FROM Address WHERE Address_ID = 5;` 
                                                                                                           

 ## 📊 6. Future Enhancements (Web Integration)

- Implement login and registration (Flask sessions).

- Add CRUD for products and categories via web interface.

- Integrate payment gateway (SSLCOMMERZ / PayPal).

- Include data visualization charts for admin analytics.


 -- ============================================================================
 -- E-commerce DBMS Project: SQL Operations, Views, and Procedures
 -- ============================================================================
 -- Contains SQL queries (JOIN, GROUP BY, HAVING, UPDATE, DELETE, Subquery)
 -- plus a VIEW and a STORED PROCEDURE for phpMyAdmin / MySQL.
 -- =============================================================================

## 🧮 7. SQL Operations and Examples

-- 1️. JOIN – Orders with Customer Names
```sql
SELECT 
    o.Order_ID, c.Name AS Customer_Name, o.Order_Amount, o.Order_Status, o.Order_Date
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
ORDER BY o.Order_Date DESC;

-- 2️. JOIN – Order Details with Product Info

SELECT 
    o.Order_ID, c.Name AS Customer_Name, p.Name AS Product_Name, oi.Quantity, oi.Unit_Price
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
JOIN Product p ON oi.P_ID = p.P_ID;

-- 3️. GROUP BY – Total Spending per Customer

SELECT 
    c.Name AS Customer_Name, SUM(o.Order_Amount) AS Total_Spent
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC;

-- 4️. HAVING – Customers Who Spent More Than 200

SELECT 
    c.Name, SUM(o.Order_Amount) AS Total_Spent
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
GROUP BY c.Name
HAVING SUM(o.Order_Amount) > 200;

-- 5️. UPDATE – Change Order Status
UPDATE Orders
SET Order_Status = 'Delivered'
WHERE Order_ID = 4;

-- 6️. DELETE – Remove Product from Cart

DELETE FROM Cart_Items
WHERE Cart_ID = 1 AND P_ID = 3;

-- 7️. SUBQUERY – Products Never Ordered

SELECT Name 
FROM Product
WHERE P_ID NOT IN (SELECT P_ID FROM Order_Items);

-- 8️. NESTED QUERY – Customers with Pending Payments

SELECT Name, Email 
FROM Customer
WHERE User_ID IN (
    SELECT o.User_ID 
    FROM Orders o 
    JOIN Payment p ON o.Order_ID = p.Order_ID
    WHERE p.Payment_Status = 'Pending'
);

-- 9️. GROUP BY + JOIN – Orders per Category

SELECT 
    cat.Name AS Category_Name,
    COUNT(oi.Order_Item_ID) AS Total_Products_Sold,
    SUM(oi.Quantity * oi.Unit_Price) AS Total_Sales
FROM Order_Items oi
JOIN Product p ON oi.P_ID = p.P_ID
JOIN Category cat ON p.C_ID = cat.C_ID
GROUP BY cat.Name;

-- 9. View All Customers With Their Orders
SELECT 
    c.User_ID,
    c.Name AS Customer_Name,
    c.Email,
    o.Order_ID,
    o.Order_Amount,
    o.Order_Status,
    o.Order_Date
FROM Customer c
LEFT JOIN Orders o ON c.User_ID = o.User_ID
ORDER BY c.User_ID, o.Order_Date DESC;

-- 10. Customers With Total Orders Count
SELECT 
    c.User_ID,
    c.Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
LEFT JOIN Orders o ON c.User_ID = o.User_ID
GROUP BY c.User_ID, c.Name
ORDER BY Total_Orders DESC;

-- 11. Customers With Total Amount Spent
SELECT 
    c.User_ID,
    c.Name,
    SUM(o.Order_Amount) AS Total_Spent
FROM Customer c
LEFT JOIN Orders o ON c.User_ID = o.User_ID
GROUP BY c.User_ID, c.Name
ORDER BY Total_Spent DESC;

-- 12. Orders With Product Details
SELECT 
    o.Order_ID,
    c.Name AS Customer_Name,
    p.Name AS Product_Name,
    oi.Quantity,
    oi.Unit_Price
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
JOIN Order_Items oi ON oi.Order_ID = o.Order_ID
JOIN Product p ON p.P_ID = oi.P_ID;

-- 13. Customers With Pending Payments
SELECT 
    c.Name,
    c.Email,
    p.Payment_Status,
    p.Amount
FROM Customer c
JOIN Orders o ON c.User_ID = o.User_ID
JOIN Payment p ON o.Order_ID = p.Order_ID
WHERE p.Payment_Status = 'Pending';

-- 14. Total Products Sold Per Category
SELECT 
    cat.Name AS Category_Name,
    SUM(oi.Quantity) AS Total_Products_Sold
FROM Order_Items oi
JOIN Product p ON oi.P_ID = p.P_ID
JOIN Category cat ON p.C_ID = cat.C_ID
GROUP BY cat.Name;

-- 15. Best selling product
SELECT 
    p.Name,
    SUM(oi.Quantity) AS Total_Sold
FROM Order_Items oi
JOIN Product p ON oi.P_ID = p.P_ID
GROUP BY p.Name
ORDER BY Total_Sold DESC
LIMIT 5;

-- 16. Product low in stock
SELECT 
    P_ID,
    Name,
    Stock_Quantity
FROM Product
WHERE Stock_Quantity < 10;

--17. Total Revenue
SELECT 
    SUM(Order_Amount) AS Total_Revenue
FROM Orders
WHERE Order_Status = 'Delivered';

--18. Monthly Sales Report
SELECT 
    MONTH(Order_Date) AS Month,
    YEAR(Order_Date) AS Year,
    SUM(Order_Amount) AS Total_Sales
FROM Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

--19. Most Active Customers (Top Buyers)
SELECT 
    c.Name,
    SUM(o.Order_Amount) AS Total_Spent
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC
LIMIT 5;

-- Searching techniques Queries

-- 1. Search Products by Name (Partial Match)
SELECT * FROM Product
WHERE Name LIKE '%phone%';

-- 2. Search Products by Category
SELECT p.* FROM Product p
JOIN Category c ON p.C_ID = c.C_ID
WHERE c.Name = 'Electronics';

-- 3. Search Orders by Customer Name
SELECT o.* FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
WHERE c.Name LIKE '%Tasikul%';

-- 4. Search Orders by Status
SELECT * FROM Orders
WHERE Order_Status = 'Pending';

-- 5. Search Orders by Date Range
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2025-01-01' AND '2025-01-31';

-- 6. Search Products Within a Price Range
SELECT * FROM Product
WHERE Price BETWEEN 100 AND 500;

-- 7. Search Orders by Status
SELECT * FROM Orders
WHERE Order_Status = 'Pending';




-- 👁️ Database View
View: `CustomerOrderSummary`

CREATE OR REPLACE VIEW CustomerOrderSummary AS
SELECT 
    c.Name AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Order_Amount) AS Total_Spent,
    MAX(o.Order_Date) AS Last_Order_Date
FROM Orders o
JOIN Customer c ON o.User_ID = c.User_ID
GROUP BY c.Name;


 Purpose: Provides summarized purchase information per customer.

-- ⚙️ Stored Procedure
Procedure: `GetOrderDetailsByCustomer`

CREATE PROCEDURE GetOrderDetailsByCustomer(IN cust_id INT)
BEGIN
    SELECT 
        o.Order_ID,
        o.Order_Date,
        o.Order_Amount,
        o.Order_Status,
        p.Type AS Payment_Type,
        p.Payment_Status
    FROM Orders o
    LEFT JOIN Payment p ON o.Order_ID = p.Order_ID
    WHERE o.User_ID = cust_id;
END;


Usage:

CALL GetOrderDetailsByCustomer(1);


Purpose: Returns all orders and payments of a specific customer.



