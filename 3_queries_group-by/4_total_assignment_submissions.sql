-- Get the total number of assignment submissions for each cohort
SELECT cohorts.name AS cohort, COUNT(chapter) AS total_submissions
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
JOIN assignment_submissions
ON students.id = student_id
JOIN assignments
ON assignments.id = assignment_id
GROUP BY cohorts.name
ORDER By COUNT(chapter) DESC;