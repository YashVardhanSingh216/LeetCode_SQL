-- 550. Game Play Analysis IV

# Write your MySQL query statement below

SELECT ROUND(
    COUNT(DISTINCT(a.player_id))/ (SELECT COUNT(DISTINCT(player_id)) FROM Activity) , 2
    ) AS 'fraction'
FROM Activity a
JOIN
    (SELECT player_id, MIN(event_date) AS 'date' FROM Activity
    GROUP BY player_id) t
ON a.player_id = t.player_id
AND a.event_date = DATE_ADD(t.date, INTERVAL 1 DAY)



-- SELECT COUNT(DISTINCT(player_id)) FROM Activity

