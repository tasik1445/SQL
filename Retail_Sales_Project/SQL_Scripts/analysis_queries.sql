-- Write Queries for Analysis Core Business Questions
-- Total sales per month
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS total_sales
FROM Orders
JOIN Payments USING(order_id)
GROUP BY month;

-- Top customers by spending
SELECT 
  c.name,
  SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- Best-selling products
SELECT 
  p.name,
  SUM(oi.quantity) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC;

-- Revenue by category
SELECT 
  p.category,
  SUM(oi.quantity * oi.unit_price) AS revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- Orders with no payments
SELECT 
  o.order_id, o.status
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;
