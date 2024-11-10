{{
    config(
        materialized = 'table',
        partition_by={
            "field":"",
            "data_type":"",
            "granularity":"",
        }
    )
}}

with cleaned_data_nyc_data AS (
    SELECT * FROM {{ ref('data-cleaning') }}
),
job_count_by_agency AS (
    SELECT
        agency,
        COUNT(job_id) AS total_job_postings
    FROM
        cleaned_data_nyc_data
    GROUP BY
        agency
),

average_salary_by_job_category AS (
    SELECT
        job_category,
        AVG(salary_range.salary_range_from) AS avg_salary_min,
        AVG(salary_range.salary_range_to) AS avg_salary_max
    FROM
        cleaned_data_nyc_data
    GROUP BY
        job_category
),

employment_type_count AS (
    SELECT
        full_time_part_time_indicator AS employment_type,
        COUNT(job_id) AS total_job_postings
    FROM
        cleaned_data_nyc_data
    GROUP BY
        employment_type
)
