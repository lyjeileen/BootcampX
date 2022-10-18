SELECT students.name as student_name, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students 
JOIN assignment_submissions ON student_id=students.id
JOIN assignments ON assignments.id=assignment_id
WHERE end_date IS NULL 
GROUP BY student_name 
HAVING avg(assignments.duration) >avg(assignment_submissions.duration)
ORDER BY average_assignment_duration;