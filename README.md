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
  
 ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/ed95795b83c2d4b46341d338cbbe5eeab3738d38/Haverson%20_%20distance%20calc.jpg)

---

## 🔹 Database Integration (SQL Server)
The processed dataset (with distance already computed in Python) was pushed into **SQL Server** for further transformations and analysis.  

**Table Creation** with appropriate datatypes:
- `VARCHAR` → transaction number.  
- `FLOAT` → latitude/longitude, amount, distance.  
- `INT` → age.  
- `DATETIME` → transaction timestamp.  

**Feature Engineering in SQL**:
- `age`: computed from `dob` and transaction date.  
- `hour_of_day`: extracted from transaction timestamp.  
- `day_of_week`: derived from transaction timestamp.  
- `time_category`: grouped into **Morning, Afternoon, Night**.  
- `fraud_label`: marked as **Fraud** or **Legit**.  

**Views (`vw_FraudData`)** created with only business-relevant columns.

**Why Views?**
- Hide sensitive data (`cc_num`, `trans_num`).  
- Improve Power BI performance (lighter dataset).  
- Keep dashboards focused on business KPIs.  

 ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/886f2c4c379bb5878534bb76d5f15704214b080a/Views.jpg)

---

## 📊 Visualization (Power BI)

The cleaned dataset was connected from SQL Server views into **Power BI**.  
I designed multiple dashboard pages for different perspectives:

1. **Overview Dashboard**
   - Fraud rate (**0.58%**)  
   - Fraud loss (**$3.99M**)  
   - Total transaction volume (**$91.22M**)  
   - Fraud loss rate (**4.38% of value**)  

 ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/886f2c4c379bb5878534bb76d5f15704214b080a/Overview%20dashboard.jpg)

2. **Customer Insights**
   - Fraud by **age group**  
   - Fraud by **job type**  
   - Fraud by **gender**  

  ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/886f2c4c379bb5878534bb76d5f15704214b080a/Customer%20insight.jpg
)

3. **Time Insights**
   - Fraud by **hour of day**  
   - Fraud by **day of week**  
   - Fraud by **time category** (Morning, Afternoon, Night)  

   ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/886f2c4c379bb5878534bb76d5f15704214b080a/Time%20insight.jpg)

4. **Distance Insights**
   - Fraud % by **customer–merchant distance** bins (0–50km, 50–200km, >200km, etc.)  
   - Geo-map of fraud hotspots  

   ![image alt](https://github.com/Danyrex/fraud-detection-analytics/blob/886f2c4c379bb5878534bb76d5f15704214b080a/Distance.jpg)

---

## 🔍 Key Findings
- Fraud rate is **low (0.58%)** but financial loss is **high ($3.99M)**.  
- **Night transactions** show higher fraud likelihood.  
- Fraud is more common when **customer and merchant are far apart**.  
- Younger customers (<30) show higher exposure.  
- Certain **merchant categories** are fraud hotspots.  

---
