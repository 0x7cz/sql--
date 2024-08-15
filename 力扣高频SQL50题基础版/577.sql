SELECT name ,bonus 
FROM Employee  a
LEFT JOIN Bouns b
on a.empId = b.empId       
WHERE Bouns < 1000 OR Bouns is NULL