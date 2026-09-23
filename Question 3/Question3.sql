WITH RankOrders AS (
    SELECT order_id, customer_id, order_date, order_amount, 
    ROW_NUMBER() OVER(PARTITION BY cutomer_id ORDER BY order_date DESC) AS rn FROM orders
)

SELECT order_id, customer_id, order_date, order_amount, FROM RankedOrders
WHERE rn <= 2 
ORDER BY customer_id, order_date DESC;

