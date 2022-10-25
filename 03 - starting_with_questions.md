Answer the following questions and provide the SQL queries used to find the answer.

 # Starting_with_questions   


## Question 1: Which cities and countries have the highest level of transaction revenues on the site?**

### SQL Queries:<br><br>
 #### By Country
 ```SQL
 SELECT 
 	country, 
	revenue_by_location, 
	sum(revenue_by_location) OVER () AS total_revenue
	FROM 
		(SELECT 
			country, 
			sum(totaltransactionrevenue) AS revenue_by_location
		FROM all_sessions 
			WHERE totaltransactionrevenue IS NOT NULL
		GROUP BY country 
		ORDER BY country) AS sq;
```
<br>

#### By City
 ```SQL 
 SELECT 
 	city, 
	revenue_by_location, 
	sum(revenue_by_location) OVER () AS total_revenue
	FROM 
		(SELECT 
			city, 
			sum(totaltransactionrevenue) AS revenue_by_location
		FROM all_sessions 
			WHERE totaltransactionrevenue IS NOT NULL AND CITY != 'not available in demo dataset'
		GROUP BY city 
		ORDER BY city) AS sq2;
```


### Answer:<br><br>

#### By Country
| Country        | Revenue | Total Revenue |
|----------------|---------|---------------|
|Australia|358|14281.31|
|Canada|82.16|14281.31|
|Israel|602|14281.31|
|Switzerland|16.99|14281.31|
|United States|13222.162|14281.31|


<br><br>
#### By City
|City|	Revenue	|Total Revenue|
|---|---|---|
|Atlanta|	854.44|8188.75|
|Austin|	157.78|8188.75|
|Chicago|	449.52|8188.75|
|Columbus|	21.99|8188.75|
|Houston|	38.98|8188.75|
|Los Angeles|	479.48|8188.75|
|Mountain View|	483.36|8188.75|
|Nashville|	157|8188.75|
|New York|	598.35|8188.75|
|Palo Alto|	608|8188.75|
|San Bruno|	103.77|8188.75|
|San Francisco|	1564.32|8188.75|
|San Jose|	262.38|8188.75|
|Seattle|	358|8188.75|
|Sunnyvale|	992.23|8188.75|
|Sydney|	358|8188.75|
|Tel Aviv-Yafo|	602|8188.75|
|Toronto|	82.16|8188.75|
|Zurich|	16.99|8188.75|


<br><br>
## **Question 2: What is the average number of products ordered from visitors in each city and country?**


### SQL Queries:
N/A




### Answer:
Product quantity data was not usable. Only 18 transactions included product quantities and they were not correlated to transaction revenue by their quantities and product prices, so could not estimate product quantities for missing data. 

<br><br>
## **Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


### SQL Queries:
#### By Country
```SQL
SELECT 
 	country, 
	newcategory, 
	category_count,
	SUM(category_count) OVER (PARTITION BY country) AS total_transactions_per_country
	FROM 
		(SELECT 
			country, 
			newcategory, 
			COUNT(newcategory) AS category_count
		FROM all_sessions 
		WHERE totaltransactionrevenue IS NOT NULL 
		GROUP BY 
			country, 
			newcategory
		 ORDER BY country) AS sq3;
```

#### By City
```SQL
SELECT 
 	country, 
	city, 
	newcategory, 
	category_count,
	SUM(category_count) OVER (PARTITION BY city) AS total_transactions_per_city
	FROM 
(SELECT 
	country, 
	city, 
	newcategory, 
	COUNT(newcategory) AS category_count
FROM all_sessions 
	WHERE totaltransactionrevenue IS NOT NULL AND CITY != 'not available in demo dataset'
GROUP BY 
	country,	
	city, 
	newcategory
ORDER BY city) AS sq4
ORDER BY country, city;
```


### Answer:
#### By Country
The United States is the only country with enough transactions to draw any conclusions. There were 77 transactions completed in the United States, and 1 each in Australia, Canada, Israel, and Switzerland. The most commonly purchased categories in the United States were Apparel (27 out of 77) and Nest (27 out of 77).

#### By City
Only three cities have more than five transactions (all in United States): Mountain View (8 transactions), New Yok (9 transactions), and San Franscisco (12 transactions). In Mountain View and New York, Apparel was the most commonly purchased category. In San Francisco, Nest was the most commonly purchased category. 

<br><br>
## **Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


### SQL Queries:
### By Country
```SQL
SELECT 
	country,
	productname,
	COUNT(productname) AS transaction_count
FROM all_sessions 
WHERE totaltransactionrevenue IS NOT NULL
GROUP BY country, productname
ORDER BY country, transaction_count DESC;
```

### By City
```SQL
SELECT 
	country, 
	city,
	productname,
	COUNT(productname) AS transaction_count
FROM all_sessions 
WHERE totaltransactionrevenue IS NOT NULL AND city != 'not available in demo dataset'
GROUP BY country, city, productname
ORDER BY country, city, transaction_count DESC;
```


## Answer:
The top-selling product in the United States is 'Nest® Learning Thermostat 3rd Gen-USA - Stainless Steel' with seven transactions. All other countries have only one transaction.

There were no instances of an item being purchased twice in any one city. 
<br><br>

## **Question 5: Can we summarize the impact of revenue generated from each city/country?**

### SQL Queries:
#### By Country
```SQL 
SELECT 
 	country, 
	revenue_by_location, 
	sum(revenue_by_location) OVER () AS total_revenue,
	100*revenue_by_location/sum(revenue_by_location) OVER () ||'%'AS percent_of_total_sales
	FROM 
		(SELECT 
			country, 
			sum(totaltransactionrevenue) AS revenue_by_location
		FROM all_sessions 
			WHERE totaltransactionrevenue IS NOT NULL
		GROUP BY country 
		ORDER BY country) AS sq;
```

#### By City
 ```SQL
 SELECT 
 	city, 
	revenue_by_location, 
	sum(revenue_by_location) OVER () AS total_revenue,
	100*revenue_by_location/sum(revenue_by_location) OVER () ||'%'AS percent_of_total_sales
	FROM 
		(SELECT 
			city, 
			sum(totaltransactionrevenue) AS revenue_by_location
		FROM all_sessions 
			WHERE totaltransactionrevenue IS NOT NULL AND city != 'not available in demo dataset'
		GROUP BY city 
		ORDER BY city) AS sq5;
```

### Answer:
#### By Country
The United States represents 93% of revenue, Israel 4.2%, Australia, 2.5%, Canada 0.6%, Switzerland 0.1%.

#### By City
The top five cities for revenue are San Francisco (19%), Sunnyvale (12.1%), Atlanta (10.4%), Palo Alto (7.4%) and Tel Aviv-Yafo (7.3%).







