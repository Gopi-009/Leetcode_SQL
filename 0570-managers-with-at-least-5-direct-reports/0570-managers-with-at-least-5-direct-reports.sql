# Write your MySQL query statement below
SELECT m.name from Employee e
join Employee m
on m.id=e.managerId
group by m.id,m.name 
having count(e.id )>=5;

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna