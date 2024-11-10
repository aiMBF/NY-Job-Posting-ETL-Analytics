{{
    config(
        materialized = 'table',
    )
}}

WITH cleaned_data_nyc_data AS (
    SELECT * FROM {{ ref('data-cleaning') }}
)
    SELECT
        agency,
        COUNT(job_id) AS total_job_postings
    FROM
        cleaned_data_nyc_data
    GROUP BY
        agency
