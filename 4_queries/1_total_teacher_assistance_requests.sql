-- Get the total number of assistance_requests for a teacher.
SELECT count(*) AS total_assistances, name
FROM teachers
JOIN assistance_requests
ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY name;