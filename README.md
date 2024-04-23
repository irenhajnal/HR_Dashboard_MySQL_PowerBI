# HR_Dashboard_MySQL_PowerBI
Data cleaning in MySQL and creating Power BI Reports

## Table of Contents
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools](#tools)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Data Visualization](#data-visualization)
- [Results and Findings](#results-and-findings)
- [Recomendations](#recomendations)
- [Limitations](#limitations)

### Project Overview
---
This data analysis project aims to provide insights into employee information, including headcount, turnover rates, tenure, gender, race, age group distribution, etc. The objective of this projects was to clean and analyze data in MySQL and visualize the output using Power BI, helping users understand the company's employee' .

<img width="707" alt="image" src="https://github.com/irenhajnal/HR_Dashboard_MySQL_PowerBI/assets/122035130/68eb0cf4-cd73-4a63-9e76-1e7d9de00331">
<img width="709" alt="image" src="https://github.com/irenhajnal/HR_Dashboard_MySQL_PowerBI/assets/122035130/d282a0cb-5e35-416f-9d4a-59e4002fad7a">

### Data Source
HR Data: The dataset used for this analysis is the "Human Resources.xlsx" file containing HR data with over 22,000 rows from year 2000 to 2020.
The original data containes 13 columns as follows:
id
first_name
last_name	birthdate
gender	race
department
jobtitle
location
hire_date
termdate
location_city
location_state



### Tools
- SQL - Data Cleaning and Data Analyis
- Power BI - Creating Reports

### Data Cleaning and Preparation
In the initiaal data preparation phase, I performed the following tasks:
1. Data loading and inspection
2. Handling missing values
3. Data cleaning and formatting

### Data Cleaning

### Data Analysis in SQL
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

### Data Visualization
---
#### KPI’s
The dashboard provides insights into key performance indicators (KPIs) related to the sales data. This enables users to make informed decisions, monitor their progress, and identify trends and opportunities for growth.
  1. Sales Overview:
      - Year-to-Date (YTD) Total Sales
      - Month-to-Date (MTD) Total Sales
      - Year-over-Year (YOY) Growth in Total Sales
      - Difference between YTD Sales and Previous Year-to-Date (PTYD) Sales
  2. Average Price Analysis:
      - YTD Average Price
      - MTD Average Price
      - YOY Growth in Average Price
      - Difference between YTD Average Price and PTYD Average Price
  3. Cars Sold Metrics:
      - YTD Cars Sold
      - MTD Cars Sold
      - YOY Growth in Cars Sold
      - Difference between YTD Cars Sold and PTYD Cars Sold
#### Charts
  1.	YTD Sales Weekly Trend: A line chart illustrating the weekly trend of YTD sales. The X-axis represent weeks, and the Y-axis shows the total sales amount.
  2.	YTD Total Sales by Body Style: Distribution of YTD total sales across different car body styles using a Pie chart.
  3.	YTD Total Sales by Color: Presents the contribution of various car colors to the YTD total sales through a pie chart.
  4.	YTD Cars Sold by Dealer Region: Showcase the YTD sales data based on different dealer regions using a map chart to visualize the sales distribution geographically.
  5.	Company-Wise Sales Trend in Grid Form: A tabular grid that displays the sales trend for each company. The grid showcases the company name along with their YTD sales figures.
  6.	Details Grid Showing All Car Sales Information: A detailed grid that presents all relevant information for each car sale, including car model, body style, colour, sales amount, dealer region, date, etc.

I used advanced DAX Functions

Include some interesting code/features worked with. Here we include if we used subquery, cte, window function, etc.

```sql 
SELECT * FROM table1 WHERE cond = 2;
```
### Results and Findings
The analysis results are summarized as follows:
1. There are slightly more male employees
2. White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
3. The youngest employee is 20 years old and the oldest is 57 years old
4. 5 age groups were created (24-, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44 while the smallest group was 55-64.
5. A large number of employees work at the headquarters versus remotely.
6. The average length of employment for terminated employees is around 10 years.
7. The gender distribution across departments is fairly balanced but there are generally more male than female employees.
8. The Marketing department has the highest turnover rate followed by Training. The lowest turn over rates are in the Research and development, Support and Legal departments.
9. A large number of employees come from the state of Ohio.
10. The net change in employee headcount has increased over the years.
11. The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.


### Recomendations
sample text
Based on the analysis, I recommend the following actions:

(sample text) 
  Based on the analyis, we recommend the following actions:
- 

### Limitations 


### References
1.Guided Project [YouTube](https://www.youtube.com/watch?v=XnPo5Ft7RzQ)

😄
💻
|Heading1|Heading2|
|--------|--------|
|Content1|Content2|

**bold**

*italic*


