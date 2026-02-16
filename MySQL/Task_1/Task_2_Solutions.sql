-- Problem 1: Recyclable and Low Fat Products
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/

select product_id from `Products`  
where low_fats='Y' and recyclable='Y'

-----------------------------------------------------------------
-- Problem 2: Big Countries
-- Link: https://leetcode.com/problems/big-countries/

select name,population,area from `World`
where area >=3000000 OR population >= 25000000;

---------------------------------------------------------

-- Problem 3: Find Customer Referee
-- Link: https://leetcode.com/problems/find-customer-referee/

select name from `Customer`
WHERE referee_id != 2 OR referee_id IS NULL;