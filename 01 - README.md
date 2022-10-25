# Final-Project-Transforming-and-Analyzing-Data-with-SQL
Some notes: 
* A pdf of the my presentation is contained in the repository
* The .sql file in the repository includes most of the SQL queries used in this project, however, due to issues with pgAdmin crashing, some of the queries were lost. All *key* queries used in the project are included in the additional .md files in this repository. 
<br><br>
## Project/Goals
Initial data review uncovered the following: 
* The data required to answer questions in starting_with_questions was in the table named all_sessions
* In all_sessions, only 81 rows had ‘totaltransactionrevenue’ not null, so I focused on these as the sales

* Determined that other tables did not contain data which would help me look at sales by city, country, etc (though would be useful for future analyses!)


After reviewing the data, I determined that I would define the scope of this project as: <br>
<br><b><div align="center">Investigate behaviour and demographics (e.g. location) of site visitors who had viewed and purchased products</b></div>

## Process
### 1. Upload tables as csv
* Imported via SQL copy function
### 2. Performed high level investigation of data to understand what data could be used in further analyses
### 3. I returned distinct count for all columns and stored this data in excel – this was very helpful for understanding the data
<div align="center"><b>Distinct Count by Column (Screenshot)</b></div>
<img src="images/metadata_screenshot.png" alt="Distinct Count by Column" />
<br><br>

### 4. Performed data cleaning
* Found over 3 million rows of duplicate data in analytics! But decided that this dataset was not helpful to me
* Updated currency code based on country
* Divided all financial figures by 1,000,000
* Fixed location info for visitors who had made sales (81 rows only)
* Updated product categories
* Some cities missing and indicated ‘not available in demo dataset’; these were not included in city analyses

#### Product Category Cleanup
* Product categories were inconsistent and occasionally incorrect. Product categories were updated (in new column) to the list below 
<div align="center"><div align="center"><b>Categories</b></div>
<img src="images/categories.png" alt="Categories" /></div>
<br>

* Focused on data cleanup for rows where totaltransactionrevenue was not null
* Sometimes the product category was ambigous: e.g., are Waze dress socks in category 'Waze' or 'Apparel'?
<br>
<br><div align="center"><b>Waze Socks - Waze or Apparel?</b><br>
<img src="images/wazesocks.png" alt="Waze socks" /></div>

* A <b>key takeaway</b> from data cleaning was that the product quantities were unusable. Of the 81 sales, only 18 transactions included product quantities and these were not correlated to transaction revenue by their quantities and product prices.

### Performed data analysis
* Queries used for analysis are included in additional attached files in repository (starting_with_questions and starting_with_data). 

#### QA Process
* QA process is detailed in QA file in repository. 

## Results
* All results are contained in the files starting_with_questions and starting_with_data. 

Key results included: 
* 93% of revenue from from customers in the United States
<br>
<div align="center"><b>Revenue by Country</b><br>
<img src="images/pie.png" alt="pie" /></div>

Additional questions for analysis included: 
* Q1 - Find the number of visitors who viewed more than one product type.
* Q2 - Find the number of visitors who purchased more than one product type. 
* Q3 - How much time did visitors spend on the site who DID purchase items vs those who did not? 
* Q4 - How many users spent less than 1 minute seconds on the site? 
* Q5 - For visitors who viewed more than 1 product, did they come back to the site on a different day?

Key findings from additional questions included:

* Most visitors only viewed or purchased one item 
<div align="center"><b>Visitors who Viewed/Purchased One or Many Items</b>

|Interaction Type|One Item Only|More than One Item|
|---|---|---|
|Viewed|13,249|805|
|Purchased|79|1|
</div>

* The time spent on the site is suprisingly long, as per table below.
<div align="center">
<b>Time Spent on Site</b>

|Interaction Type|Average Time Spent on Site|
|---|---|
|Viewed Only|3.7 minutes|
|Purchased|9.4 minutes|
</div>

## Challenges 
* I had ongoing issues with pgAdmin crashing. I suspect that it was when I tried to change a row which had an apostrophe in the data. 
* Messy data was an issue, and cleaning the entire 15,000+ rows of data would have been time-consuming (especially for location data and product category)
* Missing product quantities was a major issue that limited analysis

## Future Goals
### Future investigations:
* Understand product quantities – is this data available elsewhere?
* What is the difference between visits that *did* turn into a sale vs those that *did not*?
* Would require a more thorough cleaning of location and product category data for all rows
* How did the visitors get to the site? (investigate channelgrouping column)
* Were product ratings (in the products table) associated with better selling products?

