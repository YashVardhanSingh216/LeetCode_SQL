-- 1251. Average Selling Price

# Write your MySQL query statement below

SELECT x.product_id, COALESCE(ROUND((SUM(x.total_price)/SUM(x.units)),2),0) AS 'average_price'
FROM
    (SELECT r.product_id, r.units, (r.price*r.units) AS 'total_price' 
    FROM 
        (SELECT p.product_id, 
                p.start_date, 
                p.end_date, 
                p.price, 
                u.purchase_date, 
                u.units 
        FROM Prices p
        LEFT JOIN UnitsSold u
        ON p.product_id = u.product_id AND u.purchase_date >= p.start_date AND u.purchase_date <= p.end_date ) r
   ) x
GROUP BY x.product_id
