select Subcategory,
sum(Sales) as total_sales,
sum(Profit) as total_profit,
(SUM(Profit)/SUM(Sales)*100) AS margin_pct
from OrderBreakdown
group by SubCategory
order by total_profit asc
