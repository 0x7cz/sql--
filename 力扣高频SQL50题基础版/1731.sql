SELECT b.employee_id,b.name,
count(1) as reports_count ,
round(avg(a.age),0) as  average_age 
FROM Employees a
inner join  Employees b
on a.reports_to = b.employee_id   
GROUP by b.employee_id,b.name
order by employee_id 