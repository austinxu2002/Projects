{{ config(alias='DOB_Stalled_Construction_Cleaned', materialized='table') }}

-- Cleaned DOB Stalled Construction Sites
SELECT DISTINCT
    complaint_number,  -- Unique complaint number
    date_complaint_received AS complaint_date,  -- Date complaint was filed
    borough_name AS borough,  -- Borough where the issue occurred
    bin,  -- Building Identification Number
    house_number,  -- Street address (house number)
    street_name,  -- Street address (street name)
    community_board,  -- Community board where the issue occurred
    dobrundate  -- DOB run date (if needed for tracking or auditing)
FROM `cis-4400-group-project-443304.raw_data.DOB_Stalled_Construction_Sites`
WHERE date_complaint_received IS NOT NULL  -- Ensure complaints have a date
  AND borough_name IS NOT NULL  -- Ensure borough is specified
  AND bin IS NOT NULL;  -- Ensure Building Identification Number is available












