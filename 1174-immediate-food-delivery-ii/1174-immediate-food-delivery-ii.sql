-- WITH rnk_odr as (
--     select 
--         customer_id,
--         order_date,
--         customer_pref_delivery_date,
--             ROW_NUMBER() OVER (
--                 PARTITION BY customer_id
--                 ORDER BY order_date
--             ) as rankedorder
-- )
-- select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100.0/count(*),2) as immediate_percentage
-- from rnk_odr
-- where rankedorder = 1;

WITH ranked_orders AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date ASC
        ) AS rank_order
    FROM Delivery
)
SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS immediate_percentage
FROM ranked_orders
WHERE rank_order = 1;

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna