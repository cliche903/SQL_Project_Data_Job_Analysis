/*
Question: What are the top-paying data engineer jobs?
- Identify the top 10 highest-paying data engineer roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? 
   Highlight the top-paying opportunities for data engineers, offering insights into employment options and location flexibility.
*/

SELECT
    jpf.job_id,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date,
    cd.name AS company_name
FROM 
    job_postings_fact jpf
LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
WHERE 
    jpf.salary_year_avg IS NOT NULL AND 
    jpf.job_title_short = 'Data Engineer' AND 
    jpf.job_work_from_home = TRUE AND
    jpf.job_posted_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY 
    jpf.salary_year_avg DESC
LIMIT 10;