# Write your MySQL query statement below
SELECT Request_at AS Day ,ROUND(
 SUM(Status = 'cancelled_by_driver' OR Status = 'cancelled_by_client') /count(*),  2) 
AS 'Cancellation Rate' 
FROM 
Trips tp, Users us 
WHERE us.Users_id = Client_id AND 
      us.Banned = 'No' AND 
      tp.Request_at >= '2013-10-01' AND tp.Request_at <= '2013-10-03'  
GROUP BY 
      tp.Request_at 