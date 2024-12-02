{{ config(alias='311_Noise_Complaints_Cleaned', materialized='table') }}

-- Cleaned 311 Noise Complaints
SELECT DISTINCT
    unique_key,  -- Unique identifier for complaints
    complaint_type,  -- Type of complaint (e.g., noise)
    created_date,  -- Date complaint was created
    descriptor,  -- Additional details of complaint
    latitude,  -- Latitude of complaint location
    longitude,  -- Longitude of complaint location
    city,  -- City where complaint occurred
    borough,  -- Borough where complaint occurred
    location_type,  -- Type of location (e.g., residential, commercial)
    incident_zip,  -- ZIP code of the complaint location
    incident_address  -- Address of the complaint
FROM `cis-4400-group-project-443304.raw_data.311_Noise_Complaints`
WHERE created_date IS NOT NULL  -- Ensure complaints have a date
  AND latitude IS NOT NULL  -- Ensure location is valid
  AND longitude IS NOT NULL
  AND borough IS NOT NULL;  -- Ensure borough is specified





