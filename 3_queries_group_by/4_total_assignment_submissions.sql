SELECT cohorts.name as cohort_name, count(assignment_submissions.*) as total_submission
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON student_id=students.id
GROUP BY cohort_name 
ORDER BY total_submission DESC;