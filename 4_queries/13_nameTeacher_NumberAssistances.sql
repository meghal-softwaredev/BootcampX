-- Perform the same query as before, but include the number of assistances as well.
SELECT distinct teachers.name AS teacher,cohorts.name AS cohort, COUNT(assistance_requests.*) AS total_assistances
FROM teachers
JOIN assistance_requests
ON teachers.id = teacher_id
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;