# Starting_with_data

## Question 1: Find the number of visitors who viewed more than one product type. 

### SQL Queries:
```SQL 
SELECT 
	number_of_productviews,
	COUNT(number_of_productviews) AS count_visitors FROM 
		(SELECT 
			fullvisitorid, 
			COUNT(visitid) AS number_of_productviews
		FROM all_sessions
		GROUP BY 
			fullvisitorid 
		ORDER BY COUNT(visitid) DESC) AS sq12
	GROUP BY number_of_productviews
	ORDER BY number_of_productviews DESC
```

### Answer: 
1 visitor viewed 10 items, 2 visitors viewed 8 items, 3 visitors viewed 7 items, 2 visitors viewed 6 iems, 10 visitors viewed 4 items, 64 visitors viewed 3 items, and 714 visitors viewed 714 items. 13,429 visitors viewed only 1 item.  



<br><Br>
## Question 2: Find the number of visitors who purchased more than one product type. 

### SQL Queries:
```SQL
SELECT 
	number_of_products_purchased,
	COUNT(number_of_products_purchased) AS count_sales FROM 
		(SELECT 
			fullvisitorid, 
			COUNT(visitid) AS number_of_products_purchased
		FROM all_sessions
		 WHERE totaltransactionrevenue IS NOT NULL
		GROUP BY 
			fullvisitorid 
		ORDER BY COUNT(visitid) DESC) AS sq12
	GROUP BY number_of_products_purchased
	ORDER BY number_of_products_purchased DESC;
```

### Answer:
79 customers purchased only one product, 1 customer purchased two products. 


<br><br>
## Question 3: How much time did visitors spend on the site who DID purchase items vs those who did not? 

### SQL Queries:
```SQL SELECT 
avg(timeonsite) FROM all_sessions  AS avg_time_did_not_purchase
WHERE timeonsite IS NOT NULL and totaltransactionrevenue IS NULL;

SELECT 
avg(timeonsite) FROM all_sessions  AS avg_time_did_purchase
WHERE timeonsite IS NOT NULL and totaltransactionrevenue IS NOT NULL;
```

### Answer:
|Interaction Type|Average Time on Site|
|---|---|
|Viewed Only|3.7 minutes|
Purchased|9.4 minutes|

<br><br>
## Question 4: How many users spent less than 1 minute seconds on the site? 

### SQL Queries:
```SQL
SELECT COUNT(timeonsite) FROM all_sessions
WHERE timeonsite < 60;
```

#### Answer:
3729 visitors spent less than 1 minute on the site.


## Question 5: For visitors who viewed more than one product, did visitors view the site on more than one day? 

### SQL Queries:
```SQL
SELECT 
	number_of_dates_on_site,
	COUNT(number_of_dates_on_site) AS count_dates FROM 
		(SELECT 
			fullvisitorid, 
			COUNT(DISTINCT date) AS number_of_dates_on_site
		FROM all_sessions
		 WHERE fullvisitorid IN
			 (SELECT fullvisitorid FROM 
				(SELECT 
					fullvisitorid, 
					COUNT(visitid) AS number_of_productviews 
				FROM all_sessions
				GROUP BY 
					fullvisitorid 
				ORDER BY COUNT(visitid) DESC) AS sq3
		WHERE number_of_productviews > 1)
		GROUP BY 
			fullvisitorid 
		ORDER BY COUNT(date) DESC) AS sq12
	GROUP BY number_of_dates_on_site
	ORDER BY COUNT(number_of_dates_on_site) DESC;
```

### Answer:
794 viewed more than one product, 228 viewed the site on more than one day. 
