## What issues will you address by cleaning the data?
* Remove unneccessary columns that only have null values
* Remove columns with partial/redundant data
* Update currency code for all rows with sales
* Renamed some columns for clarity (in hindsight, should have done this more/earlier) 
* Fix all financial values by dividing by 1,000,000
* Change product categories to be consistent and correct 


## Queries:
Below, provide the SQL queries you used to clean your data.
### Remove unneccessary columns that only have null values
```SQL
ALTER TABLE all_sessions DROP COLUMN itemrevenue;
```

### Remove columns with partial/redundant data
```SQL
ALTER TABLE all_sessions DROP COLUMN transactionrevenue;
```

### Update currency code for all rows with sales
```SQL 
UPDATE all_sessions
SET currencycode = 'USD'
WHERE currencycode IS NULL and totaltransactionrevenue IS NOT NULL;
```

#### Renamed some columns for clarity (in hindsight, should have done this more/earlier)
```SQL
ALTER TABLE all_sessions RENAME COLUMN v2productcategory TO productcategory;
ALTER TABLE all_sessions RENAME COLUMN v2productname TO productname;
```

#### Fix all financial values by dividing by 1,000,000
```SQL
UPDATE all_sessions
 SET totaltransactionrevenue = totaltransactionrevenue/1000000
 WHERE totaltransactionrevenue IS NOT NULL;
```

#### Change product categories to be consistent and correct (example below, this was repeated for all categories)
```SQL
 ALTER TABLE all_sessions
 ADD newcategory VARCHAR(30);

 UPDATE all_sessions
 SET newcategory = 'Apparel'
 WHERE UPPER(productcategory) LIKE '%APPAREL%'  
AND Totaltransactionrevenue IS NOT NULL;

SELECT productcategory, newcategory FROM all_sessions WHERE totaltransactionrevenue IS NOT NULL and newcategory IS NULL;

SELECT * FROM all_sessions 
WHERE totaltransactionrevenue IS NOT NULL 
AND (productcategory = '${escCatTitle}' OR productcategory = '(not set)')

