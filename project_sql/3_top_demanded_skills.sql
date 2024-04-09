/*
    Question: What are the most in-demand skills for data analysts?
    - Join job postings to inner joins table similar to query 2
    - Identify the top 5 in-demand skills for data analyst
    - Focus on all postings
    - Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insight into the most valuable skills for job seekers
*/

SELECT
    skills,
    COUNT(*) AS demand_count
FROM
    job_postings_fact AS jp
JOIN
    skills_job_dim AS sj ON sj.job_id = jp.job_id
JOIN
    skills_dim AS sd ON sd.skill_id = sj.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    2 DESC
LIMIT 5;