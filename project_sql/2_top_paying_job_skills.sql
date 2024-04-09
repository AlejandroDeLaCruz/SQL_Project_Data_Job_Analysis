/*
    Question: What skills are required for the top-paying data analyst role?
    - Use the top 10 highest-paying Data Analyst jobs from the first query
    - Add the specific skills required for these roles
    - Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop to align with top salaries
*/

WITH top_paying_jobs AS (
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
    LIMIT 10)

SELECT
    tp.*,
    sd.*
FROM
    skills_job_dim AS sj
JOIN
    top_paying_jobs AS tp ON tp.job_id = sj.job_id
JOIN
    skills_dim AS sd ON sd.skill_id = sj.skill_id
ORDER BY
    salary_year_avg DESC;

/*
    Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
    - SQL is leading with a bold count of 8
    - Python follows closely with a bold count of 7
    - Tableau is also highly sought after, with a bold of 6
    - Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand
*/