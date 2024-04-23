USE projects;

SELECT 
    *
FROM
    hr;
    
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------- DATA CLEANING --------------------------------------------------------------------------------------------------

-- Rename the first column, to remove the special characters 

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

-- Check the data types for all of the columns

DESCRIBE hr;

-- Convert the birhtdates from text to a standard date format
UPDATE hr
SET birthdate = CASE 
		WHEN birthdate LIKE '%/%'THEN DATE_FORMAT(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
           	WHEN birthdate LIKE '%-%'THEN DATE_FORMAT(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
            ELSE NULL
            END;
    
-- Change the data type of the birthday column

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- Convert the hire dates from text to a standard date format
UPDATE hr
SET hire_date = CASE 
		WHEN hire_date LIKE '%/%'THEN DATE_FORMAT(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
           	WHEN hire_date LIKE '%-%'THEN DATE_FORMAT(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
            ELSE NULL
            END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

-- Convert the termdate type from date and time format to DATE format

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !='';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------- DATA WRANGLING --------------------------------------------------------------------------------------------------

-- Adding a new column to calculate the age for each employee

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR,birthdate, CURDATE());

SELECT birthdate, age FROM hr;

-- Checking the date for accuracy
SELECT
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM
	hr;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------- QUESTIONS -----------------------------------------------------------------------------------------------------

-- 1. What is the gender breakdown of employees in the company?
SELECT 
    gender, COUNT(*) AS counts
FROM
    hr
WHERE termdate IS NULL
GROUP BY gender;

-- 2.What is the race/ethnicity breakdown of employees in the company?
SELECT 
    race, COUNT(emp_id) AS counts
FROM
    hr
WHERE
    termdate IS NULL
GROUP BY race
ORDER BY counts DESC;

-- 3. What is the age distribution of the employees in the company?

SELECT
	min(age) as youngest,
    max(age) as oldest
FROM
    hr
WHERE termdate IS NULL
ORDER BY age;

SELECT
	CASE
		WHEN age <=24 THEN '24-'
        WHEN age >=25 AND age <= 34 THEN '25-34'
		WHEN age >=35 AND age <= 34 THEN '35-44'
        WHEN age >=45 AND age <= 54 THEN '45-54'
        WHEN age >=55 AND age <= 64 THEN '55-64'
		ELSE '65+'
	END AS age_group,
	COUNT(emp_id) as count
FROM
	hr
WHERE termdate is NULL
GROUP BY
	age_group;
    
SELECT
	min(age) as youngest,
    max(age) as oldest
FROM
    hr
WHERE termdate IS NULL
ORDER BY age;

SELECT
	CASE
		WHEN age <=24 THEN '24-'
        WHEN age >=25 AND age <= 34 THEN '25-34'
		WHEN age >=35 AND age <= 34 THEN '35-44'
        WHEN age >=45 AND age <= 54 THEN '45-54'
        WHEN age >=55 AND age <= 64 THEN '55-64'
		ELSE '65+'
	END AS age_group,
    gender,
	COUNT(emp_id) as count
FROM
	hr
WHERE termdate is NULL
GROUP BY
	age_group, gender
ORDER BY
	age_group, gender;
 
-- 4. How many employees work at headquarters versus remote locations?
SELECT
	location,
    count(*)
FROM
	hr
WHERE termdate is NULL
GROUP BY
	location;
    
-- 5. What is the average lenght of employment for employees who have been terminated?
SELECT
	ROUND(avg(DATEDIFF(termdate, hire_date))/365,0) AS avg_lengh_employment
FROM
	hr
WHERE termdate IS NOT NULL;

-- 6. How does the gender distribution vary across departments and job titles?
SELECT
	department,
    gender,
    count(*) AS count
FROM
	hr
WHERE termdate IS NULL
GROUP BY
	department,
    gender
ORDER BY
	department;

-- 7. What is the distribution of job titles across the company?

SELECT
	jobtitle,
    count(*) AS count
FROM
	hr
WHERE termdate IS NULL
GROUP BY
	jobtitle
ORDER BY
	jobtitle;
    
-- 8. Which department has the highest turnover rate?

SELECT
	department,
    total_count,
    terminated_count,
    round(terminated_count/total_count *100,2) AS termination_rate
FROM (
	SELECT department,
    count(*) AS total_count,
    SUM(CASE WHEN termdate IS NOT NULL AND termdate <=curdate() THEN 1 ELSE 0 END) AS terminated_count
    FROM hr
    GROUP BY department
	) AS subquery
ORDER BY
	termination_rate DESC;
 
-- 9. What is the distribution of employees across locations by city and state?
SELECT
	location_state,
    count(emp_id) AS counts
FROM
	hr
WHERE termdate IS NOT NULL
GROUP BY location_state
ORDER BY counts DESC;

-- 10. How has the company's employee count changed over time base on hire and term dates?
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
   
   -- What is the tenure distribution for each department?
SELECT
	department,
    round(avg(datediff(termdate, hire_date)/365),0) as avg_tenure
FROM
	hr
WHERE termdate <=curdate() AND termdate IS NOT NULL
GROUP BY department;

    
    
