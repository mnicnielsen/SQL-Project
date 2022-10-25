--CREATE AND COPY IN all_sessions TABLE
CREATE TABLE all_sessions (
	fullVisitorId VARCHAR(19),
	channelGrouping VARCHAR(14),
	time TIME,
	country VARCHAR(20),
	city VARCHAR(29),
	totalTransactionRevenue FLOAT(5),
	transactions INT,
	timeOnSite INT,
	pageviews INT,
	sessionQualityDim INT,
	date DATE,
	visitId INT,
	type VARCHAR(10),
	productRefundAmount FLOAT(5),
	productQuantity INT,
	productPrice FLOAT(5),
	productRevenue FLOAT(5),
	productSKU VARCHAR(20),
	v2ProductName VARCHAR(80),
	v2ProductCategory VARCHAR(60),
	productVariant VARCHAR(25),
	currencyCode VARCHAR(10),
	itemQuantity INT,
	itemRevenue FLOAT(5),
	transactionRevenue INT,
	transactionId VARCHAR(25),
	pageTitle VARCHAR(600),
	searchKeyword VARCHAR(50),
	pagePathLevel1 VARCHAR(20),
	eCommerceAction_type INT,
	eCommerceAction_step INT,
	eCommerceAction_option VARCHAR(20),
	PRIMARY KEY (visitId)
);

COPY all_sessions
(
	fullVisitorId, 
	channelGrouping, 
	time, 
	country, 
	city, 
	totalTransactionRevenue, 
	transactions, 
	timeOnSite, 
	pageviews, 
	sessionQualityDim, 
	date, 
	visitId, 
	type, 
	productRefundAmount, 
	productQuantity, 
	productPrice, 
	productRevenue, 
	productSKU, 
	v2ProductName, 
	v2ProductCategory, 
	productVariant, 
	currencyCode, 
	itemQuantity, 
	itemRevenue, 
	transactionRevenue, 
	transactionId, 
	pageTitle, 
	searchKeyword, 
	pagePathLevel1, 
	eCommerceAction_type, 
	eCommerceAction_step, 
	eCommerceAction_option
)
	FROM 'C:\Users\Public\all_sessions.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM all_sessions;

ALTER TABLE all_sessions
ALTER COLUMN time TYPE VARCHAR(10);

ALTER TABLE all_sessions
DROP CONSTRAINT all_sessions_pkey;

--CREATE AND COPY IN products TABLE
CREATE TABLE products (
	SKU VARCHAR(16),
	name VARCHAR(51),
	orderedQuantity INT,
	stockLevel INT,
	restockingLeadTime INT,
	sentimentScore FLOAT(6),
	sentimentMagnitude FLOAT(5)
);

COPY products
(
	SKU,
	name,
	orderedQuantity,
	stockLevel,
	restockingLeadTime,
	sentimentScore,
	sentimentMagnitude
)
	FROM 'C:\Users\Public\Data\products.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM products;

--CREATE AND COPY IN sales_by_sku TABLE
CREATE TABLE sales_by_sku (
	productSKU VARCHAR(20),
	total_ordered INT
);

COPY sales_by_sku
(
	productSKU,
	total_ordered
)
	FROM 'C:\Users\Public\Data\sales_by_sku.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM sales_by_sku;


--CREATE AND COPY IN sales_report TABLE
CREATE TABLE sales_report (
	productSKU VARCHAR(14),
	total_ordered INT,
	name VARCHAR(51),
	stockLevel INT,
	restockingLeadTime INT,
	sentimentScore FLOAT(4),
	sentimentMagnitude FLOAT(3),
	ratio FLOAT(22)
);

COPY sales_report
(
	productSKU,
	total_ordered,
	name,
	stockLevel,
	restockingLeadTime,
	sentimentScore,
	sentimentMagnitude,
	ratio
)
	FROM 'C:\Users\Public\Data\sales_report.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM sales_report;

--CREATE AND COPY IN analytics TABLE
CREATE TABLE analytics (
	visitNumber INT,
    visitId INT,
    visitStartTime INT,
    date DATE,
    fullvisitorId VARCHAR(19),
    userid VARCHAR(30),
    channelGrouping VARCHAR(14),
    socialEngagementType VARCHAR(20),
    units_sold INT,
    pageviews INT,
    timeonsite INT,
    bounces INT,
    revenue INT,
    unit_price INT
);

COPY analytics
(
	visitNumber,
    visitId,
    visitStartTime,
    date,
    fullvisitorId,
    userid,
    channelGrouping,
    socialEngagementType,
    units_sold,
    pageviews,
    timeonsite,
    bounces,
    revenue,
    unit_price
)
	FROM 'C:\Users\Public\Data\analytics.csv'
	DELIMITER ','
	CSV HEADER;
	
