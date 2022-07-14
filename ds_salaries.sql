------DATA EXPLORATION------

-- Open the Table

Select *
From ds_salaries
Order By salary_in_usd desc

-- Most type of experience level

Select experience_level, count(*) * 100.0 / sum(count(*)) over() as Percentage_Total
From ds_salaries
Group By experience_level 
Order By percentage_total desc

-- How many people work full time?

Select employment_type, count(employment_type) as Total
From ds_salaries
Group By employment_type
Order by total desc

-- Most popular jobs with salary

Select job_title, count(job_title) as Total, convert(int, round(avg(salary_in_usd), 2)) as Average_Salary
From ds_salaries
Group By job_title
Order by average_salary desc

-- Remote ratio per year 

Select work_year, remote_ratio, count(remote_ratio) as Total
From ds_salaries
Group By remote_ratio, work_year

-- Most employee residence 

Select company_location, count(company_location) as Total
From ds_salaries
Group By company_location
Order by total desc

-- 
