# Hospital_Analysis_sql_tableau

# Hospital Analysis Project

This project demonstrates how to clean, join, and analyse real-world hospital data using SQL. The final output is a Tableau-ready dataset that tracks customer service and patient experience across hospitals in the United States.

## Project Overview

This project is divided into two parts:
1. **SQL Data Preparation:** Combining and cleaning two datasets: 
   - HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) survey data.
   - Hospital beds data.
2. **Tableau Dashboard:** Creating an interactive dashboard to visualise hospital performance based on survey responses and hospital sizes.

## Features

- Cleaning raw data by formatting dates and correcting CMS certification numbers.
- Handling duplicates by selecting the most recent hospital bed reports.
- Joining HCAHPS data with hospital bed data for enhanced insights.
- Exporting the cleaned data to a `.csv` file for use in Tableau.

## Prerequisites

- PostgreSQL with PGAdmin installed.
- Tableau (or any data visualisation tool capable of processing `.csv` files).

## Datasets

- **HCAHPS Data:** Contains survey responses, hospital names, and survey metrics.
- **Hospital Beds Data:** Contains hospital names, the number of beds, and fiscal year reporting.

## SQL Steps

1. **Create Tables:** 
   - Define tables for HCAHPS data and hospital beds data.
2. **Clean Data:** 
   - Format dates and pad CMS certification numbers to six digits.
3. **Handle Duplicates:** 
   - Use `ROW_NUMBER()` to select the most recent records for each hospital.
4. **Join Data:**
   - Combine the two datasets into one unified dataset.
5. **Export Data:** 
   - Save the cleaned dataset as `tableau_file.csv`.

## Tableau File Dashboard View:

![HCAHPS Data View](https://github.com/user-attachments/assets/065323a4-8ec8-4f6d-940d-0bc0d5ea9b0c)




## Folder Structure

```plaintext
Hospital_Analysis/
├── SQL/
│   ├── Hospital_Survey_Data_QueryStatements.sql    # All SQL Scripts 
├── Data/
│   ├── hcahps_2022.csv           # Raw HCAHPS data
│   ├── hospital_beds.csv         # Raw hospital beds data
│   ├── tableau_file.csv          # Cleaned data for Tableau
├── README.md                     # Project description and instructions
