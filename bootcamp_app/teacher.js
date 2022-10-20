const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

const [, , cohort] = process.argv;

pool
  .query(
    `
    SELECT DISTINCT teachers.name as teacher, cohorts.name as cohorts
    FROM teachers
    JOIN assistance_requests ON teachers.id=teacher_id
    JOIN students ON students.id=student_id
    JOIN cohorts ON cohorts.id=cohort_id
    WHERE cohorts.name LIKE '%${cohort}%'
    ORDER BY teacher;
`
  )
  .then((res) => {
    res.rows.forEach((row) => console.log(`${cohort}: ${row.teacher}`));
  })
  .catch((err) => console.error("query error", err.stack));
