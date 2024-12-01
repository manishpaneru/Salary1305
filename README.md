SQL Data Cleaning: Salary Dataset
Project Description
This project focuses on cleaning and querying a salary dataset using SQL. The dataset includes information about individuals' demographics, education levels, job titles, years of experience, and salaries. The goal was to ensure clean, analyzable data by renaming columns, standardizing data types, and performing exploratory queries.

Key Features
Data Cleaning:
Renamed columns for better readability.
Standardized data types for consistency.
Exploratory Analysis:
Identified unique job titles in the dataset.
Queried job roles earning more than $100,000 annually.
Optimized Queries: Ensured performance through ordered and filtered results.
Dataset Information
Columns:
S.N: Serial Number
Age: Age of the individual
Gender: Gender of the individual
Education Level: Educational attainment
Job Title: Occupation title
Years of Experience: Number of years in the profession
Salary: Annual salary in USD
Sample Data:
python
Copy code
    S.N  Age  Gender Education Level          Job Title  Years of Experience  Salary
    1    32   Male   Bachelor's       Software Engineer  5.0                 90000.0
    2    28   Female Master's         Data Analyst       3.0                 65000.0
Installation and Usage Instructions
Dataset:
Ensure the Salary_Data.csv file is available.
SQL Environment:
Use any SQL tool, such as MySQL Workbench or pgAdmin.
Steps to Run:
Create a database named project.
Import the dataset into a table named salary.
Run the SQL script (Salary_SQL_code.sql) to clean and analyze the data.
Methodology/Approach
Column Renaming:
Simplified column names for ease of use.
Data Type Standardization:
Changed complex data types to more manageable ones (e.g., varchar for strings, int for integers).
Exploratory Queries:
Identified distinct job titles.
Filtered and sorted jobs with salaries above $100,000.
Key Insights/Results
Distinct Job Titles: Queried unique job roles within the dataset.
High Earners: Identified roles like Senior Manager and Director as high-paying jobs exceeding $100,000.
Dependencies
SQL Database Management System (e.g., MySQL, PostgreSQL).
Dataset: Salary_Data.csv.
SQL Script: Salary_SQL_code.sql.
