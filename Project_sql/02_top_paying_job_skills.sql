/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying data engineer jobs from first query
- Add the specific skills required for these roles
- Why? 
    Provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        jpf.job_id,
        jpf.job_title,
        jpf.salary_year_avg,
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
    LIMIT 10
)
SELECT 
    tpj.job_id,
    tpj.job_title,
    tpj.salary_year_avg,
    tpj.company_name,
    sd.skills
FROM 
    top_paying_jobs AS tpj
JOIN skills_job_dim AS sjd ON tpj.job_id = sjd.job_id
JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY tpj.salary_year_avg DESC;

/*

Key Takeaway:   
Skills like Java, SQL, Scala, and Spring are tied to the highest salaries (~$445K avg), likely because they appear 
in the most senior or specialized roles. Python, while ubiquitous, trends slightly lower at ~$393K on average.