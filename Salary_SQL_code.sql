use salary;
select 
  * 
from 
  salary;
-- change the name of the column for ease of writing code 
ALTER TABLE 
  salary CHANGE COLUMN `Years of Experience` experience INT;
ALTER TABLE 
  salary CHANGE COLUMN `Education Level` education varchar(255);
ALTER TABLE 
  salary CHANGE COLUMN `Job Title` job varchar(255);
-- Let's see how many jobs data do we have 
SELECT 
  DISTINCT job 
from 
  salary;
-- Jobs with more than 100K in salary
Select 
  job, 
  salary 
from 
  salary 
where 
  Salary >= 100000 
ORDER BY 
  Salary DESC;
-- jobs with less than 50K salary 
Select 
  job, 
  salary 
from 
  salary 
where 
  salary <= 50000 
ORDER BY 
  salary DESC;
-- Does more experience make more money in data analysis 
Select 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  salary >= 50000 
  AND job = 'Data Analyst' 
ORDER by 
  experience;
-- How much do entry level data analyst make with little to no experience 
SELECT 
  job, 
  experience, 
  Salary 
FROM 
  salary 
Where 
  experience <= 2 
  AND job = 'Data Analyst' 
ORDER BY 
  experience DESC;
-- Does age matter in the eqation , do younger data analyst with same experience make less money  
SELECT 
  Age, 
  job, 
  experience, 
  Salary 
FROM 
  salary 
Where 
  experience = 2 
  AND job = 'Data Analyst' 
ORDER BY 
  Age;
-- Lokks like in data analysis the experience is more important than age, does it transends to other IT roles 
SELECT 
  Age, 
  job, 
  experience, 
  Salary 
FROM 
  salary 
Where 
  experience = 2 
  AND job = 'Software Engineer' 
ORDER BY 
  Age;
-- Looks like it is the same for all the tech roles , considering Data Analyst & Software Engineer
-- Let's see how much money does managers with little to no experience make 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%manager' 
  AND experience <= 2 
ORDER BY 
  Salary DESC;
-- Looks like the product managers are  making over 100K with less than 2 years of experience.
--  How much money do VPs make in general. 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%VP of%' 
  OR job LIKE '%Chief%' 
  OR job = 'CEO' 
ORDER BY 
  Salary DESC;
-- So there are is no inexperienced executive or they are paid much more than other job classes. 
-- So let's see which jobs makes less than 50K a year 
Select 
  DISTINCT(job), 
  count(job) as CountOfJob 
from 
  salary 
where 
  salary <= 50000 
group by 
  job;
-- Let's which jobs junior level employee make more money. 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%Junior%' 
ORDER BY 
  Salary;
-- Let's see how much money do senior employee make in a perticular jobs. 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%senior%' 
ORDER BY 
  Salary DESC;
-- Let's see what kind of engineer makes the most money. 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%Engineer%' 
ORDER BY 
  Salary;
-- Okay engineer do make a lots of money 
-- Let's see how much money do analysts make. 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%Analyst%' 
ORDER BY 
  Salary;
-- how much do people in HR and marketing make 
select 
  age, 
  job, 
  experience, 
  Salary 
From 
  salary 
Where 
  job LIKE '%Marketing%' 
  OR job LIKE '%HR%' 
ORDER BY 
  Salary;
-- Now that we have compelted corolation between salary , title and experience, let's see coroletion between how much money a person make related to their education , age and expereince 
-- How many education categories do we have 
SELECT 
  DISTINCT education 
from 
  salary;
-- Average , Lowest and highest salary earned by people owning various degrees 
SELECT 
  education, 
  avg(salary) AS averageHighschoolerSalary, 
  MAX(salary) AS maximumsalary, 
  MIN(salary) AS LowestSalary 
from 
  salary 
Where 
  education is not null 
GROUP BY 
  education;
-- soo the Salary doesn't corolate with education directly , let's look at the professions and its impact on ones salary 
select 
  education, 
  job, 
  salary 
