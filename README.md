# EDA-SQL
📉 Layoffs EDA using SQL
This project explores global layoffs data using SQL to uncover patterns across companies, industries, and time.

📁 Dataset
Table: layoffs_staging2

Source: Layoffs.fyi

Fields: company, industry, total_laid_off, percentage_laid_off, stage, funds_raised, date, etc.

🧠 Key Questions
Which companies had the most layoffs?

What industries were most affected?

How did layoffs trend over time?

Which stages or years saw higher layoffs?

Which companies had 100% workforce cuts?

🛠️ SQL Techniques Used
Aggregations (SUM, AVG, MAX)

Window functions (DENSE_RANK, SUM OVER)

CTEs for rolling totals & yearly rankings

Date filtering and grouping

📊 Insights
Tech & consumer industries saw major layoffs

Several companies had complete shutdowns

Layoffs spiked in specific months

Early-stage companies were highly affected

🚀 Usage
Import the dataset to your SQL environment

Run the provided queries

Modify or extend for deeper insights

📌 Future Scope
Add visual dashboards (Tableau/Power BI)

Build predictive layoff models
