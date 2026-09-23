SELECT order_id,
customer_id,
order_Date,
amount,
SUM(amount) OVER(
    PARTITION BY customer_id
    ORDER BY order_date, order_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_total
FROM orders
ORDER BY customer_id, order_date, order_id;