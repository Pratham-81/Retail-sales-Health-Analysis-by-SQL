# Retail Sales Health Check – Findings

## 1. Project Objective

The purpose of this analysis is to answer:

> **Which categories and regions actually make money once discounts are counted?**

The project uses PostgreSQL to analyze sales, profit, regions, categories, sub-categories, and the impact of discounts.

---

## 2. Dataset Summary

| Metric | Result |
|---|---:|
| Total records | **9,994** |
| Missing Order ID | **0** |
| Missing Order Date | **0** |
| Missing Category | **0** |
| Missing Sub-Category | **0** |
| Missing Region | **0** |
| Missing Sales | **0** |
| Missing Discount | **0** |
| Missing Profit | **0** |

### Data Quality Finding

The dataset contains **9,994 records**, and no missing values were found in the key analytical fields.

---

## 3. Order Date Range

| Metric | Date |
|---|---|
| Earliest order | **2014-01-03** |
| Latest order | **2017-12-30** |

The dataset covers almost four years of retail transactions.

---

## 4. Sales and Profit by Category

| Category | Total Sales | Total Profit |
|---|---:|---:|
| Technology | **$836,154.10** | **$145,455.66** |
| Office Supplies | $719,046.99 | **$122,490.88** |
| Furniture | $741,999.98 | **$18,451.25** |

### Key Finding

**Technology** is the most profitable category, generating **$145,455.66** in profit.

**Furniture** has sales of **$741,999.98**, but generates only **$18,451.25** in profit. This shows that high sales do not necessarily mean high profitability.

---

## 5. Sales and Profit by Sub-Category

Important results from the sub-category analysis:

| Rank | Category | Sub-Category | Total Sales | Total Profit |
|---:|---|---|---:|---:|
| 1 | Technology | Copiers | $149,528.01 | **$55,617.90** |
| 2 | Technology | Phones | $330,007.10 | **$44,516.25** |
| 3 | Technology | Accessories | $167,380.31 | **$41,936.78** |
| 4 | Office Supplies | Paper | $78,479.24 | **$34,053.34** |
| 5 | Office Supplies | Binders | $203,412.77 | **$30,221.64** |
| 6 | Furniture | Chairs | $328,449.13 | **$26,590.15** |
| 7 | Office Supplies | Storage | $223,843.59 | **$21,279.05** |
| 8 | Office Supplies | Appliances | $107,532.14 | **$18,138.07** |
| 9 | Furniture | Furnishings | $91,705.12 | **$13,059.25** |
| 10 | Office Supplies | Envelopes | $16,476.38 | **$6,964.10** |
| 11 | Office Supplies | Art | $27,118.80 | **$6,527.96** |
| 12 | Office Supplies | Labels | $12,486.30 | **$5,546.18** |
| 13 | Technology | Machines | $189,238.68 | **$3,384.73** |
| 14 | Office Supplies | Fasteners | $3,024.25 | **$949.53** |
| 15 | Office Supplies | Supplies | $46,673.52 | **-$1,188.99** |
| 16 | Furniture | Bookcases | $114,880.05 | **-$3,472.56** |
| 17 | Furniture | Tables | $206,965.68 | **-$17,725.59** |

### Key Finding

**Copiers** are the most profitable sub-category with **$55,617.90** profit.

**Tables** are the least profitable, with **-$17,725.59** profit despite generating **$206,965.68** in sales.

Three sub-categories have negative overall profit:

- Supplies: **-$1,188.99**
- Bookcases: **-$3,472.56**
- Tables: **-$17,725.59**

---

## 6. Sales and Profit by Region

| Region | Total Sales | Total Profit |
|---|---:|---:|
| **West** | $725,457.93 | **$108,418.79** |
| **East** | $678,781.36 | **$91,522.84** |
| South | $391,721.90 | **$46,749.71** |
| Central | $501,239.88 | **$39,706.45** |

### Key Finding

**West** is the most profitable region, generating **$108,418.79** in profit.

**Central** has the lowest profit at **$39,706.45**, despite generating more than $500,000 in sales.

---

## 7. Profit by Discount Band

Discounts were grouped into three bands:

| Discount Band | Definition |
|---|---|
| 0% | No discount |
| 1–20% | Greater than 0% and up to 20% |
| 20%+ | Greater than 20% |

### Results

