-- Advanced Query
-- Rank top customers
SELECT 
  name,
  total_spent,
  RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM (
  SELECT 
    c.name,
    SUM(p.amount) AS total_spent
  FROM Customers c
  JOIN Orders o ON c.customer_id = o.customer_id
  JOIN Payments p ON o.order_id = p.order_id
  GROUP BY c.customer_id, c.name
) AS aggregated_data
ORDER BY customer_rank;