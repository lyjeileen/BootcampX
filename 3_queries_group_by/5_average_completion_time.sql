SELECT students.name as student_name, avg(assignment_submissions.duration) as average_assignment_duration
FROM students 
JOIN assignment_submissions ON student_id=students.id
WHERE end_date IS NULL
GROUP BY student_name 
ORDER BY average_assignment_duration DESC;