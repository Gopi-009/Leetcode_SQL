select
    s.student_id,
    s.student_name,
    sub.subject_name,
    count(e.subject_name) as attended_exams
from students s
cross join subjects sub
left  join Examinations e
    on s.student_id =e.student_id
    and sub.subject_name = e.subject_name
group by
    s.student_id,
    s.student_name,
    sub.subject_name
order by
    s.student_id,
    sub.subject_name;



-- Synced seamlessly with LeetHub Pro
-- Pro features: https://bit.ly/leethubpro | Free version: https://bit.ly/leethubv4
-- Get it here: https://chromewebstore.google.com/detail/bcilpkkbokcopmabingnndookdogmbna