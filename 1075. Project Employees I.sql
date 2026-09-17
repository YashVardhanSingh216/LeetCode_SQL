-- 1075. Project Employees I

# Write your MySQL query statement below


SELECT x.project_id, ROUND((SUM(x.experience_years)/COUNT(x.project_id)),2) AS 'average_years'
FROM
    (SELECT p.project_id, e.experience_years FROM Project p
    LEFT JOIN Employee e
    ON p.employee_id = e.employee_id) x
GROUP BY x.project_id
