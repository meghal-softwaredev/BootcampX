const { Pool } = require('pg');

const pool = new Pool({
  user: 'meghalpatel',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const valuesFromCLI = process.argv.slice(2);
const cohort = '%' + valuesFromCLI[0] + '%';
const limit = valuesFromCLI[1] || 2;

const queryString = `
SELECT students.id AS student_id, students.name AS name, cohorts.name AS cohort
FROM students
JOIN cohorts
ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

pool.query(queryString, [cohort, limit])
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
    })
  })
  .catch(err => {
    console.error('query error', err.stack)
  });


