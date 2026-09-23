SELECT c.cutomer_id, c.customer_name FROM customers c 
WHERE NOT EXISTS(
    SELECT 1 FROM orders o
    WHERE o.customer_id = c.customer_id
    AND o.order_date >= '2023-01-01'
    AND o.order_date < '2024-01-01'
);