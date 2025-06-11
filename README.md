# Shopping-Trends-and-Customer-Insights
## EXCEL/My SQL/ Power BI/STATA/
## Executive Summary
* I analysed shopping analysis according to purchases and demographics  and 
found out that more effort should be put to satisfy the young population and female population
as the are recording the lowest generation overall, measures that should have improved sales
such as subscriptions, discounts and promos are not quite effective and are subject to improvement

## Objective
* I.	Find out the demographic composition of the customers by gender and age
* II.	Find out customer feedback by rating of the various services offered and incentives such as discount 
* III.	Find out the peak seasons of customer purchases 
* IV.	Check on what areas to improve and what category of product to increase the sales 
* V.	To check if various measures such as promotion codes , subscription status and discounts tend to improve sales or not 
* VI.	To check  trend in sales over time 

## Data Description
* •	Source : The data was sourced from Kaggle dataset 
* •	Period: The period is unnamed
* •	Variables: Customer Id, Age, Gender, Item Purchased, Category, Purchase Amount,    Location, Color, Season, Review Rating, Subscription Status,  Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchase , Age Bracket 
* •	Limitations : Lack of key data such as date , A lot of Non numeric data hence limited insights 

## Methodology 
* 1.	Imported data into excel and used power query to check for duplicates and nulls and found out there was none .
* 2.	Checked for outliers using box and whisker  in the purchase amounts 


 
* 3.	After data preparation,  I imported the data into MySQL for analysis to drive key insights by  answering the business questions .
* 4.	After Analysis the data was connected to Power Bi using ODBC to draw vizualisations using various charts and graphs and created a dashboard for easier insight .
* 5.	I later did a simple linear regression in Stata to check effect of age ,review rating  and previous purchases on Purchase Amount.
## Tools Used : Microsoft Excel, MySQL, ODBC Connector, Power Bi and Stata.
## Key Findings:
* 1.	Young Females  were the least customers who visited the store and they were on 59 as compared to 1510 who were the highest and were the  Old Male customers.
* 2.	On Average the Young Males spent the least average on purchases which was 58.09 as compared to the highest who were Young Females who spent 61.29.
* 3.	The least Frequent purchase was done monthly by the Young population having average frequency at 20 while the most frequent purchases were done Quarterly by the Old population at 330 as average frequency.
* 4.	As compared to previous purchases , Discount and Promo Code did not make quite an impact on purchases since the revenue collected on where discount was not applied and Promo Code not used was higher by 77,970 as compared to 56,240 where discount and promo code was applied .
* 5.	Discount was not an effective method to boost sales as discounted goods sold were 1677 as compared to 2223 of the non discounted goods .
* 6.	Fall Season was the season with the most sales generating a revenue of 60018 while Summer had the least sales generating 55777 in revenue . 
* 7.	Shipping type did not have significant influence on average rating 
* 8.	The customer demographic that used promo codes more were the old male population 
* 9.	Montana is the region that brough the highest amount of revenue of 5784
* 10.	Payment Method that was used most was Paypal in which 677 transactions took place while the least was Bank Transfer where 612 transactions took place 
* 11.	The age , review rating and previous purchase had a 95% statistical significace effect on the Purchase Amount according to regression analysis where an increase in age by 1 unit reduces purchase amount by 1.5% ,   an increase in review rating by one unit would increase purchase amount by  100% ,  a unit increase in previous purchase increae Purchase Amount  by 1.3% going forward .
## Insights
* 1.	The Young market and Female market was not taken care of in terms of products and services being offered and the store focused on Old customers and Male Customers.
* 2.	The discounting strategy and promo codes need to be improved since they are not effectively boosting sales.
* 3.	 Measure should be taken to increase sales in the Summer  season to boost more sales .
* 4.	Review rating  tend to affect Purchase amount by the highest percentage


## Recommendations 
* 1.	Increasing the sales of items that are  most preferred by the young female population  those in the footwear and outwear categories and discounting those products  and this may improve sales .
* 2.	Improving customer service such as shipping methods and time delivery as this affects review rating which greatly has an impact on Purchase Amount.
* 3.	Stocking items preferred during the summer as this may boost the revenue by attracting more customers.
* 4.	Finding better ways to improve sales instead of using discount and promo codes since they are not quite effective and this may be by discounting frequently purchased goods .
* 5.	Incentivise subscription status buyer in order to increase subscriptions and increase sales by the already subscribed such as free shipping  and more discount hence more items purchased and more sales .
