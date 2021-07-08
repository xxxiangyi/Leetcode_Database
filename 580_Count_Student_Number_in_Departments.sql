SELECT dept_name, COUNT(student_id) AS 'student_number'
FROM department d LEFT JOIN student s
ON d.dept_id = s.dept_id
GROUP BY d.dept_id
ORDER BY COUNT(s.student_id) DESC