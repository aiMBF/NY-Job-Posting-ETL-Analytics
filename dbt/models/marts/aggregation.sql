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
--/CONTINUE THE RESQUEST WITH AGGREGATIONS