# SQL-Pivot_Wider
Like pivot_wider() but with more SQL. 
And no pivot statements. 

## Using Declared Columns

`SimplePivots.sql`

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


## Using Over-Partition

`PivotWithOverPartition.sql`

Using long data:

| ID  | TERM | COURSE  |
|-----|------|---------|
| 100 | 10   | Math 10 |
| 100 | 20   | Math 20 |
| 100 | 30   | Math 30 |
| 101 | 10   | Math 20 |
| 101 | 20   | Math 30 |

To make course pairs:

 PRIOR_COURSE | LATER_COURSE | COUNT |
|--------------|--------------|-------|
| Math 10      | Math 20      | 1     |
| Math 10      | Math 30      | 1     |
| Math 20      | Math 30      | 2     |
