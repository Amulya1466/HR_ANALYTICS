SELECT * from HR_ANALYTICS

--Total Employee count
select 
count(*) as Total_employees
from HR_ANALYTICS;

--Duplicate records
select EmployeeNumber,
count(*) as Records_count
from HR_ANALYTICS
group by EmployeeNumber
having count(*) >1;

--Count of female emoloyees
select gender,
count(*) as employee_count
from HR_ANALYTICS
where gender = 'female'
group by Gender;

--Count of employee(male)
select gender,
count(*) as employee_count
from HR_ANALYTICS
where gender = 'male'
group by Gender;

--Department wise count
select Department,
count(*) as Employee_count
from HR_ANALYTICS
group by Department
order by Employee_count desc;

--Employee distribution by job roles
select Jobrole,
count(*) as Employee_count
from HR_ANALYTICS
group by JobRole
order by Employee_count;

--avereage salary by department 
select department,
avg(monthlyincome) as AVG_income
from HR_ANALYTICS
group by Department		
order by AVG_income desc;

--Highest income among the job roles
select jobrole,
avg(MonthlyIncome)as avg_income
from HR_ANALYTICS
group by jobrole
order by AVG_Income desc;

--employee distribution by age group
select
case 
    when age < 25 then 'below 25'
    when age between 25 and 35 then '25-35'
    when age between 35 and 45 then '35-45'
    when age between 45 and 60 then '45-60'
    end as age_group,
count(*) as Employee_count
from HR_ANALYTICS
group by case 
    when age < 25 then 'below 25'
    when age between 25 and 35 then '25-35'
    when age between 35 and 45 then '35-45'
    when age between 45 and 60 then '45-60'
    end
order by Employee_count desc;

--Avereage Attrition by department
select Department,
sum ( case 
       when attrition =1 then 1 else 0 end) as Employee_left,
   sum(case    when attrition = 0 then 1 else 0 end) as Employee_Stayed,
 Cast  ( sum( case when attrition = 1 then 1 else 0 end ) /
      count(*) * 100.0  as decimal(10,2)
      ) as Attrition_rate
from HR_ANALYTICS
group by Department;


SELECT
    Department,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    COUNT(*) AS Total_Employees,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Attrition_Rate
FROM HR_ANALYTICS
GROUP BY Department
ORDER BY Attrition_Rate DESC;

--Attrition by age group
select 
case when age < 25 then '18-25'
     when age between 25 and 35 then '25-35'
     when age between 35 and 55 then '35-55'
     when age > 55 then 'above 55' 
     end as age_group ,
     count(*) as employee_count,
sum( case when attrition= 1 then 1 else 0 end ) as Employee_left ,
CAST(
        SUM(CASE
            WHEN attrition = 1 THEN 1.0
            ELSE 0
        END) / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Attrition_rate
from HR_ANALYTICS
group by 
    case when age < 25 then '18-25'
     when age between 25 and 35 then '25-35'
     when age between 35 and 55 then '35-55'
     when age > 55 then 'above 55' 
     end
order by Attrition_rate desc;

-- Attrition by job role
select jobrole,
count(*) as Employee_count,
sum(case when attrition = 1 then 1 else 0 end ) as employee_left,
sum(case when attrition =0 then 1 else 0 end) as employee_stayed,
CAST ( 
      sum(case when attrition =1 then 1.0 else 0 end) / count(*) * 100.0 as decimal(10,2)
      ) as attrition_rate
from HR_ANALYTICS
group by JobRole
order by attrition_rate desc;

--Attrition by Overtime
select overtime,
count(*) as Employee_count,
sum( case when attrition = 1 then 1 else 0 end) as Employee_left,
CAST(
    sum(case when attrition =1 then 1.0 else 0 end)/ count(*) * 100.0 as decimal(10,2)
    ) as attrition_rate
from HR_ANALYTICS
Group by OverTime
order by attrition_rate desc;

--Attrition by Monthly Income
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        ELSE '10000+'
    END AS Income_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Attrition_Rate

FROM HR_ANALYTICS
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome BETWEEN 3000 AND 5999 THEN '3000-5999'
        WHEN MonthlyIncome BETWEEN 6000 AND 9999 THEN '6000-9999'
        ELSE '10000+'
    END

ORDER BY Attrition_Rate DESC;

--Attrition by Job Satisfaction
SELECT Jobsatisfaction,
count(*) as Employee_count,
sum(case when attrition = 1 then 1 else 0 end) as Employee_left,
CAST(
   sum(case when attrition = 1 then 1.0 else 0 end)/count(*) *100.0 as decimal(10,2)
   ) as Attrition_rate
from HR_ANALYTICS
group by JobSatisfaction
order by Attrition_rate desc;

--gender wise attrition
select gender,
count(*) as Employee_count,
sum(case when attrition =1 then 1 else 0 end) as employee_left,
CAST(
     sum(case when attrition =1 then 1.0 else 0 end)/count(*) * 100.0 as decimal(10,2)
     ) as attrition_rate
from HR_ANALYTICS
group by gender 
order by attrition_rate desc ;

--Business Travel-wise Attrition
Select businesstravel,
count(*) as Employee_count,
sum(case when attrition =1 then 1 else 0 end) as employee_left,
CAST(
     sum(case when attrition =1 then 1.0 else 0 end)/count(*) * 100.0 as decimal(10,2)
     ) as attrition_rate
from HR_ANALYTICS
group by BusinessTravel
order by attrition_rate desc;

--Years at Company vs Attrition
select
case
WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE 'Above 10 Years'
    END AS Experience_Group,

count(*) as employee_count,
sum(case when attrition =1 then 1 else 0 end) as employee_left,
CAST(
     sum(case when attrition =1 then 1.0 else 0 end)/count(*) * 100.0 as decimal(10,2)
     ) as attrition_rate
from HR_ANALYTICS
group by case
WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE 'Above 10 Years'
    END 
order by attrition_rate desc;

--Work-Life Balance vs Attrition
select worklifebalance,
count(*) as employee_count,
sum(case when attrition =1 then 1 else 0 end) as employee_left,
CAST(
     sum(case when attrition =1 then 1.0 else 0 end)/count(*) * 100.0 as decimal(10,2)
     ) as attrition_rate
from HR_ANALYTICS
group by WorkLifeBalance
order by attrition_rate desc;

--Education-wise Attrition

SELECT
    Education,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Attrition_Rate

FROM HR_ANALYTICS
GROUP BY Education
ORDER BY Education;


--Department and Job Role comparison

SELECT
    Department,
    JobRole,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Attrition_Rate

FROM HR_ANALYTICS
GROUP BY Department, JobRole
ORDER BY Attrition_Rate DESC;

--overall attrition
SELECT
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS Employees_Left,

    SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END)
        AS Employees_Stayed,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100
        AS DECIMAL(10,2)
    ) AS Overall_Attrition_Rate,

    CAST(AVG(CAST(Age AS DECIMAL(10,2))) AS DECIMAL(10,2))
        AS Average_Age,

    CAST(AVG(CAST(MonthlyIncome AS DECIMAL(10,2))) AS DECIMAL(10,2))
        AS Average_Monthly_Income,

    CAST(AVG(CAST(YearsAtCompany AS DECIMAL(10,2))) AS DECIMAL(10,2))
        AS Average_Years_At_Company

FROM HR_ANALYTICS;