from 
  salary 
where 
  education Like "%Bachelor's%" 
  AND job LIKE '%Engineer%' 
ORDER BY 
  salary DESC;
select 
  education, 
  job, 
  salary 
from 
  salary 
where 
  education Like "%Bachelor's%" 
  AND job = 'Marketing Coordinator' 
ORDER BY 
  salary DESC;
-- So let's compare people having a masters degree and working in high paying and low paying jobs 
select 
  education, 
  job, 
  salary 
from 
  salary 
where 
  education Like "%Master's" 
  OR education like "%Master's Degree%" 
  AND job LIKE '%Engineer%' 
ORDER BY 
  salary;
-- Let's compare an engineers who has done masters with someone with low paying jobs with masters 
Select 
  education, 
  job, 
  salary 
from 
  salary 
where 
  (
    education = "Master's" 
    OR education = "Master's Degree"
  ) 
  AND job = 'Marketing Coordinator' 
ORDER BY 
  salary;
-- Let's see the corolation with another low paying job 
SELECT 
  education, 
  job, 
  salary 
FROM 
  salary 
WHERE 
  (
    education = "Master's" 
    OR education = "Master's Degree"
  ) 
  AND job = 'Sales Representative' 
ORDER BY 
  salary;
-- so it truns out that people with masters who ae working with inhertitenly low paying jobs are making lower amount of money. 
-- So there is no corolation directly with jobs and education , although entry level jobs for people with masters compared with entry level jobs for bachelors degree can vary but not by much especially in tech
-- let's see corolation with high salary and experience 
Select 
  education, 
  count(education) as MoresalaryMoreExperience 
from 
  salary 
where 
  experience >= 10 
  AND salary >= 150000 
group by 
  education;
-- so their is a direct corolation with more experience and higher salary 
-- let's try adjusting it for the low paying job 
Select 
  education, 
  count(education) as MoresalaryMoreExperience 
from 
  salary 
where 
  experience >= 10 
  AND salary >= 150000 
  AND job Like '%Sales%' 
group by 
  education;
-- So there are very fewer peopl who earn lots of money in sales, maybe they move up the ranks or change carrier as there isnt much room for growth in sales, Let's see if the engeneering gives the same response 
Select 
  education, 
  count(education) as MoresalaryMoreExperience 
from 
  salary 
where 
  experience >= 10 
  AND salary >= 150000 
  AND job Like '%Engineer%' 
group by 
  education;
-- So people with much more experience in engineering earn more than in sales , maybe enginering as an industry makes more money. 
-- So having more experience in engineering makes more money than in sales , where education takes a small role especially in the starting. 
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Okay wait for a sec I am hungry I wanna take my luch now.  
-- cool I am back now 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- lets see the corolation of age and income. 
Select 
  age, 
  job, 
  salary, 
  experience 
from 
  salary 
where 
  age <= 25 
  AND salary >= 10000 
ORDER BY 
  salary desc;
-- There are a lot of people who are below 25 and earn good salary, so that means age is not directly coroleted with earning, job has more to do with it, just like the education.    
-- A lot of people under 25 who makes more than a 100K a year are in tech , other with more experience are in manegarial positions, Data analysts and Back end developer make the most money even with less experience.  
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Now to the most important part, let's analyze the relation between gender , education , experience and salary. 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Relationship between Men and Women who are engineering and under the age of 25. 
Select 
  Gender, 
  Count(Gender) AS WorkingInEngineering 
from 
  salary 
Where 
  job LIKE '%Engineer%' 
  AND age <= 25 
GROUP BY 
  Gender;
-- We can clearly see that there are more men in engeneering than women. 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Let's do some salary analysis, Gender analysis of People who earns more than 100K a year  
Select 
  Gender, 
  Count(Gender) AS HigherEarning 
From 
  Salary 
Where 
  salary >= 100000 
Group by 
  Gender;
