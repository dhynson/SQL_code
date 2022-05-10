CREATE DATABASE maternal_deaths;

use maternal_deaths;

SELECT * 
FROM maternal_death_by_country;

SELECT country
FROM maternal_death_by_country
;

SELECT country, continent, year, number_of_maternal_deaths
FROM maternal_death_by_country;

SELECT country, year, number_of_maternal_deaths
FROM maternal_death_by_country
WHERE YEAR = 2005
ORDER BY number_of_maternal_deaths DESC;

-- Total number of maternal deaths per continent
SELECT continent, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY continent
ORDER BY sum(number_of_maternal_deaths) DESC;

-- Continents with maternal deaths greater than 30,000
SELECT continent, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY continent    
HAVING sum(number_of_maternal_deaths) > 30000
ORDER BY sum(number_of_maternal_deaths) DESC;

-- Top 10 countries with highest maternal death
SELECT country, continent, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY country, continent
ORDER BY sum(number_of_maternal_deaths) DESC
LIMIT 10;

-- Countries in Europe have the hight maternal death?
SELECT country, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
WHERE continent = 'Europe'
GROUP BY country
ORDER BY sum(number_of_maternal_deaths) DESC
LIMIT 15
;

-- Rank continent by maternal deaths in ascending order
SELECT continent, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY continent
ORDER BY sum(number_of_maternal_deaths) 
;

-- 20 countries have the lowest number of maternal deaths
SELECT country, continent, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY country, continent
ORDER BY sum(number_of_maternal_deaths) 
LIMIT 20;

-- Average maternal deaths  per year in each continent
SELECT continent, year, ROUND(AVG(number_of_maternal_deaths)) AS avg_number_of_maternal_deaths
FROM maternal_death_by_country
GROUP BY continent, year
ORDER BY AVG(number_of_maternal_deaths) DESC;

-- Which year had the highest number of maternal deaths
SELECT year, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
GROUP BY year
ORDER BY sum(number_of_maternal_deaths) DESC
LIMIT 1;

-- Top 10 African countries with most maternal deaths
SELECT country, sum(number_of_maternal_deaths)
FROM maternal_death_by_country
WHERE continent = 'Africa'
GROUP BY country
ORDER BY sum(number_of_maternal_deaths) DESC
LIMIT 10;

-- Top 10 Asian countries with most maternal deaths from 2010-2017
SELECT country, SUM(number_of_maternal_deaths)
FROM maternal_death_by_country
WHERE year BETWEEN 2010 AND 2017 AND continent = 'Asia'
GROUP BY country
ORDER BY SUM(number_of_maternal_deaths) DESC
LIMIT 10;