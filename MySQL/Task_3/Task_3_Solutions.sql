-- Problem 1:  Invalid Tweets
-- Link: https://leetcode.com/problems/invalid-tweets/description/

select tweet_id from `Tweets` 
where CHAR_LENGTH(content) > 15 

------------------------------------------------------------------
-- Problem 2:  Fix Names in a Table
-- Link: https://leetcode.com/problems/fix-names-in-a-table/description/

select user_id,
  concat(
  upper(left(name,1)),
  lower(substring(name,2,length(name)-1))) name  from `Users`
  order by user_id;

  ----------------------------------------------------------------------
  -- Problem 3:  calculate-special-bonus
  SELECT 
    employee_id,
    CASE 
        WHEN employee_id % 2 != 0 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;
-----------------------------------------------------------------
  -- Problem 4:  patients-with-a-condition
  SELECT 
    patient_id, 
    patient_name, 
    conditions 
FROM 
    Patients
WHERE 
    conditions LIKE 'DIAB1%' 
    OR 
    conditions LIKE '% DIAB1%';
    ------------------------------------------------------------------------

      -- Problem 5:  find-total-time-spent-by-each-employee
      SELECT 
    event_day AS day, 
    emp_id, 
    SUM(out_time - in_time) AS total_time
FROM 
    Employees
GROUP BY 
    event_day, 
    emp_id;
    ---------------------------------------------------------------------
    -- Proplem 6 : find-followers-count
    SELECT 
    user_id, 
    COUNT(follower_id) AS followers_count
FROM 
    Followers
GROUP BY 
    user_id
ORDER BY 
    user_id ASC;
    

 -- Proplem 7 : daily-leads-and-partners

SELECT 
    date_id, 
    make_name, 
    COUNT(DISTINCT lead_id) AS unique_leads, 
    COUNT(DISTINCT partner_id) AS unique_partners
FROM 
    DailySales
GROUP BY 
    date_id, 
    make_name;
---------------------------------------------------------------------------------------------

-- Proplem 8: actors-and-directors-who-cooperated-at-least-three
SELECT 
    actor_id, 
    director_id
FROM 
    ActorDirector
GROUP BY 
    actor_id, 
    director_id
HAVING 
    COUNT(*) >= 3;
    -------------------------------------------------------------------------------
 --- Proplem 9 classes-with-at-least-5-students 
    SELECT 
    class
FROM 
    Courses
GROUP BY 
    class
HAVING 
    COUNT(student) >= 5;
    --------------------------------------------------------------------------------
 --- Proplem 10 Game Play Analysis I
SELECT 
    player_id, 
    MIN(event_date) AS first_login
FROM 
    Activity
GROUP BY 
    player_id;
 ----------------------------------------------------------------------------------
 -- Proplem 11 Capital Gain/Loss
 SELECT 
    stock_name,
    SUM(
        CASE 
            WHEN operation = 'Buy' THEN -price 
            ELSE price 
        END
    ) AS capital_gain_loss
FROM 
    Stocks
GROUP BY 
    stock_name;
    ----------------------------------------------------------------------
    -- Proplem 12 Second Highest Salary
    SELECT (
    SELECT DISTINCT salary 
    FROM Employee 
    ORDER BY salary DESC 
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
------------------------------------