ALTER TABLE analytics
ALTER COLUMN revenue TYPE FLOAT(10);
	
SELECT * FROM analytics
LIMIT 50;	

--Finding Primary Keys
SELECT COUNT(*) FROM all_sessions;--15,134 rows
SELECT COUNT(DISTINCT visitid) FROM all_sessions;--14,556 values
SELECT COUNT(DISTINCT fullvisitorid) FROM all_sessions; --14,223
SELECT COUNT(DISTINCT transactionid) FROM all_sessions; --9 values

SELECT COUNT(*) FROM analytics; --4301122
SELECT COUNT(DISTINCT visitnumber) FROM analytics; --222
SELECT COUNT(DISTINCT visitid) FROM analytics; --148642
SELECT COUNT(DISTINCT userid) FROM analytics; --0
SELECT DISTINCT COUNT(fullvisitorid) FROM analytics; --4301122

SELECT COUNT(*) FROM products; --1092
SELECT COUNT(DISTINCT sku) FROM products; --1092

SELECT COUNT(*) FROM sales_by_sku; --462
SELECT COUNT(DISTINCT productsku) FROM sales_by_sku; --462

SELECT COUNT(*) FROM sales_report; --454
SELECT COUNT(DISTINCT productsku) FROM sales_report; --454

--COUNT ditinct values in all_sessions
SELECT
	COUNT (DISTINCT (id)) AS id,
	COUNT (DISTINCT fullVisitorId) AS fullVisitorId,
	COUNT (DISTINCT channelGrouping) AS channelGrouping,
	COUNT (DISTINCT time) AS time,
	COUNT (DISTINCT country) AS country,
	COUNT (DISTINCT city) AS city,
	COUNT (DISTINCT totalTransactionRevenue) AS totalTransactionRevenue,
	COUNT (DISTINCT transactions) AS transactions,
	COUNT (DISTINCT timeOnSite) AS timeOnSite,
	COUNT (DISTINCT pageviews) AS pageviews,
	COUNT (DISTINCT sessionQualityDim) AS sessionQualityDim,
	COUNT (DISTINCT date) AS date,
	COUNT (DISTINCT visitId) AS visitId,
	COUNT (DISTINCT type) AS type,
	COUNT (DISTINCT productRefundAmount) AS productRefundAmount,
	COUNT (DISTINCT productQuantity) AS productQuantity,
	COUNT (DISTINCT productPrice) AS productPrice,
	COUNT (DISTINCT productRevenue) AS productRevenue,
	COUNT (DISTINCT productSKU) AS productSKU,
	COUNT (DISTINCT v2ProductName) AS v2ProductName,
	COUNT (DISTINCT v2ProductCategory) AS v2ProductCategory,
	COUNT (DISTINCT productVariant) AS productVariant,
	COUNT (DISTINCT currencyCode) AS currencyCode,
	COUNT (DISTINCT itemQuantity) AS itemQuantity,
	COUNT (DISTINCT itemRevenue) AS itemRevenue,
	COUNT (DISTINCT transactionRevenue) AS transactionRevenue,
	COUNT (DISTINCT transactionId) AS transactionId,
	COUNT (DISTINCT pageTitle) AS pageTitle,
	COUNT (DISTINCT searchKeyword) AS searchKeyword,
	COUNT (DISTINCT pagePathLevel1) AS pagePathLevel1,
	COUNT (DISTINCT eCommerceAction_type) AS eCommerceAction_type,
	COUNT (DISTINCT eCommerceAction_step) AS eCommerceAction_step,
	COUNT (DISTINCT eCommerceAction_option) AS eCommerceAction_option
FROM all_sessions;

--ADD primary key to all_sessions
ALTER TABLE all_sessions ADD COLUMN id SERIAL PRIMARY KEY;

SELECT * FROM all_sessions LIMIT 10;

SELECT
	fullVisitorId, 
	channelGrouping, 
	time, 
	country, 
	city, 
	totalTransactionRevenue, 
	transactions, 
	timeOnSite, 
	pageviews, 
	sessionQualityDim, 
	date, 
	visitId, 
	type, 
	productRefundAmount, 
	productQuantity, 
	productPrice, 
	productRevenue, 
	productSKU, 
	v2ProductName, 
	v2ProductCategory, 
	productVariant, 
	currencyCode, 
	itemQuantity, 
	itemRevenue, 
	transactionRevenue, 
	transactionId, 
	pageTitle, 
	searchKeyword, 
	pagePathLevel1, 
	eCommerceAction_type, 
	eCommerceAction_step, 
	eCommerceAction_option
