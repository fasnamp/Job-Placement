create database job;
use job;
select *from job_placement;
alter table job_placement rename to job;
alter table job rename column college_name to college;
alter table job rename column placement_status to status;
alter table job rename column years_of_experience to experience;
select *from job;
#1.	What is the maximum age of candidates in the job placement database?
select max(age) as max_age from job;
#2.	How many unique educational streams are represented in the job placement records?
select count(distinct stream) as unique_stream from job;
#3.	How many candidates have exactly 3 years of experience?
select count(*) as 3_experience from job where experience=3;
#4.	What are the details of job placements for Computer Science students, sorted by highest to lowest salary?
select *from job where stream='computer science' order by salary desc;
#5.	What are the details of candidates who got placed, sorted by highest to lowest salary?
select * from job where status='placed' order by salary desc;
#6.	How many candidates have been successfully placed?
select count(*) as selected from job where status='placed';
#7.	What are the job placement details sorted by the least to most years of experience?
select *from job order by experience;
#8.	What are the job placement details sorted first by highest to lowest years of experience and then by highest to lowest salary?
select * from job order by experience,salary desc;
#9.	What are the job placement details sorted alphabetically by college name?
select * from job order by college;
#10.What are the details (age, stream, years of experience, salary) of candidates whose years of experience are greater than the minimum experience in the dataset and have a salary of 60,000?
select age,stream,experience,salary from job where experience>(select min(experience)from job )and salary=60000 ;
#11.What are the names, ages, streams, and years of experience of placed candidates who belong to the Computer Science stream?
select name,age,stream,experience from job where status='placed' and stream='computer science';
#12.What are the names, ages, and streams of candidates older than 25 who have not been placed?
select name,age,stream from job where status!='placed' and age>25;
#13.What are all the details of job placements?
select *from job;
#14.What are the names, ages, and salaries of female candidates earning more than 50,000?
select name,age,salary,gender from job where gender='female' and salary>50000;
#15.What are the names, ages, streams, and salaries of candidates, along with their salary range categorized as 'Low Salary' (below 25,000), 'Medium Salary' (25,000 to 50,000), and 'High Salary' (above 50,000)?
select name,age,salary,
case
when salary<25000
then 'low salary'
when salary between 25000 and 50000
then 'medium salary'
when salary>50000
then 'high salary'
else 'unknown'
end as salary_range
from job;
#16.What are the names, genders, streams, ages, and years of experience of candidates, along with their job position categorized as 'Fresher' (≤1 year), 'Junior' (<2 years), and 'Senior' (≥2 years)?
select name,gender,stream,age,experience,
case
when experience<=1
then 'fresher'
when experience<2
then 'junior'
when experience>=2
then 'senior'
else 'unknown'
end as job_position
from job;

#17.What is the average salary for each educational stream?
select stream,avg(salary) from job group by stream;
#18.How many candidates belong to each educational stream?
select stream,count(*) candidates from job group by stream;
#19.How many candidates have been placed in each educational stream?
select stream,count(*) candidates from job where status='placed' group by stream;
#20.How many candidates have different years of experience?
select experience,count(*) candidates from job group by experience;
#21.How many candidates are placed and not placed?
select status,count(*) candidates from job group by status;
#22.How many candidates are there in each gender category?
select gender,count(*) candidates from job group by gender;
#23.What is the average years of experience for placed and not placed candidates?
select status,avg(experience) from job group by status;

#24.What are the maximum and minimum years of experience for each educational stream?
select stream,max(experience) max,min(experience) min from job group by stream;
#25.What are the highest, lowest, and average salaries for each educational stream?
select stream,max(salary) max,min(salary) min,avg(salary) avg from job group by stream;
#26.What are the salaries of candidates from the Computer Science stream?
select name,salary,stream from job where stream='computer science';
#27.Which candidates have a salary higher than at least one candidate from the Computer Science stream?
select name,salary,stream from job where salary>any(select salary from job where stream='computer science');
#28.Which candidates from streams other than Computer Science have a salary higher than at least one candidate from the Computer Science stream?
select *from job where stream!='computer science' and salary>any(select salary from job where stream='computer science');
#29.Which candidates from streams other than Information Technology have more years of experience than at least one candidate from the Information Technology stream?
select *from job where stream!='information technology' and experience>any(select experience from job where stream='information technology');
#30.What is the average years of experience for placed and not placed candidates?
select status,avg(experience) from job group by status;
#31.Which streams have more than 10 placed candidates?
select stream , count(*) AS Placed_Candidates from job where status='Placed' group by stream having count(*)>10;
#32.Which streams have at least one candidate with a salary greater than 60,000?
select stream from job where salary>60000 group by stream;
#33.Which streams have at least one candidate with a salary less than 60,000?
select stream from job where salary<60000 group by stream;
#34.Which streams have more than 10 placed candidates for each level of experience, sorted by years of experience?
select stream, experience, count(*) placed_count 
from job where status='placed' group by stream, experience 
having count(*)>10 order by experience;

