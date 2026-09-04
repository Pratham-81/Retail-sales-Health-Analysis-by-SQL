# 📊 Retail Sales Health Check

## 📌 Project Overview

The **Retail Sales Health Check** project analyzes the Superstore retail dataset using **PostgreSQL and SQL** to understand sales performance, profitability, regional performance, and the impact of discounts.

The main focus of this project is to identify whether high sales actually translate into profit and determine the discount level at which profitability becomes negative.

### 🎯 Business Question

> **Which categories and regions actually make money once discounts are counted?**

---

## 🗂️ Dataset

**Dataset:** Superstore Dataset  
**Source:** Kaggle – Superstore Dataset Final

The dataset contains retail transaction-level information such as:

- Order ID
- Order Date
- Ship Date
- Ship Mode
- Customer
- Segment
- Region
- Product ID
- Category
- Sub-Category
- Product Name
- Sales
- Quantity
- Discount
- Profit

### Dataset Summary

| Metric | Result |
|---|---:|
| Total Records | **9,994** |
| Earliest Order | **2014-01-03** |
| Latest Order | **2017-12-30** |
| Missing Order IDs | **0** |
| Missing Sales | **0** |
| Missing Discount | **0** |
| Missing Profit | **0** |

---

## 🛠️ Tools & Technologies

- **PostgreSQL** – Database and data analysis
- **pgAdmin 4** – Database management and query execution
- **SQL** – Data cleaning, aggregation, and analysis
- **VS Code** – SQL development and documentation
- **GitHub** – Project version control and portfolio

---

## 📁 Project Structure

