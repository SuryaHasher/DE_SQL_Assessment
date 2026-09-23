WITH StatusHistory AS
(
    SELECT user_id, status, date, LAG(status) OVER (PARTITION BY user_id
    ORDER BY date) AS previous_status
    FROM subscriptions
)
SELECT 
    YEAR(date) AS year,
    MONTH(Date) AS month,
    COUNT(DISTINCT user_id) AS churned_users
FROM StatusHistory
WHERE status = 'cancelled'
AND previous_status = 'active'
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;