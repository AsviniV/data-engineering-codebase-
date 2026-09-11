WITH OrderedTimeline AS (
    SELECT 
        ID, Emp_id, DOB, Designation, update_at,
        CAST(update_at AS DATE) AS start_date, 
        LEAD(CAST(update_at AS DATE)) OVER (
            PARTITION BY Emp_id 
            ORDER BY CAST(update_at AS DATE) ASC
        ) AS end_date
    FROM employee_table
)
SELECT 
    ID, Emp_id, DOB, Designation, update_at, start_date, end_date,
    CASE WHEN end_date IS NULL THEN 'Y' ELSE 'N' END AS is_active
FROM OrderedTimeline;
