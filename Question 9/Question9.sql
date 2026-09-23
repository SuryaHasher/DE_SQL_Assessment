WITH DistinctLogins AS
(
    SELECT DISTINCT
        user_id, CAST(login_date AS DATE) AS login_date
    FROM logins
),
NumberedLogins AS
(
    SELECT user_id, login_date, 
    DATEADD(
        DAY, -ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY login_date
        ),
        login_date
    ) AS grp
    FROM DistinctLogins
),
Streaks AS
(
    SELECT 
        user_id,
        grp,
        MIN(login_date) AS first_day,
        COUNT(*) AS consecutive_days
    FROM NumberedLogins
    GROUP BY user_id, grp
)
SELECT 
    user_id,
    first_day
FROM Streaks
WHERE consecutive_days >=3
ORDER BY user_id, first_day;