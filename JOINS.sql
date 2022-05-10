/*JOINS*/

select * from cars;

select * from car_types;

-- Display the car_id, price, car_make, car_model, and car_year for each car: restrict your query to display only cars made by bmw on 2019. Display the average price for each car model during this year
select  AVG(c.price) AS avg_price, ct.car_make, ct.car_model
from cars c JOIN car_types ct
ON c.car_type_id = ct.car_type_id
where ct.car_make = 'bmw' AND ct.car_year = 2019
GROUP BY ct.car_make, ct.car_model;

--  Display the car_id, price and fuel_type_name for each car
select * from fuel_types;

select c.car_id, c.price, f.fuel_type_name
from cars c JOIN fuel_types f
	ON c.fuel_type_id = f.fuel_type_id;
    
/*Inner Join*/
-- Display the number of cars by each fuel_type_name. 
Select COUNT(*) AS num_cars, f.fuel_type_name
from cars c INNER JOIN fuel_types f
		ON c.fuel_type_id = f.fuel_type_id
        GROUP BY f.fuel_type_name
        ORDER by COUNT(*) DESC;
        
select * from transmission_types;

-- Display the car_id, price and transmission_name for each car and the average price for each transmission_name. Sort the output by the average price
select t.transmission_name, avg(c.price) AS avg_price
from cars c INNER JOIN transmission_types t
	ON c.transmission_type_id = t.transmission_type_id
GROUP by t.transmission_name
ORDER BY avg(c.price) DESC;

-- Display the unique number of hybrid cars for each car_make.
select COUNT(DISTINCT ct.car_model), ct.car_make
from cars c JOIN car_types ct ON c.car_type_id = ct.car_type_id
JOIN fuel_types f ON f.fuel_type_id = c.fuel_type_id
where f.fuel_type_name = 'Hybrid'
GROUP BY ct.car_make
ORDER BY COUNT(DISTINCT ct.car_model) DESC;

-- Display the number of manual-gearbox cars, by each car_year and car_make
select  ct.car_year, ct.car_make, COUNT(*) AS num_cars
from cars c JOIN car_types ct ON c.car_type_id = ct.car_type_id
JOIN transmission_types t on c.transmission_type_id = t.transmission_type_id
GROUP BY ct.car_year, ct.car_make
ORDER BY ct.car_year;
	
 select * from customers;
 select * from genders;
 
 -- Display the customer_id, first_name, last_name, birth_date, and gender, the number of customers by each gender and the number of customers by each gender and age for customers above the age 59
 select g.gender, timestampdiff(YEAR, c.birth_date, curdate()) AS age, COUNT(*) AS number_of_customers
 from customers c JOIN genders g 
	ON c.gender_code = g.gender_code
    WHERE timestampdiff(YEAR, c.birth_date, curdate()) >59
    GROUP BY g.gender, timestampdiff(YEAR, c.birth_date, curdate())
    ORDER BY COUNT(*) DESC;
    
    select * from locations;
    
-- Display the number of customers with updated phone_number living in Australia (customers who has value in phone_number)
	select COUNT(*)
    from customers c JOIN locations l ON c.location_code = l.location_code
    where l.country = 'Australia' AND c.phone_number IS NOT NULL;
    
-- Display the number of australian customers with NULL value in their phone_number, break down the result for each city, sort it by the count
    select COUNT(*)
    from customers c JOIN locations l ON c.location_code = l.location_code
    where l.country = 'Australia' AND c.phone_number IS NULL
    group by L.city
    order by no_of_customers DESC;
    
    select * from sales;
    
-- Display the customer_id and full name of customers who bought more than 5 cars    
select c.customer_id, concat(c.first_name, ' ', c.last_name) AS customer_name, COUNT(*) AS number_cars
from customers c JOIN sales s
	ON c.customer_id = s.customer_id
GROUP BY c.customer_id, concat(c.first_name, ' ', c.last_name)
HAVING COUNT(*) > 5;

select * from cars;

-- Display the percent of sold cars
select COUNT(s.purchase_date)/COUNT(*)*100 AS percent_sold
from cars c LEFT JOIN sales s 
	ON c.car_id = s.car_id;

select COUNT(s.customer_id)/COUNT(*) * 100 AS percent_of_sold_cars
from sales s RIGHT OUTER JOIN cars c ON s.car_id = c.car_id;
    select * from car_types;
    
  -- Average price of sold cars made by Audi  
    select avg(price) AS average_price
    FROM cars c JOIN sales s ON c.car_id = s.car_id
    JOIN car_types ct ON c.car_type_id = ct.car_type_id
    where ct.car_make = 'Audi' AND YEAR(s.purchase_date) = 2019
    
    
    
    
    
    
    
    
    
 
 
 
 
 
 
 
 