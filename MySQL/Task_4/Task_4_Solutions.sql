-- Proplem 1 combine-two-tables
select p.`firstName` , p.`lastName` , a.city , a.state
from `Person` as p left join `Address` as a
on p.`personId` = a.`personId`
-----------------------------------------------------------------------------

-- Proplem 2 replace-employee-id-with-the-unique-identifier
select emn.unique_id , em.name from `Employees`
 as em left join `EmployeeUNI` emn 
on em.id= emn.id

--------------------------------------------------------------------------------

-- Proplem 3 customer-who-visited-but-did-not-make-any-transactions
select distinct customer_id ,COUNT(v.visit_id) AS count_no_trans
from `Visits` v left join `Transactions` t
on t.visit_id=v.visit_id
where t.visit_id  is null
group by v.customer_id

------------------------------------------------------------------------------------

-- Proplem 4  Project Employees I
select project_id , round(avg(experience_years),2)
  as average_years from `Employee` as em right join `Project` as pr
on em.employee_id= pr.employee_id
group by project_id
-----------------------------------------------------------------------------------------
-- Proplem 5 sales-person

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);
------------------------------------------------------------------------------------------

-- Proplem 6 Rising Temperature
select w1.id from `Weather` as w1
inner join `Weather` w2
on DATEDIFF(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature
------------------------------------------------------------------------------------------

-- Proplem 7 Average Time of Process per Machine
select
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM 
    Activity a1
JOIN 
    Activity a2 ON a1.machine_id = a2.machine_id 
                AND a1.process_id = a2.process_id
WHERE 
    a1.activity_type = 'start' 
    AND a2.activity_type = 'end'
GROUP BY 
    a1.machine_id;

-------------------------------------------------------------------------------------------

-- Proplem 8 students-and-examinations
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e ON s.student_id = e.student_id 
                   AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;
    --------------------------------------------------------------------------------------

-- Proplem 9 managers-with-at-least-5-direct-reports
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(id) >= 5
);
--------------------------------------------------------------------------------
-- Proplem 10 Confirmation Rate
SELECT 
    s.user_id, 
    ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(c.user_id), 0), 2) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c ON s.user_id = c.user_id
GROUP BY 
    s.user_id;

    -----------------------------------------------------

-- Proplem 11 
SELECT 
    product_id, 
    year AS first_year, 
    quantity, 
    price
FROM 
    Sales
WHERE 
    (product_id, year) IN (
        SELECT 
            product_id, 
            MIN(year)
        FROM 
            Sales
        GROUP BY 
            product_id
    );
    -----------------------------------------------------------------
    -- Proplem 12 
    SELECT 
    u.user_id AS buyer_id, 
    u.join_date, 
    COUNT(o.order_id) AS orders_in_2019
FROM 
    Users u
LEFT JOIN 
    Orders o ON u.user_id = o.buyer_id AND YEAR(o.order_date) = 2019
GROUP BY 
    u.user_id, u.join_date;