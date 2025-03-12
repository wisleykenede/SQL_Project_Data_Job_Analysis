-- Top paying skills for Data Analyst remote jobs
SELECT
    skd.skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS jpt
INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY skd.skills
ORDER BY avg_salary DESC
LIMIT 20

-- Top paying skills for Data Analyst remote jobs
SELECT
    skd.skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact AS jpt
INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Brazil%' AND
    salary_year_avg IS NOT NULL
GROUP BY skd.skills
ORDER BY avg_salary DESC
LIMIT 20