FROM all_sessions
GROUP BY
	fullVisitorId, 
	channelGrouping, 
	time, 
	country, 
	city, 
	totalTransactionRevenue, 
	transactions, 
	timeOnSite, 
	pageviews, 
	sessionQualityDim, 
	date, 
	visitId, 
	type, 
	productRefundAmount, 
	productQuantity, 
	productPrice, 
	productRevenue, 
	productSKU, 
	v2ProductName, 
	v2ProductCategory, 
	productVariant, 
	currencyCode, 
	itemQuantity, 
	itemRevenue, 
	transactionRevenue, 
	transactionId, 
	pageTitle, 
	searchKeyword, 
	pagePathLevel1, 
	eCommerceAction_type, 
	eCommerceAction_step, 
	eCommerceAction_option
HAVING COUNT(id) >1;

--ADD primary key to analytics
ALTER TABLE analytics ADD COLUMN id SERIAL PRIMARY KEY;

--COUNT distinct columns in analytics
SELECT
	COUNT(DISTINCT id) AS id,
	COUNT(DISTINCT visitNumber) AS visitNumber,
	COUNT(DISTINCT visitId) AS visitId,
	COUNT(DISTINCT visitStartTime) AS visitStartTime,
	COUNT(DISTINCT date) AS date,
	COUNT(DISTINCT fullvisitorId) AS fullvisitorId,
	COUNT(DISTINCT userid) AS userid,
	COUNT(DISTINCT channelGrouping) AS channelGrouping,
	COUNT(DISTINCT socialEngagementType) AS socialEngagementType,
	COUNT(DISTINCT units_sold) AS units_sold,
	COUNT(DISTINCT pageviews) AS pageviews,
	COUNT(DISTINCT timeonsite) AS timeonsite,
	COUNT(DISTINCT bounces) AS bounces,
	COUNT(DISTINCT revenue) AS revenue,
	COUNT(DISTINCT unit_price) AS unit_price
FROM analytics;

--count duplicate rows (all values) in analytics
SELECT
	visitNumber,
	visitId,
	visitStartTime,
	date,
	fullvisitorId,
	userid,
	channelGrouping,
	socialEngagementType,
	units_sold,
	pageviews,
	timeonsite,
	bounces,
	revenue,
	unit_price
FROM analytics
GROUP BY
	visitNumber,
	visitId,
	visitStartTime,
	date,
	fullvisitorId,
	userid,
	channelGrouping,
	socialEngagementType,
	units_sold,
	pageviews,
	timeonsite,
	bounces,
	revenue,
	unit_price
HAVING COUNT(id) >1
ORDER BY visitid, unit_price;

SELECT
	COUNT(DISTINCT id) AS id
FROM analytics;

--COUNT distinct values in products table
SELECT
	COUNT(*) AS number_rows,
	COUNT (DISTINCT SKU) AS SKU, 
	COUNT (DISTINCT name) AS name, 
	COUNT (DISTINCT orderedQuantity) AS orderedQuantity, 
	COUNT (DISTINCT stockLevel) AS stockLevel, 
	COUNT (DISTINCT restockingLeadTime) AS restockingLeadTime, 
	COUNT (DISTINCT sentimentScore) AS sentimentScore, 
	COUNT (DISTINCT sentimentMagnitude) AS sentimentMagnitude
FROM products;

--COUNT distinct values in sales_by_sku table
SELECT
	COUNT(*) AS number_rows,
	COUNT (DISTINCT productSKU) AS productSKU, 
	COUNT (DISTINCT total_ordered) AS total_ordered
FROM sales_by_sku;

--COUNT distinct values in sales_report table
SELECT
	COUNT(*) AS number_rows,
	COUNT (DISTINCT productSKU) AS productSKU, 
	COUNT (DISTINCT total_ordered) AS total_ordered, 
	COUNT (DISTINCT name) AS name, 
	COUNT (DISTINCT stockLevel) AS stockLevel, 
	COUNT (DISTINCT restockingLeadTime) AS restockingLeadTime, 
	COUNT (DISTINCT sentimentScore) AS sentimentScore, 
	COUNT (DISTINCT sentimentMagnitude) AS sentimentMagnitude, 
	COUNT (DISTINCT ratio) AS ratio
FROM sales_report;

--SET PRIMARY KEYS
ALTER TABLE all_sessions
DROP CONSTRAINT all_sessions_pkey;
ALTER TABLE all_sessions ADD PRIMARY KEY (id);

