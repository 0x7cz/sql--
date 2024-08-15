SELECT a.student_id,a.student_name,c.subject_name,sum(
    CASE WHEN b.subject_name is NULL then 0
    ELSE 1 END
) as attended_exams 
FROM Students a 
LEFT join Subjects c 
on 1=1
LEFT JOIN Examinations b
on a.student_id = b.student_id   
and  b.subject_name=c.subject_name
where c.subject_name is not NULL 
GROUP by a.student_id,a.student_name,c.subject_name
ORDER by student_id,subject_name 