-- Create Views
-- Save a view for monthly sales.
CREATE VIEW MonthlySales AS
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(amount) AS total_sales
FROM Orders
JOIN Payments USING(order_id)
GROUP BY month;
