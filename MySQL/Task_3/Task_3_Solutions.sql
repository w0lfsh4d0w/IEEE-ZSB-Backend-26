-- Problem 1:  Invalid Tweets
-- Link: https://leetcode.com/problems/invalid-tweets/description/

select tweet_id from `Tweets` 
where CHAR_LENGTH(content) > 15 

------------------------------------------------------------------