/* Subqueries*/

select * from survey;

-- Display student_id, full_name and university_id for all students who go to the same university as student_id 6043
select university_id 
from survey
where student_id = 6043;

select student_id, full_name, university_id
from survey
where university_id = (select university_id 
									from survey
									where student_id = 6043);
                                    
-- Display the survey_id and survey_date for all surveys that were taken on the same date as survey_id 532                                    
select survey_date
from survey
where survey_id = 532;

select survey_id, survey_date
from survey
where survey_date = ( select survey_date
										from survey
										where survey_id = 532);    
                                        
-- Display the student_id, full_name and height for all students who are taller than Josephina Athow                                        
select height_cm
from survey
where full_name = 'Josephina Athow';

select survey_id, full_name, height_cm   
from survey
where height_cm > ( select height_cm
from survey
where full_name = 'Josephina Athow');      

-- Display the student_id, full_name and age for all students younger than the student who filled survey number 10
select age from survey
where survey_id =10;

select student_id, full_name, age   
from survey
where age < ( select age from survey
where survey_id =10); 

-- Display the student_id, full_name, and father_job, for all students whose father works in the same job as (the father of) Christina Rediers
  select father_job
  from survey
  where full_name = 'Christina Rediers';
  
  select student_id, full_name, father_job
  from survey
  where father_job = (  select father_job
  from survey
  where full_name = 'Christina Rediers');
  
  -- Display the student_id, full_name, father_job, and mother_job for all students whose: a. Father works in the same job as (the father of) Christina Rediers and b. Mother works in the same job as (the mother of) Christina Rediers 
  select mother_job, father_job
  from survey
  where full_name = 'Christina Rediers';
  
  select student_id, full_name, mother_job, father_job
  from survey
  where mother_job = (select mother_job from survey where full_name = 'Christina Rediers') 
  AND (select  father_job from survey where full_name = 'Christina Rediers');
  
  -- Display the student_id, full_name and age for all students older than the average  
  select avg(age) from survey;
  
  select student_id, full_name, age
  from survey 
  where age > (select avg(age) from survey);
  
  -- Display the student_id, full_name, age and height for all students older than the average, and taller than the average
  select avg(age) AS average_age, avg(height_cm) AS average_height from survey;
  
  select student_id, full_name, age, height_cm
  from survey
  where age > ( select avg(age) AS average_age from survey) 
  AND ( select avg(height_cm) AS average_height from survey);