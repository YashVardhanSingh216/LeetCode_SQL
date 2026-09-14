-- 1280. Students and Examinations

# Write your MySQL query statement below

-- first cross join students and subjects -> all students in all subjects
-- then left join this table with Examination table on same std_id, same sub

SELECT s.student_id, s.student_name, sub.subject_name, COALESCE(e.attended_exams,0) AS 'attended_exams'
    FROM Students s
    CROSS JOIN Subjects sub
LEFT JOIN
    (SELECT student_id,subject_name, COUNT(*) AS 'attended_exams' 
    FROM Examinations 
    GROUP BY student_id,subject_name) e
ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
ORDER BY s.student_id, sub.subject_name
