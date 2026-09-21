-- 1174. Immediate Food Delivery II

# Write your MySQL query statement below

SELECT ROUND(COUNT(x.customer_id)/(SELECT COUNT(DISTINCT(customer_id)) FROM Delivery) * 100,2) AS 'immediate_percentage'
FROM
    (SELECT d.customer_id, d.customer_pref_delivery_date FROM Delivery d
    LEFT JOIN
    (SELECT customer_id,MIN(order_date) AS 'first_date' 
    FROM Delivery
    GROUP BY customer_id) t
    ON d.customer_id = t.customer_id
    WHERE d.customer_pref_delivery_date = t.first_date) x
