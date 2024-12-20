# Electricity-Consumption-Forecasting
**Overview:**

The "Electricity Consumption Forecasting using Time Series Analysis" project analyzes and predicts hourly electricity consumption and production trends from January 2019 to January 2023. Using advanced time series techniques like ARIMA and ARIMAX, it identifies key patterns, trends, and seasonal variations to forecast consumption with 97.46% accuracy. The project's insights support energy providers, policymakers, and stakeholders in optimizing resource allocation, infrastructure planning, and renewable energy integration. This work highlights the importance of data-driven strategies in efficient energy management.

**Objectives**

- Analyze electricity consumption patterns over time. 
- Develop accurate time series models for forecasting. 
- Provide insights into production contributions by energy type. 
- Support stakeholders with data-driven decisions.
  
**Methodology**
**Data Preprocessing**
- Data aggregation at weekly and monthly levels.
- Cleaning and transformation using Python (`Pandas`, `NumPy`).
- Visual exploration using `Matplotlib` and `Seaborn`.

The dataset consisted of hourly electricity consumption and production data. To facilitate analysis and modeling, we converted and aggregated the data as follows:

**Date Conversion:** Transformed the 'DateTime' column into Python datetime objects for accurate time-based operations.
**Data Aggregation:**
Converted the hourly data to weekly and monthly intervals for better trend analysis.
Summarized data by taking averages and totals where appropriate.
**Handling Missing and Duplicate Values:**
Verified that the dataset contained no null values.
Removed duplicate entries to ensure data integrity.
These preprocessing steps reduced the dataset from 36,000 rows to 219 rows, enabling efficient computation while retaining meaningful patterns and trends.

**Time Series Modeling**
- Applied ARIMA for baseline forecasting.
- Enhanced with ARIMAX for incorporating production-type variables.
- Evaluated models using AIC, SBC, MAPE, and accuracy metrics.

**Insights**

- Spikes in consumption during winters and drops in April-May.
- Optimal ARIMAX(4,0) model with:
  - MAPE: 2.54%
  - Accuracy: 97.46%

**Results**
- Forecasting electricity consumption with high precision.
- Business insights for utilities and policymakers to optimize resource allocation.

**Tools & Technologies**
- Programming: Python
- Libraries: Pandas, NumPy, Matplotlib, statsmodels
- Tools: SAS Studio, Excel for pivot analysis

