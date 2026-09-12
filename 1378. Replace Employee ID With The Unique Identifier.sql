-- 1378. Replace Employee ID With The Unique Identifier

# Write your MySQL query statement below

SELECT unique_id, name FROM Employees t1
LEFT JOIN EmployeeUNI t2
ON t1.id = t2.id 
