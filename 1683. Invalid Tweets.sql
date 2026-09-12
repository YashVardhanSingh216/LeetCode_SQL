-- 1683. Invalid Tweets.sql

# Write your MySQL query statement below

SELECT tweet_id FROM Tweets
WHERE length(content) > 15

-- length(content) -> counts the spaces also