ALTER TABLE analytics
DROP CONSTRAINT analytics_pkey;
ALTER TABLE analytics ADD PRIMARY KEY (id);


ALTER TABLE sales_by_sku add primary key (productsku);
ALTER TABLE sales_report add primary key (productsku);
ALTER TABLE products add primary key (sku);

SELECT 
	fullVisitorId, 
	channelGrouping, 
	time, 
	country, 
	city, 
	totalTransactionRevenue, 
	transactions, 
	timeOnSite, 
	pageviews, 
	sessionQualityDim, 
	date, 
	visitId, 
	type, 
	productRefundAmount, 
	productQuantity, 
	productPrice, 
	productRevenue, 
	productSKU, 
	v2ProductName, 
	v2ProductCategory, 
	productVariant, 
	currencyCode, 
	itemQuantity, 
	itemRevenue, 
	transactionRevenue, 
	transactionId, 
	pageTitle, 
	searchKeyword, 
	pagePathLevel1, 
	eCommerceAction_type, 
	eCommerceAction_step, 
	eCommerceAction_option,
	COUNT(*)
FROM all_sessions
GROUP BY
	fullVisitorId, 
	channelGrouping, 
	time, 
	country, 
	city, 
	totalTransactionRevenue, 
	transactions, 
	timeOnSite, 
	pageviews, 
	sessionQualityDim, 
	date, 
	visitId, 
	type, 
	productRefundAmount, 
	productQuantity, 
	productPrice, 
	productRevenue, 
	productSKU, 
	v2ProductName, 
	v2ProductCategory, 
	productVariant, 
	currencyCode, 
	itemQuantity, 
	itemRevenue, 
	transactionRevenue, 
	transactionId, 
	pageTitle, 
	searchKeyword, 
	pagePathLevel1, 
	eCommerceAction_type, 
	eCommerceAction_step, 
	eCommerceAction_option
HAVING COUNT(*)>1;

--FIND DUPLICATES IN ANALYSIS
SELECT SUM(count) FROM
(SELECT 
	visitId,
	visitStartTime,
	date,
	fullvisitorId,
	userid,
	channelGrouping,
	socialEngagementType,
	units_sold,
	pageviews,
	timeonsite,
	bounces,
	revenue,
	unit_price,
	COUNT(*)
FROM analytics
GROUP BY
visitNumber,
	visitId,
	visitStartTime,
	date,
	fullvisitorId,
	userid,
	channelGrouping,
	socialEngagementType,
	units_sold,
	pageviews,
	timeonsite,
	bounces,
	revenue,
	unit_price
HAVING COUNT(*)>1) AS dupanalysis;


SELECT *
FROM all_sessions a
JOIN (SELECT 
		visitid, COUNT(*)
	FROM all_sessions
	GROUP BY
	visitid
	HAVING COUNT(*)>1) b
ON a.visitid = b.visitid
ORDER BY a.visitid;

SELECT COUNT(*) FROM analytics;

SELECT totaltransactionrevenue, transactionrevenue FROM all_sessions WHERE transactionrevenue IS NOT NULL;

ALTER TABLE all_sessions DROP COLUMN transactionrevenue;

SELECT DISTINCT pagepathlevel1 FROM all_sessions;

SELECT currencycode, totaltransactionrevenue FROM all_sessions WHERE currencycode IS NULL and totaltransactionrevenue IS NOT NULL;

SELECT productvariant FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL AND productvariant IS LIKE '%not set%';

SELECT productcategory, newcategory, id FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL and newcategory IS NULL;

UPDATE all_sessions
 SET newcategory = 'Office'
 WHERE UPPER(productcategory) LIKE '%OFFICE%'  
AND Totaltransactionrevenue IS NOT NULL;

UPDATE all_sessions
 SET newcategory = 'Drinkware'
 WHERE UPPER(productcategory) LIKE '%DRINKWARE%'  
AND Totaltransactionrevenue IS NOT NULL;

SELECT * FROM all_sessions WHERE productcategory = '${escCatTitle}' AND totaltransactionrevenue IS NOT NULL;

UPDATE all_sessions
 SET newcategory = 'Apparel'
 WHERE is = 5834;

SELECT * FROM all_sessions WHERE id = 9000;

UPDATE all_sessions
 SET newcategory = 'Nest'
 WHERE id = 8545;
 
 SELECT productname, productcategory, newcategory, id FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL;
 
 UPDATE all_sessions
 SET newcategory = 'Nest'
 WHERE id = 9000;
 
  UPDATE all_sessions
 SET newcategory = productcategory
 WHERE newcategory IS NULL and totaltransactionrevenue IS NOT NULL;
 
 SELECT productname, productcategory, newcategory, id FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL AND newcategory = 'Shop by Brand';

