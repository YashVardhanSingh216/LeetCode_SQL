-- 570. Managers with at Least 5 Direct Reports

# Write your MySQL query statement below

SELECT name FROM Employee e
CROSS JOIN
(SELECT managerId, COUNT(managerId) AS 'count'
FROM Employee
GROUP BY managerId HAVING COUNT(managerId) >= 5) t
WHERE e.id = t.managerId
