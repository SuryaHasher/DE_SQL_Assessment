SELECT p.category, SUM(
    CASE WHEN s.sale_Date > = '2022-01-01'
    AND s.sale_date < '2023-01-01'
    THEN s.amount
    ELSE 0
    END) AS sales_2022,

SELECT p.category, SUM(
    CASE WHEN s.sale_Date > = '2023-01-01'
    AND s.sale_date < '2024-01-01'
    THEN s.amount
    ELSE 0
    END) AS sales_2023
FROM products p

INNER JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_date >= '2022-01-01'
AND s.sale_Date < '2024-01-01'
GROUP BY p.category
HAVING
    SUM(
    CASE WHEN s.sale_Date > = '2023-01-01'
    AND s.sale_date < '2024-01-01'
    THEN s.amount
    ELSE 0
    END) 
    >
    SUM(
    CASE WHEN s.sale_Date > = '2022-01-01'
    AND s.sale_date < '2023-01-01'
    THEN s.amount
    ELSE 0
    END);