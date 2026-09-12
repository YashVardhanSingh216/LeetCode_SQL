-- 197. Rising Temperature

# Write your MySQL query statement below

SELECT t.id 
FROM (SELECT *,
        LAG(temperature) OVER(ORDER BY recordDate) AS 'temp_lag',
        LAG(recordDate) OVER (ORDER BY recordDate) AS 'prev_date'
    FROM Weather) t
WHERE t.temp_lag < t.temperature
AND DATEDIFF(t.recordDate,t.prev_date) = 1

-- SELECT *,
-- LAG(temperature) OVER( order BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'lag'
-- FROM Weather
