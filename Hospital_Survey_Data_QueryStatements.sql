-- Create a new table "Tableau_File" in the "Hospital_Data" schema
create table "postgres"."Hospital_Data".Tableau_File as

-- Preparing a Common Table Expression (CTE) for processing hospital bed data

with hospital_beds_prep as (
    select 
        lpad(cast(provider_ccn as text), 6, '0') as padded_provider_ccn, -- Ensuring provider_ccn is a 6-digit padded string
        provider_ccn, -- Original provider CCN
        hospital_name, -- Name of the hospital
        to_date(fiscal_year_begin_date, 'MM/DD/YYYY') as fiscal_year_begin_date, -- Converting fiscal year start date to date type
        to_date(fiscal_year_end_date, 'MM/DD/YYYY') as fiscal_year_end_date, -- Converting fiscal year end date to date type
        number_of_beds, -- Number of beds available at the hospital
        row_number() over (
            partition by provider_ccn 
            order by to_date(fiscal_year_end_date, 'MM/DD/YYYY') desc
        ) as nth_row -- Assigning a row number based on the latest fiscal year for each provider_ccn
    from "postgres"."Hospital_Data".hospital_beds
)

-- Selecting and join data from HCAHPS and hospital beds

select 
    lpad(cast(facility_id as text), 6, '0') as padded_provider_ccn, -- Ensuring facility_id is a 6-digit padded string
    to_date(start_date, 'MM/DD/YYYY') as start_date_converted, -- Converting HCAHPS start date to date type
    to_date(end_date, 'MM/DD/YYYY') as end_date_converted, -- Converting HCAHPS end date to date type
    hcahps.*, -- Selecting all columns from the HCAHPS data table
    beds.number_of_beds, -- Including number of beds from hospital beds data
    beds.fiscal_year_begin_date as beds_start_report_period, -- Starting of fiscal year reporting period
    beds.fiscal_year_end_date as beds_end_report_period -- Ending of fiscal year reporting period
from "postgres"."Hospital_Data".hcahps_data as hcahps
left join hospital_beds_prep as beds -- Left join with the preprocessed hospital beds data
    on lpad(cast(facility_id as text), 6, '0') = beds.padded_provider_ccn -- Match on padded provider CCN
    and beds.nth_row = 1; -- Ensuring only the most recent row for each provider is included
