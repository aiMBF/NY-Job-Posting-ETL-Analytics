FROM ghcr.io/dbt-labs/dbt-bigquery:1.8.2

WORKDIR /app

COPY . .

ENTRYPOINT [ "dbt", "run", "--profiles-dbt", "dbt", "--project-dbt", "dbt"]