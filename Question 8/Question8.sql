SELECT 
    t.transcation_id,
    t.user_id,
    t.amount,
    t.transcation_date
FROM transcations t
INNER JOIN
(
    SELECT
        user_id, amount, transcation_date
    FROM transcations
    GROUP BY user_id, amount, transcation_date
    HAVING COUNT(*) > 1
) d

ON t.user_id = d.user_id
AND t.amount = d.amount
AND t.transaction_date = d.transcation_date
ORDER BY t.user_id, t.transcation_date;