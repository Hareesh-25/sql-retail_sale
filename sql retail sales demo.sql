--create database
create database sql_project_p1;
--create tables
drop table if exists retail_sales;
create table retail_sales (transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(15),
age int,
category varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);
select * from retail_sales;
--data cleaning
select * from retail_sales where total_sale is null;
delete from retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or cogs is null
or
total_sale is null;


--data exploration
-- how many sales we have
select count(*) as total_sale from retail_sales;
--how mant unique customers we have
select count(distinct customer_id) as total_sale from retail_sales;


--data analysis and business key problems & answers

--Q1 write a sql query to retrive all columns for sales made on '2022-11-05'
select * from
retail_sales where sale_date='2022-11-05';

--Q2 write a sql query to retrive all transactions where the category is 'clothing' and the quantity sold is more than 10 in in the month of nov-2022
select * from retail_sales
where category='clothing'
and
(sale_date 'YYYY-MM') = '2022-11'
and
quantiy>=4;

--Q3 write a sql query to calculate the total sales (total_sale) for each category
select 
category,sum(total_sale) as net_sale
from retail_sales
group by 1
--Q4write a sql query to find the average age of customers who purchased items from the 'beauty' category
select 
avg(age ) as avg_age
from retail_sales
where category ='beauty'

--Q5 write a sql query to find all transactions where the total_sale is greater than 1000.
select *
from retail_sales 
where total_sale > 1000

--Q6 write a sql query to find the total number of transactions (transaction_id) made by each gender in each category.
select category,gender,count(*) as total_trans 
from retail_sales
group by
category,gender;




