WITH skills_demand AS (
    SELECT
        skd.skill_id,
        skd.skills,
        COUNT(sk.job_id) AS demand_count
    FROM job_postings_fact AS jpt
    INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
    INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    GROUP BY skd.skill_id
),
average_salary AS (
    SELECT
        skd.skill_id,
        skd.skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS jpt
    INNER JOIN skills_job_dim AS sk ON sk.job_id = jpt.job_id
    INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    GROUP BY skd.skill_id
)

SELECT 
    sdm.skill_id,
    sdm.skills,
    sdm.demand_count,
    avs.avg_salary
FROM skills_demand AS sdm
INNER JOIN average_salary AS avs ON avs.skill_id = sdm.skill_id
ORDER BY 
    sdm.demand_count DESC,
    avs.avg_salary DESC