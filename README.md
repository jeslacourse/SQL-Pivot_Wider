# SQL-Pivot_Wider
Like pivot_wider() but with more SQL. 
And no pivot statement. 


```
-- Wide Data: Distinct Counts
SELECT REPORTING_YEAR, 
    GROUP_1 = COUNT(DISTINCT case when ID IN ('This', 'List') then ID end),
    GROUP_2 = COUNT(DISTINCT case when ID NOT IN ('This', 'List') then ID end)
FROM TABLE
WHERE [FILTERS ARE HERE]
GROUP BY REPORTING_YEAR
```

| REPORTING_YEAR | GROUP_1 | GROUP_2 |
|----------------|---------|---------|
| 2020           | 10      | 20      |
| 2021           | 30      | 35      |
| 2022           | 35      | 25      |
