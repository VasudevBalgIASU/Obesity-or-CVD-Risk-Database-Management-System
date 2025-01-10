# Obesity-or-CVD-Risk-Database-Management-System

## Overview
This project introduces a database management system to monitor and predict risks associated with obesity and cardiovascular diseases (CVD). By analyzing 17 attributes related to health, lifestyle, and demographics, the system supports early detection and personalized healthcare interventions.

## Key Features
- Entity-Relationship (E-R) model for database design.
- SQL queries for analyzing obesity types, age-group risks, and lifestyle impacts.
- Machine learning integration with Random Forest for obesity classification (96% accuracy).
- K-Means clustering for grouping patients by obesity characteristics.

## Technologies Used
- SQL
- Python
- Pandas, Scikit-learn
- Database Design: MySQL

## Dataset Details
- **Source**: Obesity dataset with 2,111 samples and 17 attributes.
- **Structure**: Includes fields such as `Age`, `Height`, `Weight`, `Lifestyle Factors`, and `Obesity Levels`.
- **Preprocessing**: Label encoding, scaling, and train-test split (80-20 ratio).

## Visuals and Examples
- **E-R Diagram**: Represents the relationships between `Patient`, `Lifestyle`, and `Medical Data` entities.
- **SQL Query Results**: Insights into obesity distribution, age-based risks, and gender health comparisons.
- **Clustering Visualization**: Groups patients based on similar attributes.

## Results
- SQL queries provide insights into obesity prevalence and health risks by demographic groups.
- Random Forest model predicts obesity levels with 96% accuracy.
- Clustering analysis reveals patterns in patient lifestyles and health conditions.

