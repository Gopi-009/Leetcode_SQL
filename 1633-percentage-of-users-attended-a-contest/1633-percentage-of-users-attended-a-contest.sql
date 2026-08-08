select r.contest_id,round(count(distinct r.user_id)/(select count(*)from Users)*100.0,2)as percentage from Users u
join Register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc , r.contest_id asc;

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna