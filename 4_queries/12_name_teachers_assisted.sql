-- Get the name of all teachers that performed an assistance request during a cohort.
SELECT distinct teachers.name AS teacher,cohorts.name AS cohort
FROM teachers
JOIN assistance_requests
ON teachers.id = teacher_id
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;