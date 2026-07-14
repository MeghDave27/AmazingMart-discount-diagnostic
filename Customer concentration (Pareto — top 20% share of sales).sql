SELECT CustomerName, total_sales,
       ROUND(SUM(total_sales) OVER (ORDER BY total_sales DESC)
             / SUM(total_sales) OVER () * 100, 1) AS cum_pct
FROM (
  SELECT o.CustomerName, SUM(ob.Sales) AS total_sales
  FROM OrderBreakdown ob
  JOIN ListOfOrders o ON ob.OrderID = o.OrderID
  GROUP BY o.CustomerName
) t
ORDER BY total_sales DESC;