UPDATE all_sessions
 SET newcategory = 'Electronics'
 WHERE totaltransactionrevenue IS NOT NULL
 AND (
 id = 3445);
 
 
UPDATE all_sessions
 SET newcategory = 'Apparel'
 WHERE totaltransactionrevenue IS NOT NULL
 AND (
 id = 5909 OR id = 9996);
 
 UPDATE all_sessions
 SET newcategory = 'Drinkware'
 WHERE totaltransactionrevenue IS NOT NULL
 AND (
 id = 14936);
 
 
 SELECT productname, productcategory, newcategory, id FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL;
 
 UPDATE all_sessions
 SET newcategory = 'Waze'
 WHERE totaltransactionrevenue IS NOT NULL
 AND (
 id = 3332);
 
 SELECT * FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL;
 
SELECT productprice FROM all_sessions;

UPDATE all_sessions
 SET productprice = productprice/1000000;
 
 SELECT * FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL and city = 'New York';
 
 --Question 1: Which cities and countries have the highest level of transaction revenues on the site?
 --COUNTRY
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
		
--CITY
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
 
 --**Question 2: What is the average number of products ordered from visitors in each city and country?**
 --This data is unavailable.
 
 --**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**
 --COUNTRY
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
		 
--CITY
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

--**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**
--COUNTRY
SELECT 
	country,
	productname,
	COUNT(productname) AS transaction_count
FROM all_sessions 
WHERE totaltransactionrevenue IS NOT NULL
GROUP BY country, productname
ORDER BY country, transaction_count DESC;

SELECT 
	country, 
	city,
	productname,
	COUNT(productname) AS transaction_count
FROM all_sessions 
WHERE totaltransactionrevenue IS NOT NULL AND city != 'not available in demo dataset'
GROUP BY country, city, productname
ORDER BY country, city, transaction_count DESC;

--**Question 5: Can we summarize the impact of revenue generated from each city/country?**
 --COUNTRY
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
		
--CITY
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
		ORDER BY city) AS sq5
		ORDER BY revenue_by_location DESC;
		
--Question 1: Find the number of visitors who looked at more than one product type. 
SELECT SUM(number_of_transactions_per_visitor) FROM 
	(SELECT 
		fullvisitorid, 
		COUNT(visitid) AS number_of_productviews 
	FROM all_sessions
	GROUP BY 
		fullvisitorid 
	ORDER BY COUNT(visitid) DESC) AS sq3;

--COUNT number of visitors who viewed multiple products. 
SELECT SUM(count_visitors) FROM
(SELECT 
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
	ORDER BY number_of_productviews DESC) AS sq13;
	
--Question 2: Find the number of visitors who purchased more than one product type.
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
	
--Question 3: How much time did visitors spend on the site who DID purchase items vs those who did not? 
SELECT 
avg(timeonsite) FROM all_sessions  AS avg_time_did_not_purchase
WHERE timeonsite IS NOT NULL and totaltransactionrevenue IS NULL;

SELECT 
avg(timeonsite) FROM all_sessions  AS avg_time_did_purchase
WHERE timeonsite IS NOT NULL and totaltransactionrevenue IS NOT NULL;

--Question 4: How many users spent less than 1 minute seconds on the site? 
SELECT COUNT(timeonsite) FROM all_sessions
WHERE timeonsite < 60;

--Question 5: Did visitors come back to the site on more than one different day? 
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

(SELECT fullvisitorid FROM 
	(SELECT 
		fullvisitorid, 
		COUNT(visitid) AS number_of_productviews 
	FROM all_sessions
	GROUP BY 
		fullvisitorid 
	ORDER BY COUNT(visitid) DESC) AS sq3
WHERE number_of_productviews > 1);
	
SELECT DISTINCT newcategory FROM all_sessions WHERE newcategory IS NOT NULL;

--FIND VISITOR IDs of visitors who viewed more than one product (including those who purchased)
(SELECT fullvisitorid FROM 
	(SELECT 
		fullvisitorid, 
		COUNT(visitid) AS number_of_productviews 
	FROM all_sessions
	GROUP BY 
		fullvisitorid 
	ORDER BY COUNT(visitid) DESC) AS sq3
WHERE number_of_productviews > 1) multvisitsqs;

--CHECK FOR INCONSISTENT CATEGORIES
SELECT DISTINCT newcategory FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL; 












 
 















