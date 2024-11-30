SELECT
    unique_key,
    created_date,
    complaint_type,
    descriptor,
    latitude,
    longitude
FROM `cis-4400-group-project-443304.raw_data.311_Noise_Complaints`
WHERE created_date IS NOT NULL

