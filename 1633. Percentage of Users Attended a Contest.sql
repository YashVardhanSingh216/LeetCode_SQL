-- 1633. Percentage of Users Attended a Contest

# Write your MySQL query statement below


SELECT * FROM
(SELECT contest_id, ROUND((COUNT(user_id)/(SELECT COUNT(*) FROM Users))*100,2) AS 'percentage'
FROM Register
GROUP BY contest_id) t
ORDER BY t.percentage DESC, t.contest_id
