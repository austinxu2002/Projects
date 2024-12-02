{{ config(alias='complaint_fact', materialized='table') }}

SELECT 
    unique_key AS complaint_number,
    lt.location_id,
    ct.complaint_type_id,
    dt.date_id
FROM `cis-4400-group-project-443304.dbt_axu.cleaned_311_noise_complaints` AS nc
LEFT JOIN `cis-4400-group-project-443304.dbt_axu.location_dim` AS lt
    ON nc.borough = lt.borough_name 
    AND nc.incident_address = lt.street_name
LEFT JOIN `cis-4400-group-project-443304.dbt_axu.complaint_type_dim` AS ct
    ON nc.complaint_type = ct.complaint_type 
    AND nc.descriptor = ct.descriptor
LEFT JOIN `cis-4400-group-project-443304.dbt_axu.date_dim` AS dt
    ON DATE(nc.created_date) = dt.date_value

UNION ALL

SELECT 
    complaint_number,
    lt.location_id,
    NULL AS complaint_type_id, -- DOB does not have complaint_type
    dt.date_id
FROM `cis-4400-group-project-443304.dbt_axu.DOB_Stalled_Construction_Cleaned` AS dob
LEFT JOIN `cis-4400-group-project-443304.dbt_axu.location_dim` AS lt
    ON dob.borough_name = lt.borough_name 
    AND dob.house_number = lt.house_number 
    AND dob.street_name = lt.street_name
LEFT JOIN `cis-4400-group-project-443304.dbt_axu.date_dim` AS dt
    ON DATE(dob.date_complaint_received) = dt.date_value;
