SELECT COUNT(*) AS total_rows
FROM superstore_sales;

SELECT *
FROM superstore_sales
LIMIT 10;

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(order_id) AS missing_order_id,
    COUNT(*) - COUNT(order_date) AS missing_order_date,
    COUNT(*) - COUNT(category) AS missing_category,
    COUNT(*) - COUNT(sub_category) AS missing_sub_category,
    COUNT(*) - COUNT(region) AS missing_region,
    COUNT(*) - COUNT(sales) AS missing_sales,
    COUNT(*) - COUNT(discount) AS missing_discount,
    COUNT(*) - COUNT(profit) AS missing_profit
FROM superstore_sales;

SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM superstore_sales;

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY total_profit DESC;

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY total_profit DESC;

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit DESC;

SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount > 0 AND discount <= 0.20 THEN '1-20%'
        ELSE '20%+'
    END AS discount_band,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount > 0 AND discount <= 0.20 THEN '1-20%'
        ELSE '20%+'
    END
ORDER BY total_profit DESC;

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
WHERE discount >= 0.20
GROUP BY category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;

SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount > 0 AND discount <= 0.20 THEN '1-20%'
        ELSE '20%+'
    END AS discount_band,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore_sales
GROUP BY
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount > 0 AND discount <= 0.20 THEN '1-20%'
        ELSE '20%+'
    END
ORDER BY profit_margin_pct DESC;