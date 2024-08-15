SELECT 
    Department 
    Employee 
    Salary
FROM    
    (SELECT
        d.name Department,
        e.name Employee,
        e.salary Salary,
        RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary desc) rank
    FROM Employee  e
    LEFT JOIN Department  d
    ON e.departmentId  = d.id      
    )
WHERE rank<=3

