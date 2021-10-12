-- Get the total amount of time that all students from a specific cohort have spent on all assignments.
SELECT SUM(duration) AS total_duration
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
JOIN assignment_submissions 
ON students.id = student_id
WHERE cohorts.name = 'FEB12';