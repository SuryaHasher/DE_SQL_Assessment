SELECT p.product_id, p.name
FROM products p WHERE NOT EXISTS
(
    SELECT 1 FROM sales s
    WHERE s.product_id = p.product_id
);