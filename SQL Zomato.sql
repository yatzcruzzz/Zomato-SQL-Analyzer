create database foodapp;

use foodapp;

desc zomato;

alter table zomato
add primary key (restaurant_id);

select * from zomato;
select * from zomato limit 10;  -- view first 10 records of the table
select count(*) from zomato; -- how many total rows are there in zomato table

-- What are the min, max, avg ratings for the restaurant
select
round(min(rating),2) as min_rating,
round(max(rating),2) as max_rating,
round(avg(rating),2) as avg_rating
from zomato;

 -- What are the min, max, avg of the number of ratings for the restaurants
select
round(min(num_of_ratings),2) as min_num_of_ratings,
round(max(num_of_ratings),2) as max_num_of_ratings,
round(avg(num_of_ratings),2) as avg_num_of_ratings
from zomato;

-- What are the min, max, avg of the avg cost for two people at the restaurants
select
round(min(avg_cost),2) as min_avg_cost,
round(max(avg_cost),2) as max_avg_cost,
round(avg(avg_cost),2) as avg_avg_cost
from zomato;

-- What is the distribution of ratings for the restauarants
select rating, count(*) as frequency
from zomato
group by rating
order by rating desc;

-- What are the top 10 most frequent ratings for the restaurants
select rating, count(*) as frequency
from zomato
group by rating
order by frequency desc
limit 10;

-- Show the restaurant name and ratings where rating is greater than 4.5
select restaurant_name, rating from zomato where rating > 4.5;

-- What is the distribution of the average cost for two people at the restaurants
select avg_cost, count(*) as frequency
from zomato
group by avg_cost
order by avg_cost desc;

-- Show the top 10 restaurant names and ratings where rating is greater than 4.5
select restaurant_name, rating from zomato
where rating > 4.5 order by rating desc limit 10;

-- Show all restaurant details which provide online order facility
select * from zomato
where Online_order = 'Yes';

-- What are the avg rating avg cost for restaurants that offer online orders compared to those that don't
select online_order, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost
from zomato
group by online_order;


-- What are the avg rating and avg cost for restaurants that offer table booking compared to those that don't
select table_booking,round(avg(rating),2) as avg_rate, 
round(avg(avg_cost),2) as avg_cost
from zomato
group by table_booking;

-- What are the avg rating and avg cost for the top 10 most common cuisines types
select cuisines_type, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost
from zomato
group by cuisines_type
order by count(*) desc
limit 10;

-- Show the top ratings according to the restaurant type
select restaurant_type, round(avg(rating),2) as Avg_Rating
from zomato
group by restaurant_type
order by Avg_Rating desc;

-- Show the top ratings according to area 
select area, round(avg(rating),2) as Avg_Rating
from zomato
group by area
order by Avg_Rating desc;

-- What are the avg rating,avg cost and the number of restaurants in the 10 areas with the most restaurants
select area, round(avg(rating),2) as avg_rate,
round(avg(avg_cost),2) as avg_cost,
count(*) as num_restaurants
from zomato
group by area
order by num_restaurants desc
limit 10;

-- What are the top 10 highest-rated restaurants, considering both rating and number of ratings
select restaurant_name, rating, num_of_ratings, avg_cost,
area from zomato
order by rating desc, num_of_ratings desc limit 10;

-- What are the top 10 most expensive restaurants based on the abg cost for two people
select restaurant_name, avg_cost, rating, num_of_ratings, area,
area from zomato
order by avg_cost desc
limit 10;

-- What are the top 10 restauarants with the highest number of rating?
select restaurant_name, num_of_ratings, rating, avg_cost, area,
area from zomato
order by num_of_ratings desc
limit 10;

-- List restaurants where the avg cost for two people is higher than the overall avg cost, but the rating is below the overall avg rating
select restaurant_name, avg_cost, rating
from zomato
where avg_cost > (select avg(avg_cost) from zomato)
and rating < (select avg(rating) from zomato);  -- Nested query (Query inside a query)

-- Find the top 5 areas with the highest number of restaurants that have online ordering available
select area, count(*) as num_of_restaurants
from zomato
where online_order = 'Yes'
group by area
order by num_of_restaurants desc
limit 5;

-- Identify the avg rating of restaurants in each area that offer a specific cuisine type, eg., 'Chinese'
select area, round(avg(rating),2) as avg_rating
from zomato
where cuisines_type like '%Chinese%'
group by area
order by avg_rating desc;

