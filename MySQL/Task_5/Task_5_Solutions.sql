-- Proplem 1 
select email
from (SELECT email , COUNT(email) AS repeat_count
      FROM Person
      GROUP BY email
      HAVING COUNT(email) > 1) erc;
     ------ --------------------------------------------------------------------------------------

-- Proplem 2 
DELETE p1
FROM Person p1, Person p2
WHERE p1.email = p2.email
  AND p1.id > p2.id;

  -----------------------------------------------------------------------------------------------------------

-- Proplem 3 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT DISTINCT salary FROM (
        SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
        FROM Employee
      ) as temp
      WHERE rnk = N
  );
END
--------------------------------------------------------------------------------------------------------
-- Proplem 4 
SELECT score, 
       DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores
ORDER BY score DESC;
---------------------------------------------------------------------------------------------------------------
-- Proplem 5 
SELECT Department, Employee, Salary
FROM (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) as rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) as temp
WHERE rnk = 1;

