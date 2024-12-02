{{ config(alias='location_dim', materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['borough', 'incident_address']) }} AS location_id,
    borough AS borough_name,
    bin,
    house_number,
    street_name,
    incident_zip,
    community_board,
    city,
    location_type
FROM `cis-4400-group-project-443304.dbt_axu.cleaned_311_noise_complaints`
UNION DISTINCT
SELECT DISTINCT
    {{ dbt_utils.surrogate_key(['borough_name', 'house_number', 'street_name']) }} AS location_id,
    borough_name AS borough_name,
    bin,
    house_number,
    street_name,
    NULL AS incident_zip,
    community_board,
    NULL AS city,
    NULL AS location_type
FROM `cis-4400-group-project-443304.dbt_axu.DOB_Stalled_Construction_Cleaned`;
