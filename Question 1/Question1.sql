SELECT C.Customer_name, SUM(O.order_amount) as total_order_amt FROM Customer as C 
INNER JOIN OrderS as O ON C.customer_id = o.customer_id 
WHERE O.order_date >= '2023-01-01' AND o.order_date < '2024-01-01'
GROUP BY C.customer_id, C.Customer_name HAVING SUM(O.order_amount) > 10000;