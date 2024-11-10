{% macro average_salary_cte(ref_table, min_salary, max_salary, group_column) %}
    WITH avg_salary AS (
        SELECT 
            {{ group_column }} AS job_category,
            AVG({{ min_salary }}) AS avg_min_salary,
            AVG({{ max_salary }}) AS avg_max_salary
        FROM 
            {{ ref(ref_table) }}
        GROUP BY 
            {{ group_column }}
    )
    SELECT * FROM avg_salary
{% endmacro %}
