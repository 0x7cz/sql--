SELECT patient_id , patient_name ,conditions   
FROM 
Patients
where conditions like 'DIAB1%' or '% DIAB1%'