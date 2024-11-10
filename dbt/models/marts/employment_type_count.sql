{{
    config(
        materialized = 'table',
    )
}}

WITH cleaned_data_nyc_data AS (
    SELECT * FROM {{ ref('data-cleaning') }}
)
    SELECT
        full_time_part_time_indicator AS employment_type,
        COUNT(job_id) AS total_job_postings
    FROM
        cleaned_data_nyc_data
    GROUP BY
        full_time_part_time_indicator
