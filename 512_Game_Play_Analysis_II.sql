#Solution 1
SELECT player_id, device_id
FROM
(
    SELECT player_id, device_id,
    DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS 'r'
    FROM Activity
) a
WHERE a.r = 1


#Solution 2
SELECT a.player_id, a.device_id
FROM Activity a
JOIN (SELECT player_id, MIN(event_date) AS event_date FROM Activity GROUP BY player_id) b
ON a.event_date = b.event_date
AND a.player_id = b.player_id
