USE ObesityDb;
#this includes some of the Extra Queries that we tried
#1. Health Trend Analysis
#Scenario: A health department wants to analyze trends in obesity or smoking rates among patients over a specific period.
#Use Case: To Get trends of patients' obesity and smoking habits across different age groups

SELECT p.Age, COUNT(p.Patient_ID) AS ObesityCount, l.SMOKE
FROM PatientInfo p
JOIN Lifestyle l ON p.Lifestyle_ID = l.Lifestyle_ID
JOIN MedicalData m ON p.Medical_ID = m.Medical_ID
WHERE m.NObeyesdad = 'Obesity_Type_I'
GROUP BY p.Age, l.SMOKE;

SELECT Patient_ID, 
       (Weight / (Height * Height)) AS BMI, 
       CASE 
           WHEN (Weight / (Height * Height)) < 18.5 THEN 'Underweight'
           WHEN (Weight / (Height * Height)) BETWEEN 18.5 AND 24.9 THEN 'Normal'
           WHEN (Weight / (Height * Height)) BETWEEN 25 AND 29.9 THEN 'Overweight'
           ELSE 'Obese'
       END AS BMI_Class
FROM PatientInfo;

SELECT p.Patient_ID, p.FamilyHistory, l.FAVC, l.FAF, m.NObeyesdad
FROM PatientInfo p
JOIN Lifestyle l ON p.Lifestyle_ID = l.Lifestyle_ID
JOIN MedicalData m ON p.Medical_ID = m.Medical_ID
WHERE (p.FamilyHistory = 'YES' OR p.FamilyHistory = 'NO') AND m.NObeyesdad = 'Obesity_Type_II';

SELECT p.Patient_ID, l.SMOKE, l.FAVC, m.SCC
FROM PatientInfo p
JOIN Lifestyle l ON p.Lifestyle_ID = l.Lifestyle_ID
JOIN MedicalData m ON p.Medical_ID = m.Medical_ID
WHERE l.SMOKE = 'YES' AND l.FAVC = 'YES';

#2. Hydration Levels and Associated Health Risks
#Use Case: Analyze the effect of hydration on patient health.
#Scenario: Identify patients consuming insufficient water and correlate this with their medical conditions.

SELECT p.Patient_ID, l.CH2O
FROM PatientInfo p
JOIN Lifestyle l ON p.Lifestyle_ID = l.Lifestyle_ID
WHERE l.CH2O < 2.0;

#3. Age and Disease Risk Distribution
#Use Case: Identify age groups most at risk for specific conditions.
#Scenario: To Analyze the Age column in PatientInfo to create risk profiles by age group.

SELECT p.Age, COUNT(p.Patient_ID) AS PatientCount, m.NObeyesdad
FROM PatientInfo p
JOIN MedicalData m ON p.Medical_ID = m.Medical_ID
GROUP BY p.Age, m.NObeyesdad;

#4.Family History Influence on Obesity
#Use Case: Study the effect of family history on obesity and related conditions.
#Scenario: Filter patients with a positive family history of obesity and analyze lifestyle data.

SELECT p.Patient_ID, p.FamilyHistory, m.NObeyesdad
FROM PatientInfo p
JOIN MedicalData m ON p.Medical_ID = m.Medical_ID
WHERE p.FamilyHistory = 'YES';

#Specific Health Patterns
#Use Case: Explore how health risks and lifestyle habits vary between genders.
#Scenario: Segment data by gender to study differences in obesity rates, exercise frequency, and diet preferences.



SELECT 
    CASE 
        WHEN l.SMOKE = 'Yes' THEN 'Smoking'
        WHEN l.CALC IN ('Frequently', 'Always') THEN 'High Alcohol Consumption'
        WHEN l.FAVC = 'Yes' THEN 'High-Calorie Diet'
        ELSE 'Low Risk'
    END AS Risk_Factor,
    COUNT(p.Patient_ID) AS Patient_Count
FROM PatientInfo p
JOIN Lifestyle l ON p.Lifestyle_ID = l.Lifestyle_ID
GROUP BY Risk_Factor
ORDER BY Patient_Count DESC;

