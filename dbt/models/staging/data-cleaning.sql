{{ config 
    (
        materialized='view'
    )
}}

SELECT job_id,
        agency,
        posting_type,
        number_of_positions,
        business_title,
        STRUCT(salary_range_from, salary_range_to) AS salary_range,
        title_classification,
        job_category,
        full_time_part_time_indicator,
        salary_frequency,
        preferred_skills,
        work_location_1,
        posting_date
`{{ target.dataset }}.nyc-data-job`