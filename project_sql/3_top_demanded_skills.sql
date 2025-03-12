-- Most in-demand skills for Data Analyst remote jobs
SELECT
    skd.skills,
    COUNT(sk.job_id) AS demand_count
FROM job_postings_fact AS jpt
INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
GROUP BY skd.skills
ORDER BY demand_count DESC
LIMIT 5

-- Most in-demand skills for Data Analyst Brazil jobs
SELECT
    skd.skills,
    COUNT(sk.job_id) AS demand_count
FROM job_postings_fact AS jpt
INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Brazil%' AND
GROUP BY skd.skills
ORDER BY demand_count DESC
LIMIT 5