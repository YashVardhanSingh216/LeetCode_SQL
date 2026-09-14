-- 577. Employee Bonus

# Write your MySQL query statement below


SELECT name, bonus FROM Bonus t1
RIGHT JOIN Employee t2
ON t1.empId = t2.empId
WHERE bonus IS NULL || bonus < 1000
