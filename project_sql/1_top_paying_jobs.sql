-- Top 7 remote jobs around the world
SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact AS jb
LEFT JOIN company_dim AS cd ON cd.company_id = jb.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10

-- Top 7 jobs on Brazil
SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact AS jb
LEFT JOIN company_dim AS cd ON cd.company_id = jb.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Brazil%' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10