SELECT project_id,avg(experience_years) as average_years
FROM Employee e
RIGHT JOIN Project p
on e.employee_id = p.employee_id 
GROUP BY project_id  

