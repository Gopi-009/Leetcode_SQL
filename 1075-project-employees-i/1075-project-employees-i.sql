# Write your MySQL query statement below
select p.project_id,round(sum(e.experience_years)/count(e.employee_id),2) as average_years from Project p
join Employee e
on p.employee_id = e.employee_id
group by project_id

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna