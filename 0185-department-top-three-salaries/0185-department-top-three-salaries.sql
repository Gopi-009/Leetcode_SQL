WITH RankedSalaries AS (
    SELECT 
        departmentId,
        name AS Employee,
        salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as rnk
    FROM Employee
)
SELECT 
    d.name AS Department,
    r.Employee,
    r.Salary
FROM RankedSalaries r
JOIN Department d 
    ON r.departmentId = d.id
WHERE r.rnk <= 3;

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna