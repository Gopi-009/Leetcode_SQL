select w1.id
from Weather as w1 
join 
Weather as w2
on DATE_ADD(w2.recordDate, interval 1 day) = w1.recordDate
where w1.temperature > w2.temperature

-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna