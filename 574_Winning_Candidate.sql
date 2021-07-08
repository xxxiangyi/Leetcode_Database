SELECT Name
FROM Candidate c JOIN Vote v
ON c.id = v.CandidateId
GROUP BY v.CandidateId
ORDER BY COUNT(v.CandidateId) DESC
LIMIT 1