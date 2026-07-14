SELECT
  CASE
    WHEN Discount = 0 THEN '0%'
    WHEN Discount <= 0.1 THEN '0-10%'
    WHEN Discount <= 0.2 THEN '10-20%'
    WHEN Discount <= 0.3 THEN '20-30%'
    WHEN Discount <= 0.4 THEN '30-40%'
    WHEN Discount <= 0.5 THEN '40-50%'
    ELSE '50%+'
  END AS discount_band,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit,
  SUM(Profit)/SUM(Sales)*100 AS margin_pct
FROM OrderBreakdown
GROUP BY discount_band
ORDER BY discount_band;