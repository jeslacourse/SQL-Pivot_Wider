--
-- Wide Data: Duplicated Counts
--      MARKER: What are you counting up? 
--
SELECT 
REPORTING_YEAR, 
   Summer = COUNT(case when TERM LIKE 'Su%' then MARKER end),
   Fall = COUNT(case when TERM LIKE 'Fa%' then MARKER end), 
   Spring = COUNT(case when TERM LIKE 'Sp%' then MARKER end)
from TABLE
WHERE [FILTERS ARE HERE]
GROUP BY REPORTING_YEAR;

-- Wide Data: Distinct Counts
SELECT REPORTING_YEAR, 
    GROUP_1 = COUNT(DISTINCT case when ID IN ('This', 'List') then ID end),
    GROUP_2 = COUNT(DISTINCT case when ID NOT IN ('This', 'List') then ID end)
FROM TABLE
WHERE [FILTERS ARE HERE]
GROUP BY REPORTING_YEAR
