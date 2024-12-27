-- SQL Analysis Project

--	1. Total revenue on all sales
		select round(sum(store.products.unit_price_USD
						*store.sales.quantity), 2) as Total_Revenue
        from store.products
			join store.sales on (store.products.product_key=store.sales.product_key);

--	2. Total Profit on all sales
		select round(sum(store.products.unit_price_USD
						*store.sales.quantity), 2) as Total_Reveue,
				round(sum(store.products.unit_cost_USD
						*store.sales.quantity), 2) as Total_Cost,
				round((select round(sum(store.products.unit_price_USD
						*store.sales.quantity), 2)
                        -round(sum(store.products.unit_cost_USD
						*store.sales.quantity), 2)), 2) as Total_Profit
		from store.products
			join store.sales on (store.products.product_key=store.sales.product_key);

--	3. Total Quantity on all sales
		select sum(store.sales.quantity) as Total_Quantity
				from store.sales

--	4. Year Over Year Sales
		with cte as(select year(store.sales.order_date) as Year,
						round(sum(store.products.unit_price_USD
						*store.sales.quantity), 2) as Sales	
		from store.sales
            join store.products on (store.products.product_key=store.sales.product_key)
				group by Year(store.sales.order_date))
		select c1.*, round((((c1.Sales - c2.Sales) / c2.Sales) * 100),2) as Percent_Growth
		from cte c1
			left join cte c2 on c1.Year = c2.Year + 1

--	5. Year Over Year Profit
		with cte as(select year(store.sales.order_date) as Year,
						round(sum(store.products.unit_price_USD
						*store.sales.quantity)
                        -sum(store.products.unit_cost_USD
						*store.sales.quantity), 2) as Profit
		from store.sales
            join store.products on (store.products.product_key=store.sales.product_key)
				group by Year(store.sales.order_date))
		select c1.*, round((((c1.Profit - c2.Profit) / c2.Profit) * 100),2) as Percent_Growth
		from cte c1
			left join cte c2 on c1.Year = c2.Year + 1

--	6. Year Over Year Quantity Sold
		with cte as(select year(store.sales.order_date) as Year,
						sum(store.sales.quantity) as Quantity
		from store.sales
			group by year(store.sales.order_date))
        select c1.*, round((((c1.Quantity - c2.Quantity)/c2.Quantity)*100),2) as Percent_Growth
        from cte c1
			left join cte c2 on c1.Year=c2.Year+1
            
--	7. Total Order on overall sales
		select count(distinct store.sales.order_number) as Total_Order
				from store.sales

--	8. Average Order Value
		select round((sum(store.products.unit_price_USD
						*store.sales.quantity))/
				(count(distinct store.sales.order_number)), 2) as avg_order_value
		from store.products
			join store.sales on (store.products.product_key=store.sales.product_key)
            
--	9. Average Product Per Order
		select round((sum(store.sales.quantity))/
				(count(distinct store.sales.order_number)), 2) as avg_product_per_order
		from store.sales
        
--	10. Daily Trend For Total Order
		select dayofweek(store.sales.order_date) as day_number,
					dayname(store.sales.order_date) as dayname,
						count(distinct store.sales.order_number) as Total_Order
		from store.sales
				group by day_number, dayname
					order by day_number
                    
--	11. Monthly Trend For Total Order
		select month(store.sales.order_date) as month_number,
				monthname(store.sales.order_date) as month_name,
					count(distinct store.sales.order_number) as Total_Order
		from store.sales
			group by month_number, month_name
				order by month_number

--	12. Top 3 Category by Total Sales in 2021
		select store.products.category as Category,
			round(sum(store.sales.quantity
					*store.products.unit_price_USD),2) as Total_Sales
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
			where year(store.sales.order_date) = 2021
				group by Category
					order by Total_Sales desc
				limit 3

--	13. Bottom 3 Category by Total Sales in 2021
	select store.products.category as Category,
			round(sum(store.sales.quantity
					*store.products.unit_price_USD),2) as Total_Sales
	from store.products
		join store.sales on (store.sales.product_key = store.products.product_key)
			where year(store.sales.order_date) = 2021
		group by Category
			order by Total_Sales asc
		limit 3

--	14. Top 3 Category by Quantity Sold in 2021
		select store.products.category as Category,
				sum(store.sales.quantity) as Quantity
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2021
		group by Category
			order by Quantity desc
		limit 3

--	15. Bottom 3 Category by Quantity Sold in 2021
		select store.products.category as Category,
					sum(store.sales.quantity) as Quantity
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2021
		group by Category
			order by Quantity asc
		limit 3

--	16. Top 3 Category by Total Orders in 2021
		select store.products.category as Category,
					count(distinct store.sales.order_number) as Total_Order
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2021
		group by Category
			order by Total_Order desc
		limit 3

--	17. Bottom 3 Category by Total Orders in 2021
		select store.products.category as Category,
					count(distinct store.sales.order_number) as Total_Order
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2021
		group by Category
			order by Total_Order asc
		limit 3

--	18. Best sub-category by Total Revenue in 2020
		select store.products.subcategory as Subcategory,
				round(sum(store.sales.quantity
						*store.products.unit_price_USD),2) as Total_Revenue
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2020
		group by Subcategory
			order by Total_Revenue desc
		limit 1

--	19. Worst sub-category by Total Revenue in 2020
		select store.products.subcategory as Subcategory,
				round(sum(store.sales.quantity
					*store.products.unit_price_USD),2) as Total_Revenue
		from store.products
			join store.sales on (store.sales.product_key = store.products.product_key)
				where year(store.sales.order_date) = 2020
		group by Subcategory
			order by Total_Revenue asc
		limit 1

--	20. Which state has the highest sales rate in 2021
		select store.customers.state as State,
					round(sum(store.sales.quantity
						*store.products.unit_price_USD), 2) as Sales
			from store.customers
					join store.sales on (store.sales.customer_key = store.customers.customer_key)
						join store.products on (store.sales.product_key = store.products.product_key)
							where year(store.sales.order_date) = 2021
			group by State
				order by Sales desc
					limit 1

--	21. Who are the customers with the highest shopping amount in 2021
		select store.customers.name as Name,
			store.customers.gender as Gender,
				store.customers.birthday as Birthday,
					round(sum(store.sales.quantity
						*store.products.unit_price_USD), 2) as Amount_Sales
		from store.customers
			join store.sales on (store.sales.customer_key = store.customers.customer_key)
				join store.products on (store.sales.product_key = store.products.product_key)
					where year(store.sales.order_date) = 2021
		group by Name, Gender, Birthday
			order by Amount_Sales desc
		limit 1
            
