# fraud-detection-analytics
End-to-end fraud detection analytics project using Python, SQL Server, and Power BI

## 📌 Executive Summary
This project analyzes **credit card transactions** (~1.2M records) to uncover fraud detection patterns.  
Using **Python, SQL Server, and Power BI**, I transformed raw data into business-ready insights:

- Cleaned and prepared data in Python.  
- Engineered features in both Python and SQL (depending on complexity).  
- Pushed structured data into **SQL Server** and created **views** for reporting.  
- Built interactive **Power BI dashboards** for fraud detection KPIs and insights.  

The dashboards highlight **fraud rates, customer behavior, time trends, and distance effects**, supporting data-driven fraud prevention strategies.  

---

## 🔹 Data Source
- Dataset: [`Fraud Detection Dataset`](https://www.kaggle.com/datasets/kartik2112/fraud-detection)  
- File used: `fraudTrain.csv` (1.2M+ records).  
- Columns include: transaction details, merchant info, customer demographics, and fraud labels.  

---

## 🔹 Data Preparation (Python)
The raw CSV (`FraudTrain.csv`) was imported into **Pandas** for cleaning and preprocessing.  

### Key Steps in Python:
- Removed irrelevant columns (e.g., unamed, first, last, street).  
- **Feature Engineering in Python**:
  - `distance_customer_merchant`: calculated using the **Haversine formula** from customer & merchant latitude/longitude.  
    - Done in Python due to computational complexity of geospatial math.
  
 ![image alt]([Haverson _ distance calc.png](https://github.com/Danyrex/fraud-detection-analytics/blob/main/Haverson%20_%20distance%20calc.png?raw=true))

---

## 🔹 Database Integration (SQL Server)
The processed dataset (with distance already computed in Python) was pushed into **SQL Server** for further transformations and analysis.  

**Table Creation with appropriate datatypes (VARCHAR for trans_num, FLOAT for lat/long, INT for age, etc.).**

**Feature Engineering in SQL:**

age: computed from dob and transaction date.

hour_of_day: extracted from transaction timestamp.

day_of_week: derived from transaction timestamp.

time_category: grouped into Morning, Afternoon, Night.

**Views (vw_FraudData)** were created with only business-relevant columns.



**Why Views?**

Hide sensitive data (cc_num, trans_num).

Improve Power BI performance (lighter dataset).

Keep dashboards focused on business KPIs.
