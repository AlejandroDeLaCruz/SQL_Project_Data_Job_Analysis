/*
    Question: What are the most optimal skills to learn (aka it's in high demand and high-paying skill)?
    - Identify skills in high demand and associated with high average salaries for Data Analyst roles
    - Concentrates on remote positions on specified salaries
    - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT
        sd.skill_id,
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
        AND salary_year_avg IS NOT NULL
    GROUP BY
        sd.skill_id),

average_salary AS (
    SELECT
        sd.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
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
        sd.skill_id)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
JOIN
    average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC, demand_count DESC;