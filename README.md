# HR_ANALYTICS
# HR Analytics Dashboard | Employee Attrition Analysis

## Project Overview

This project focuses on analyzing employee data to understand workforce distribution, employee attrition patterns, and factors influencing employee retention.

Using Excel, SQL Server, DAX, and Power BI, I transformed employee data into an interactive HR Analytics Dashboard to help HR teams identify attrition trends and make data-driven workforce decisions.

The dashboard provides insights into employee demographics, department-wise attrition, job roles, job satisfaction, and employee performance.

## Business Objectives

- Analyze overall employee attrition and retention rates.
- Identify departments experiencing higher employee attrition.
- Understand attrition patterns across gender and job roles.
- Examine the relationship between job satisfaction and employee attrition.
- Analyze workforce distribution across different job roles.
- Identify employee retention patterns based on years at the company.

## Dataset Overview

- Total Employee Records: 1,470
- Total Attributes: 35
- Total Employees Who Left: 237
- Active Employees: 1,233

The dataset contains employee demographics, job information, compensation, performance ratings, satisfaction levels, and attrition status.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning and preprocessing |
| SQL Server | Data storage, querying, and analysis |
| Power BI | Interactive dashboard development |
| DAX | KPI calculations and analytical measures |

## Data Preparation

1. Imported the HR employee dataset into Excel.
2. Checked and handled missing values.
3. Reviewed data consistency and column formats.
4. Loaded the cleaned dataset into SQL Server.
5. Created SQL queries to analyze employee attrition and workforce metrics.
6. Connected the HR_ANALYTICS table to Power BI.

## Key Performance Indicators (KPIs)

| KPI | Result |
|---|---:|
| Total Employees | 1,470 |
| Total Attrition | 237 |
| Active Employees | 1,233 |
| Attrition Rate | 16.12% |
| Average Employee Age | 36.92 |
| Average Monthly Income | 6,502.93 |

## Power BI Dashboard

The interactive dashboard includes the following visualizations:

### 1. Attrition by Department and Gender
Analyzes employee attrition patterns across departments and gender categories.

### 2. Total Employees by Job Role
Displays workforce distribution across different job roles using a donut chart.

### 3. Attrition Rate by Job Role
Identifies job roles experiencing higher employee attrition.

### 4. Attrition Rate by Job Satisfaction
Examines attrition patterns across different employee job satisfaction levels.

### 5. Attrition Rate by Years at Company
Analyzes employee attrition patterns based on employee tenure.

### 6. Attrition by Performance Rating and Department
Compares attrition patterns across performance ratings and departments.

### Interactive Filters
- Department
- Gender

## Key Business Insights

Based on the analysis:

- Overall employee attrition stands at 16.12%.
- Employees aged 18–25 have a significantly higher attrition rate of 39.18%.
- Employees working overtime have a higher attrition rate (30.53%) compared with employees not working overtime (10.44%).
- Employees with monthly income below 3,000 have a higher attrition rate (28.61%) compared with employees earning above 10,000 (8.90%).
- Sales Representatives have a particularly high attrition rate of 39.76%.
- Employees travelling frequently have an attrition rate of 24.91%.

## DAX Measures

Some of the key DAX measures used in the dashboard:

**Total Employees**
```dax
Total Employees =
DISTINCTCOUNT(HR_ANALYTICS[EmployeeNumber])
```

**Total Attrition**
```dax
Total Attrition =
CALCULATE(
    COUNTROWS(HR_ANALYTICS),
    HR_ANALYTICS[Attrition] = TRUE()
)
```

**Active Employees**
```dax
Active Employees =
[Total Employees] - [Total Attrition]
```

**Attrition Rate**
```dax
Attrition Rate =
DIVIDE(
    [Total Attrition],
    [Total Employees],
    0
)
```

**Average Age**
```dax
Average Age =
AVERAGE(HR_ANALYTICS[Age])
```

## Business Recommendations

Based on the findings, organizations can consider:

- Developing targeted retention strategies for younger employees.
- Reviewing overtime policies to improve employee work-life balance.
- Investigating compensation structures for employees in lower income groups.
- Evaluating employee satisfaction and engagement initiatives.
- Conducting focused retention reviews for high-attrition job roles.

## Project Learnings

Through this project, I gained practical experience in:

- Cleaning and preparing structured employee datasets.
- Writing SQL queries for HR data analysis.
- Creating DAX measures and calculated columns.
- Developing interactive Power BI dashboards.
- Designing KPI cards and analytical visualizations.
- Translating data findings into actionable business insights.

## Conclusion

This project demonstrates how data analytics can support HR decision-making by identifying employee attrition trends, understanding workforce patterns, and highlighting potential employee retention challenges.

The dashboard transforms raw employee data into meaningful business insights that can support data-driven workforce planning.

---

**Skills Demonstrated:** Data Cleaning | Excel | SQL | Power BI | DAX | HR Analytics | Data Visualization | Business Insights