| Discount Band | Order Lines | Total Sales | Total Profit |
|---|---:|---:|---:|
| **0%** | 4,798 | $1,087,908.47 | **$320,987.88** |
| **1–20%** | 3,803 | $846,522.17 | **$100,786.35** |
| **20%+** | 1,393 | $362,770.43 | **-$135,376.44** |

### 🔥 Most Important Finding

> **Profit turns negative at the 20%+ discount band.**

At discounts of **20% or more**, the dataset shows **$362,770.43 in sales but a $135,376.44 loss**.

This is the central business insight of the project.

Profit falls substantially as the discount level increases:

- 0% discount → **$320,987.88 profit**
- 1–20% discount → **$100,786.35 profit**
- 20%+ discount → **-$135,376.44 loss**

---

## 8. High-Discount Sub-Categories with Negative Profit

The following sub-categories have **discounts of at least 20%** and negative total profit when the high-discount transactions are aggregated.

| Category | Sub-Category | Total Sales | Total Profit |
|---|---|---:|---:|
| Furniture | Tables | $135,386.77 | **-$31,001.78** |
| Technology | Machines | $114,793.68 | **-$24,585.15** |
| Furniture | Bookcases | $55,385.49 | **-$10,967.26** |
| Office Supplies | Binders | $121,583.25 | **-$9,092.69** |
| Office Supplies | Appliances | $25,141.82 | **-$6,131.81** |
| Office Supplies | Storage | $65,989.85 | **-$4,249.35** |
| Furniture | Furnishings | $30,255.36 | **-$3,788.83** |
| Office Supplies | Supplies | $15,114.33 | **-$2,907.49** |
| Furniture | Chairs | $190,754.13 | **-$2,453.94** |

### Key Finding

**Tables** have the largest high-discount loss at approximately **-$31,001.78**.

**Machines** are another major concern, with approximately **-$24,585.15** in profit at high discount levels.

This shows that excessive discounting can make otherwise important sales categories financially unattractive.

---

## 9. Profit Margin by Discount Band

Profit margin is calculated as:

```text
Profit Margin = Total Profit / Total Sales × 100
```

Using the discount-band results:

| Discount Band | Total Sales | Total Profit | Profit Margin |
|---|---:|---:|---:|
| **0%** | $1,087,908.47 | $320,987.88 | **29.51%** |
| **1–20%** | $846,522.17 | $100,786.35 | **11.91%** |
| **20%+** | $362,770.43 | -$135,376.44 | **-37.32%** |

### Key Finding

The **20%+ discount band has a -37.32% profit margin**, compared with:

- **29.51%** at 0% discount
- **11.91%** at 1–20% discount

This provides additional evidence that heavy discounting is associated with severe profitability deterioration in this dataset.

---

# Top 3 Profitability Risks

### 1. Excessive Discounting

Discounts of **20% or more** are associated with a negative total profit of **$135,376.44**.

### 2. Unprofitable Sub-Categories

Tables, Bookcases, and Supplies have negative overall profit.

### 3. High Sales Can Hide Low Profit

Furniture generates **$741,999.98** in sales but only **$18,451.25** in profit. Tables alone generate more than $200,000 in sales but lose money overall.

---

# Business Recommendations

## 1. Control Deep Discounts

Review or limit discounts of **20% or more**, especially for sub-categories that already show negative profitability.

## 2. Review Tables and Machines

Tables and Machines show particularly large losses under high-discount conditions and should receive special pricing review.

## 3. Focus on Profit, Not Revenue Alone

Evaluate categories and products using both sales and profit margin. High revenue does not guarantee financial performance.

## 4. Protect Profitable Categories

Technology is the strongest category by total profit. Profitable products such as Copiers, Phones, and Accessories should be monitored to maintain healthy margins.

## 5. Monitor Regional Performance

West is the strongest region by profit, while Central has the lowest profit. Regional performance should therefore be evaluated using profitability as well as sales.

---

# Final Conclusion

The analysis demonstrates that **sales revenue alone does not provide a complete picture of business performance**.

The strongest finding is the impact of discounting:

> **Profit is positive at 0% and 1–20% discounts but becomes strongly negative at the 20%+ discount level.**

The **20%+ discount band produces a $135,376.44 loss and a -37.32% profit margin**.

Therefore, the business should carefully review deep-discount strategies, particularly for sub-categories such as **Tables and Machines**, where high discounts are associated with substantial losses.

