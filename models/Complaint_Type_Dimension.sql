{{ config(alias='complaint_type_dim', materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['complaint_type', 'descriptor']) }} AS complaint_type_id,
    complaint_type,
    descriptor
FROM `cis-4400-group-project-443304.dbt_axu.cleaned_311_noise_complaints`;
