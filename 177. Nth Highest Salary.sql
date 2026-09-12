-- 177. Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET n = n-1;
  RETURN (
      # Write your MySQL query statement below.

    SELECT DISTINCT(salary)
    FROM Employee
    ORDER BY salary DESC
    LIMIT n, 1



  );
END
