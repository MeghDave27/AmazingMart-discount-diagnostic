SELECT o.Country,
       SUM(ob.Sales) AS total_sales,
       SUM(ob.Profit) AS total_profit,
       ROUND(SUM(ob.Profit)/SUM(ob.Sales)*100, 1) AS margin_pct,
       AVG(ob.Discount) AS avg_discount
FROM OrderBreakdown ob
JOIN ListOfOrders o ON ob.OrderID = o.OrderID
GROUP BY o.Country
ORDER BY total_profit ASC;