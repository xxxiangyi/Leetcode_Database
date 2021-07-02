#Solution 1
SELECT DISTINCT a.seat_id
FROM cinema a, cinema b
WHERE a.free = 1
AND b.free = 1
AND abs(a.seat_id - b.seat_id) = 1
ORDER BY seat_id


#Solution 2
SELECT DISTINCT seat_id
FROM cinema
WHERE free = 1
AND (
    seat_id + 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
    OR
    seat_id - 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
)
ORDER BY seat_id