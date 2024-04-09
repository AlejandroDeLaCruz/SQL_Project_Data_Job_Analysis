
-- Question: What are the top-paying jobs for my role?
-- Identify the top 10 highest paying Data Analyst roles that available remotely
-- Focuses on job postings with specified salaries (remove nulls)
-- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment 


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    c.name AS company_name
FROM
    job_postings_fact AS jp
LEFT JOIN
    company_dim AS c ON c.company_id = jp.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;