SELECT a.employee_id 
FROM Employees a
LEFT JOIN Employees b
on a.manager_id  = b.employee_id 
WHERE b.employee_id is NULL AND a.manager_id is NOT NULL
AND a.salary<30000
order by employee_id 



SELECT employee_id  
FROM Employees
WHERE salary<30000
AND manager_id is NOT NULL
AND manager_id not in (SELECT employee_id
FROM Employees )
 order by employee_id
