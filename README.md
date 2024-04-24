# HR_Dashboard_MySQL_PowerBI
Data cleaning in MySQL and creating Power BI Reports

## Table of Contents
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools](#tools)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Data Visualization](#data-visualization)
- [Results and Findings](#results-and-findings)

### Project Overview
---
This data analysis project aims to provide insights into employee information, including headcount, turnover rates, tenure, gender, race, age group distribution, etc. The objective of this projects was to clean and analyze data in MySQL and visualize the output using Power BI, helping users understand the company's employee' .

<img width="707" alt="image" src="https://github.com/irenhajnal/HR_Dashboard_MySQL_PowerBI/assets/122035130/68eb0cf4-cd73-4a63-9e76-1e7d9de00331">
<img width="709" alt="image" src="https://github.com/irenhajnal/HR_Dashboard_MySQL_PowerBI/assets/122035130/d282a0cb-5e35-416f-9d4a-59e4002fad7a">

### Data Source
HR Data: The dataset used for this analysis is the "Human Resources.xlsx" file containing HR data with over 22,000 rows from year 2000 to 2020.
After importing the original data contained 13 columns as follows:
|Column Name|Data Type|
|-----------|----------|
|ï»¿id|text|
|first_name|text|
|last_name|text|	
|birthdate|text|
|gender|text|
|race|text|
|department|text|
|jobtitle|text|
|location|text|
|hire_date|text|
|termdate|text|
|location_city|text|
|location_state|text|


### Tools
- SQL - Data Cleaning and Data Analyis
- Power BI - Creating Reports

### Data Cleaning and Preparation
In the initiaal data preparation phase, I performed the following tasks:
1. Data loading and inspection
2. Handling missing values
3. Data cleaning and formatting
   
Some SQL queries from my data cleaning and formatting
  - Changed column name to remove the special characters
```sql 
    ALTER TABLE hr
    CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL
```
- Converted the dates in the table from text to a standard date format and changed the data type from text to date.
```sql 
    UPDATE hr
    SET birthdate = CASE 
    			WHEN birthdate LIKE '%/%'THEN DATE_FORMAT(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
          WHEN birthdate LIKE '%-%'THEN DATE_FORMAT(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
      ELSE NULL
      END;

    ALTER TABLE hr
    MODIFY COLUMN birthdate DATE;
```
   - Converted the termdate data type from Date and Time format to DATE format
```sql 
    UPDATE hr
    SET termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%s UTC'))
    WHERE termdate IS NOT NULL AND termdate !='';
    
    ALTER TABLE hr
    MODIFY COLUMN termdate DATE;
```
- Added a new column to calculate the age for each employee

```sql 
ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR,birthdate, CURDATE());
```

### Questions answered in SQL
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

- SQL query to answer the *How has the company's employee count changed over time based on hire and term dates?* questions.

```sql
SELECT
	  year,
    hires,
    terminations,
    hires-terminations AS net_change,
   round((hires-terminations)/hires*100,2) AS net_change_percent
FROM (
	SELECT
		YEAR(hire_date) AS year,
        count(*) AS hires,
        sum(CASE WHEN termdate IS NOT NULL AND termdate <=curdate() THEN 1 ELSE 0 END) AS terminations
	FROM
		hr
	GROUP BY
		YEAR(hire_date)) AS subquery
ORDER BY year ASC;
```
    


### Data Visualization
The data sources for developing the dashboard in Power BI are the .csv files exported from MySQL.

#### Charts

  1.	Average Lenght of employment(Years): A card illustrating the the average length of employment for terminated employees.
  2.	Employee Distribution by State: Shows the distribution of employees across different states using the map chart to visualize the distribution geographically. The size of the buble ...
  3.	Gender Distribution: Presents the contribution of various car colors to the YTD total sales through a pie chart.
  4.	Headquarters vs Remote: A donut chart displaying the distribution of Headquarter workers vs. remote workers.
  5.	Headcount % change (2000 - 2020): A line chart that displays the headcount change trend over years. 
  6.	Race Distributon: A clustered bar chart
  7.	Age Group Distribution by Gender
  8.	Age Group Distributon
  9.	Termination Rates by Department
  10.	Gender Distribution by Department

### Results and Findings
The analysis results are summarized as follows:
1. The average length of employment for terminated employees is around 10 years.
2. A large number of employees come from the state of Ohio.
3. There are more male employees
4. A large number of employees work at the headquarters versus remotely.
5. The net change in employee headcount has increased over the years.
6. White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
7. The youngest employee is 21 years old and the oldest is 58 years old
8. 6 age groups were created (24-, 25-34, 35-44, 45-54, 55-64, 65+). A large number of employees were between 35-44 followed by 25-34  while the smallest group was 55-64.
9. The gender distribution across departments is fairly balanced but there are generally more male than female employees.
10. The Auditing department has the highest turnover rate followed by Legal. The lowest turn over rates are in the Business Developement and Marketing departments.
11. The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

## Reference
Guided Project: [Youtube](https://www.youtube.com/watch?v=PzyZI9uLXvY)

