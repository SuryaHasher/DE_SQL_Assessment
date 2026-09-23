SELECT customer_id, MIN(order_date) AS first_purchase_date 
FROM orders GROUP BY customer_id;