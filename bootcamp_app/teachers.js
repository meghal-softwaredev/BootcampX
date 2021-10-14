const { Pool } = require('pg');

const pool = new Pool({
  user: 'meghalpatel',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = `SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests
ON teachers.id = teacher_id
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohorts.id = cohort_id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
ORDER BY teachers.name;
`;

pool.query(queryString)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
    })
  })
  .catch(err => {
    console.error('query error', err.stack)
  });

