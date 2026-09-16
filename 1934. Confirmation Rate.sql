-- 1934. Confirmation Rate

# Write your MySQL query statement below

SELECT Signups.user_id, ROUND(COALESCE(x.conf_rate,0), 2) AS 'confirmation_rate' 
FROM Signups
LEFT JOIN
    (SELECT t.user_id, (conf_count/total_mess) AS 'conf_rate' 
    FROM
        (SELECT user_id, COUNT(user_id) AS 'total_mess' 
        FROM Confirmations
        GROUP BY user_id) t
    JOIN
        (SELECT user_id, action, COUNT(action) AS 'conf_count'
        FROM Confirmations
        WHERE action = 'confirmed'
        GROUP BY user_id,action) c
    ON t.user_id = c.user_id) x
ON Signups.user_id = x.user_id 
ORDER BY Signups.user_id
