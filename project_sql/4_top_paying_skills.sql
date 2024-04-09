/*
    Question: What are the top paying skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst positions
    - Focuses on roles with specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact AS jp
JOIN
    skills_job_dim AS sj ON sj.job_id = jp.job_id
JOIN
    skills_dim AS sd ON sd.skill_id = sj.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    2 DESC
LIMIT 25;