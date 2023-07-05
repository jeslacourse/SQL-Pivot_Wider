--
-- Determine 'prior-later' course pairs
--   What classes did students take before [LATER_COURSE]?
--
SELECT 
		PRIOR_COURSE, 
		LATER_COURSE, 
		count(LATER_COURSE) [Count]
FROM
(
  SELECT  A.COURSE PRIOR_COURSE,
		  B.COURSE LATER_COURSE, 
		  row_number() 
	 OVER(PARTITION BY A.ID
          ORDER BY A.COURSE) seq
  FROM [TABLE] AS A 
  INNER JOIN [TABLE] AS B 
    ON A.ID = B.ID
  WHERE A.ENROLLED = 'YES'
	  AND B.ENROLLED = 'YES'
	  AND B.TERM > A.TERM
) pivot_table

GROUP BY 
	PRIOR_COURSE, LATER_COURSE
HAVING count(LATER_COURSE) >=10
ORDER BY LATER_COURSE, [Count] desc