-- Now that we know that Gender disparity , we can see it more in details . 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Let's see gender disparity between men and women who has a bachelor's degree and some experience . 
Select 
  Gender, 
  Count(Gender) AS HigherEarning 
From 
  Salary 
Where 
  salary >= 100000 
  AND education LIKE "%Bachelor's%" 
  AND experience >= 5 
Group by 
  Gender;
-- We know the gender income disparity even in population with a bachelor's degree and 5 years of experince 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Now let's see the income disparity between men and women who work in Sales and Marketing 
Select 
  Gender, 
  Count(Gender) AS WorkingInEngineering 
from 
  salary 
Where 
  (
    job LIKE '%Marketing%' 
    OR job LIKE '%Sales%'
  ) 
  AND experience >= 5 
GROUP BY 
  Gender;
-- Women seems to be flourishing more in non-tech sector. 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Now let's see the average money earned by men and women in tech 
Select 
  Gender, 
  AVG(salary) as AverageEarning 
from 
  salary 
Where 
  (
    education LIKE "%Bachelor's%" 
    OR education LIKE "%Master's%"
  ) 
  AND (
    job LIKE "%Engineer%" 
    OR job LIKE "%Analyst%"
  ) 
GROUP BY 
  Gender;
-- This is the income differnece between men and working in tech. 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
-- Now let's see the average income between men and women working in sales and marketing 
Select 
  Gender, 
  AVG(salary) as AverageEarning 
from 
  salary 
Where 
  (
    education LIKE "%Bachelor's%" 
    OR education LIKE "%Master's%"
  ) 
  AND (
    job LIKE "%Sales%" 
    OR job LIKE "%Marketing%"
  ) 
GROUP BY 
  Gender;
select 
  * 
from 
  salary;
-- Now let's create Some CTEs to understand this data properly because Basic data cleaning project is over -- 
WITH RankedSalaries AS (
  SELECT 
    *, 
    PERCENT_RANK() OVER (
      PARTITION BY `Job` 
      ORDER BY 
        Salary
    ) AS PercentileRank 
  FROM 
    salary
) 
SELECT 
  Age, 
  Gender, 
  `education` AS Education, 
  `job` AS job, 
  `experience` AS experience, 
  Salary, 
  PercentileRank 
FROM 
  RankedSalaries;
-- This code will create a CTE that holds data of What job , education and gender fall under which percentile of earnings according to the data -- 
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
WITH ExperienceBrackets AS (
  SELECT 
    *, 
    CASE WHEN `experience` BETWEEN 0 
    AND 5 THEN '0-5 Years' WHEN `experience` BETWEEN 6 
    AND 10 THEN '6-10 Years' WHEN `experience` BETWEEN 11 
    AND 15 THEN '11-15 Years' ELSE '15+ Years' END AS ExperienceBracket 
  FROM 
    salary
), 
-- THis will create a CTE that will give us an idea of how experience in different fields and with different education yeild salaries-- 
-- THis will also show us average salary per job per experience bracket and also previous age group average salary and also salary growth with exerience-- 
AverageSalaries AS (
  SELECT 
    `job` AS Job, 
    ExperienceBracket, 
    AVG(Salary) AS AvgSalary 
  FROM 
    ExperienceBrackets 
  GROUP BY 
    Job, 
    ExperienceBracket
) 
SELECT 
  Job, 
  ExperienceBracket, 
  AvgSalary, 
  LAG(AvgSalary) OVER (
    PARTITION BY Job 
    ORDER BY 
      ExperienceBracket
  ) AS PrevAvgSalary, 
  ROUND(
    100 * (
      AvgSalary - LAG(AvgSalary) OVER (
        PARTITION BY Job 
        ORDER BY 
          ExperienceBracket
      )
    ) / LAG(AvgSalary) OVER (
      PARTITION BY Job 
      ORDER BY 
        ExperienceBracket
    ), 
    2
  ) AS SalaryGrowthPercentage 
FROM 
  AverageSalaries;
