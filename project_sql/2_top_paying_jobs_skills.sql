-- Skills of the top paying remote jobs around the world
WITH tob_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact AS jb
    LEFT JOIN company_dim AS cd
        ON cd.company_id = jb.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    skd.skills
FROM tob_paying_jobs AS tpj
INNER JOIN skills_job_dim AS sk ON sk.job_id = tpj.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
ORDER BY salary_year_avg DESC

-- Skills of the top paying jobs on Brazil
WITH tob_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact AS jb
    LEFT JOIN company_dim AS cd
        ON cd.company_id = jb.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%Brazil%' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    skd.skills
FROM tob_paying_jobs AS tpj
INNER JOIN skills_job_dim AS sk ON sk.job_id = tpj.job_id
INNER JOIN skills_dim AS skd ON skd.skill_id = sk.skill_id
ORDER BY salary_year_avg DESC