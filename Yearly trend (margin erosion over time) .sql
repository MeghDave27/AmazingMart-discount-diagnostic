select year(o.OrderDate) as yr,
			sum(ob.Sales) as Total_Sales,
            sum(ob.Profit) as Total_Profit,
            sum(ob.profit)/sum(ob.Sales)*100 as margin_pct
            from OrderBreakdown ob
            join ListOfOrders as o on ob.OrderID=o.OrderID
            group by yr
            order by yr