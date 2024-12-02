{{ config(alias='date_dim', materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['created_date']) }} AS date_id,
    created_date AS date_complaint_received,
    EXTRACT(DAY FROM created_date) AS day,
    EXTRACT(MONTH FROM created_date) AS month,
    EXTRACT(YEAR FROM created_date) AS year,
    DATE(created_date) AS date_value
FROM `cis-4400-group-project-443304.dbt_axu.cleaned_311_noise_complaints`
UNION DISTINCT
SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['date_complaint_received']) }} AS date_id,
    date_complaint_received AS date_complaint_received,
    EXTRACT(DAY FROM date_complaint_received) AS day,
    EXTRACT(MONTH FROM date_complaint_received) AS month,
    EXTRACT(YEAR FROM date_complaint_received) AS year,
    DATE(date_complaint_received) AS date_value
FROM `cis-4400-group-project-443304.dbt_axu.DOB_Stalled_Construction_Cleaned`;
