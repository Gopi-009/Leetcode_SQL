# Write your MySQL query statement below
WITH fract AS (
    SELECT 
        player_id,
        event_date,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_login_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS second_login_date
    FROM Activity
)
SELECT 
    ROUND(
        COUNT(DISTINCT CASE WHEN DATEDIFF(second_login_date, first_login_date) = 1 THEN player_id END) 
        / COUNT(DISTINCT player_id), 
        2
    ) AS fraction
FROM fract;

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna