show columns from  shopping;
-- Customer Behavior
-- Who are my core customers?
select * from shopping;

-- What are the age and gender distributions of customers?
with bracket as 
(select count(*) as customer_count ,
		Gender,
		case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end as age_bracket
 from shopping
 group by Gender, age_bracket)
 
 select Gender, age_bracket,customer_count
 from bracket 
order by Gender, customer_count;

-- Which demographics spend the most on average?
with bracket as 
(select avg(Purchase_Amount) as  avg_spending  ,
		Gender,
		case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end as age_bracket
 from shopping
 group by Gender, age_bracket)
 
 select Gender, age_bracket,avg_spending
 from bracket 
order by avg_spending  desc
limit 1;

-- How frequently do customers shop?
select Frequency_of_Purchases, 
		count(*) as visit_times
from shopping 
group by Frequency_of_Purchases
order by count(*) desc;

-- What's the average frequency of purchase by customer type or age?
select * from shopping;
with frequency as 
(
select count(*) / count(distinct(Frequency_of_Purchases)) as avg_frequency,
		Frequency_of_Purchases,
        case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end as age_bracket
from shopping
group by age_bracket,Frequency_of_Purchases
        
)
select Frequency_of_Purchases,age_bracket,avg_frequency
from frequency
order by avg_frequency;

-- How does subscription status affect purchasing?
select * from shopping ;
Select  Subscription_Status,count(*) as Purchasers_count,sum(Purchase_Amount) as Revenue 
from shopping
group by Subscription_Status
order by Revenue;

-- Do subscribed users purchase more frequently or spend more?


-- Sales & Revenue Insights
-- Which product categories generate the most revenue?
select * 
from shopping;

select Category, sum(Purchase_Amount) as Revenue
from shopping
group by Category
order by Revenue desc 
limit 1;

-- Analyze Category vs Purchase_Amount
select Category, sum(Purchase_Amount) as Revenue
from shopping
group by Category
order by Revenue desc ;

-- Are discounts and promo codes effective?
select *
from shopping;

select Discount_Applied, 
		Promo_Code_Used,
		sum(Purchase_Amount) as Current_Revenue, 
        sum(Previous_Purchases) as Previous_Revenue
from shopping
group by Discount_Applied,Promo_Code_Used
order by Current_Revenue, Previous_Revenue;



-- How much does Discount_Applied or Promo_Code_Used affect total purchases?

with discounts as 
(
select Discount_Applied, 
		Promo_Code_Used,
		sum(Purchase_Amount) as Current_Revenue, 
        sum(Previous_Purchases) as Previous_Revenue
from shopping
group by Discount_Applied,Promo_Code_Used
)
select Discount_Applied, 
		Promo_Code_Used,
       ( Current_Revenue - Previous_Revenue) as Revenue_Difference 
from discounts
order by Revenue_Difference;

-- What are the best-selling items?
select * from shopping;

select Item_Purchased , sum(Purchase_Amount) as Revenue 
from shopping
group by Item_Purchased 
order by Revenue desc
limit 5;

-- Top items from Item_Purchased by quantity and revenue

-- Pricing and Discount Strategy
-- Do discounted products sell more or less?
select * from shopping;
with  discount_effect as 
(
select count(*) as Purchased_Items  ,Discount_Applied ,
		sum(Purchase_Amount) as Current_Revenue,
        sum(Previous_Purchases) as Previous_Revenue
     
from shopping 
group by Discount_Applied 
)
select    Discount_Applied , Purchased_Items, (Current_Revenue - Previous_Revenue) as Revenue_Difference
from discount_effect
order by Revenue_Difference;


-- Compare Discount_Applied with Purchase_Amount
select Discount_Applied , sum(Purchase_Amount) as Revenue
from shopping
group by Discount_Applied
order by Revenue desc;

-- Which seasons drive the most sales?
select * from shopping;

select Season , sum(Purchase_Amount) as Revenue 
from shopping 
group by Season 
order by Revenue desc;

-- Use Season to identify peak sales periods

-- Shipping & Fulfillment
-- Which shipping types are most preferred?
select Shipping_Type, count(*) as Number_of_Purchases
from shopping 
group by Shipping_Type
order by Number_of_Purchases desc ;

-- Breakdown of Shipping_Type vs customer satisfaction

-- Does faster shipping improve customer satisfaction (Review Rating)?
select Shipping_Type,round(avg(Review_Rating),2) as Avg_Rating
from shopping
group by Shipping_Type
order by Avg_Rating desc;

-- Correlation between Shipping_Type and Review_Rating

-- Payment & Promotion
-- What payment methods are most used?
select * from shopping;

select Payment_Method , count(*) as Number_of_Purchases 
from shopping 
group by Payment_Method
order by Number_of_Purchases desc
;

-- Breakdown of Payment_Method usage

-- Which customer groups use promo codes most?
with demographics as 
(select Promo_Code_Used,
		count(*) as customer_count ,
		Gender,
		case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end as age_bracket
 from shopping
 group by Promo_Code_Used, Gender, age_bracket

)
select Promo_Code_Used, Gender , age_bracket,customer_count
from demographics 
where Promo_Code_Used = 'yes'
order by customer_count desc
limit 1;


-- Cross Promo_Code_Used with Age, Gender, or Subscription_Status
with demographics as 
(select Subscription_Status,
		Promo_Code_Used,
		count(*) as customer_count ,
		Gender,
		case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end as age_bracket
 from shopping
 group by Subscription_Status,Promo_Code_Used, Gender, age_bracket

)
select Promo_Code_Used, Gender , age_bracket,customer_count
from demographics 
order by customer_count desc
;
-- Location Insights
-- Which locations bring the most revenue?
select * from shopping;

select Location, sum(Purchase_Amount) as Revenue
from shopping
group by Location
order by Revenue desc
limit 5 ;

-- Total sales by Location

select Location, count(*) as count_of_sales
from shopping
group by Location
order by count_of_sales desc
 ;


-- Do purchasing trends vary by region?




-- Compare product preferences or payment methods across Location

select Location , Payment_Method, count(*) as count_of_sales
from shopping 
group by Location , Payment_Method
order by count_of_sales;

-- Customer Experience
-- What influences review ratings?

-- Analyze Review_Rating vs product category, shipping type, discount, or season

select * from shopping ;

select round(avg(Review_Rating),2) as Avg_Rating,
		Category , 
		Shipping_Type,
        Discount_Applied,
        Season
from shopping
group by Category , 
		Shipping_Type,
        Discount_Applied,
        Season
order by Avg_Rating;

alter table shopping
add column Age_Bracket varchar(50) ;

update shopping 
set Age_Bracket = case when age between 1 and 20 then 'Young'
			 when age between 21 and 40 then 'Middle_Aged'
             else 'Old'
		 end;
         
 select * from shopping;