```text
Retail-Sales-Health-Check/
│
├── sql/
│   └── retail_sales_health_check.sql
│
├── findings.md
│
└── README.md

🔍 Analysis Performed

The project contains 9 SQL queries covering:

Total row count
Missing-value checks
Order date range
Sales and profit by category
Sales and profit by sub-category
Sales and profit by region
Profit by discount band
High-discount sub-categories with negative profit
Profit margin by discount band
SQL Concepts Used
SELECT
COUNT()
SUM()
MIN()
MAX()
ROUND()
GROUP BY
ORDER BY
CASE WHEN
WHERE
HAVING
NULLIF()
Aggregate functions
Profit margin calculations
📈 Key Findings
1️⃣ Category Performance
Category	Total Sales	Total Profit
Technology	$836,154.10	$145,455.66
Office Supplies	$719,046.99	$122,490.88
Furniture	$741,999.98	$18,451.25
💡 Insight

Technology is the most profitable category with $145,455.66 in profit.

Furniture generated $741,999.98 in sales but only $18,451.25 in profit.

This demonstrates that high revenue does not necessarily mean high profitability.

2️⃣ Sub-Category Performance
Sub-Category	Total Sales	Total Profit
Copiers	$149,528.01	$55,617.90
Phones	$330,007.10	$44,516.25
Accessories	$167,380.31	$41,936.78
Paper	$78,479.24	$34,053.34
Binders	$203,412.77	$30,221.64
Tables	$206,965.68	-$17,725.59
💡 Insight

Copiers are the most profitable sub-category with $55,617.90 profit.

Tables are the least profitable sub-category, generating a loss of $17,725.59 despite producing more than $206,000 in sales.

Other sub-categories with negative overall profit:

Supplies: -$1,188.99
Bookcases: -$3,472.56
3️⃣ Regional Performance
Region	Total Sales	Total Profit
West	$725,457.93	$108,418.79
East	$678,781.36	$91,522.84
South	$391,721.90	$46,749.71
Central	$501,239.88	$39,706.45
💡 Insight

West is the most profitable region with $108,418.79 in profit.

Central has the lowest profit at $39,706.45, despite generating more than $500,000 in sales.

🔥 4️⃣ Discount Impact on Profit

Discounts were divided into three bands:

Discount Band	Definition
0%	No discount
1–20%	Greater than 0% and up to 20%
20%+	Greater than 20%
Profit by Discount Band
Discount Band	Order Lines	Total Sales	Total Profit
0%	4,798	$1,087,908.47	$320,987.88
1–20%	3,803	$846,522.17	$100,786.35
20%+	1,393	$362,770.43	-$135,376.44
🚨 Most Important Finding

Profit turns negative at the 20%+ discount level.

At discounts of 20% or more, the dataset generated:

Sales: $362,770.43
Profit: -$135,376.44
Profit Margin: -37.32%

This indicates that deep discounting is strongly associated with poor profitability in this dataset.

💰 5️⃣ Profit Margin by Discount
Discount Band	Total Sales	Total Profit	Profit Margin
0%	$1,087,908.47	$320,987.88	29.51%
1–20%	$846,522.17	$100,786.35	11.91%
20%+	$362,770.43	-$135,376.44	-37.32%
💡 Insight

Profit margin decreases dramatically as discount levels increase:

29.51% → 11.91% → -37.32%

This makes the 20%+ discount band the biggest profitability risk.

⚠️ 6️⃣ High-Discount Loss-Making Sub-Categories

Sub-categories with discounts of 20% or more and negative aggregated profit include:

Category	Sub-Category	High-Discount Sales	High-Discount Profit
Furniture	Tables	$135,386.77	-$31,001.78
Technology	Machines	$114,793.68	-$24,585.15
Furniture	Bookcases	$55,385.49	-$10,967.26
Office Supplies	Binders	$121,583.25	-$9,092.69
Office Supplies	Appliances	$25,141.82	-$6,131.81
Office Supplies	Storage	$65,989.85	-$4,249.35
Furniture	Furnishings	$30,255.36	-$3,788.83
Office Supplies	Supplies	$15,114.33	-$2,907.49
Furniture	Chairs	$190,754.13	-$2,453.94
💡 Insight

Tables have the largest high-discount loss at approximately -$31,001.78, followed by Machines at approximately -$24,585.15.

⚠️ Top 3 Profitability Risks
1. Excessive Discounting

Discounts of 20% or more are associated with a total loss of $135,376.44.

2. Loss-Making Sub-Categories

Tables, Bookcases, and Supplies have negative overall profit.

3. High Sales Can Hide Low Profit

Furniture generated $741,999.98 in sales but only $18,451.25 in profit.

Tables generated more than $206,000 in sales but still produced a loss.

💡 Business Recommendations
1. Control Deep Discounts

Review and control discounts of 20% or more, particularly for products with already weak profit margins.

2. Review Tables and Machines

Tables and Machines show significant losses under high-discount conditions and should receive additional pricing review.

3. Focus on Profitability

Business decisions should consider profit and profit margin, not only sales revenue.

4. Protect High-Performing Products

Technology is the strongest category by profit. Products such as Copiers, Phones, and Accessories should be monitored to maintain healthy margins.

5. Monitor Regional Profitability

West is the strongest region by profit, while Central has the lowest profit. Regional strategies should consider both sales and profitability.

🎯 Final Conclusion

This analysis demonstrates that sales revenue alone is not enough to measure business performance.

The most important finding is that:

Profit is positive at 0% and 1–20% discounts but becomes strongly negative at the 20%+ discount level.

The 20%+ discount band produces a $135,376.44 loss and a -37.32% profit margin.

Therefore, the business should carefully review deep-discount strategies, especially for Tables and Machines, where high discounts are associated with substantial losses.

📂 Project Files
SQL Queries

View SQL Analysis

Detailed Findings

View Detailed Findings

🚀 How to Run This Project
1. Create the PostgreSQL database

Create a database named:

retail_sales_health
2. Create the table

Create the superstore_sales table and import the Superstore CSV dataset.

3. Run the SQL queries

Open:

sql/retail_sales_health_check.sql

Run the queries in pgAdmin 4.

4. Review the findings

Open:

findings.md

to see the detailed business findings and recommendations.

👨‍💻 Author

Prathamesh Bhujbal

Aspiring Data Analyst

Skills

SQL • PostgreSQL • Python • Excel • Power BI • Data Analysis
