{{
    config(
        materialized = 'table'
    )
}}

WITH cleaned_data_nyc_data AS (
    SELECT * 
    FROM {{ ref('data-cleaning') }}
),

average_salary_by_category AS (
    {{ average_salary_cte(
        'data-cleaning', 
        'salary_range.salary_range_from', 
        'salary_range.salary_range_to', 
        'job_category'
    ) }}
)

SELECT * 
FROM average_salary_by_category