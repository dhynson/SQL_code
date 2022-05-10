SELECT *
FROM CovidDeaths;

SELECT *
FROM Covidvaccines;

-- Select Data that will be used
SELECT location,date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths;

-- total cases vs. total Deaths in USA
SELECT location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 AS deaths_percentage
FROM CovidDeaths
WHERE location LIKE '%States%';

-- total cases vs. Population 
SELECT location, date, total_cases, population, (total_cases/population) * 100 AS cases_by_population 
FROM CovidDeaths;

-- Countries with highest infection rates compared to population
SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS highestcases_by_population
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY MAX((total_cases/population))*100 DESC; 

-- Countries with highest death count per population
SELECT location, population, MAX(total_deaths) AS highest_death_count, MAX((total_deaths/population))*100 AS highestdeaths_by_population
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY 4 DESC ;

-- Total death by continent
SELECT continent, MAX(total_deaths) AS total_death_count
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 2 DESC;

-- Global Numbers
SELECT date, SUM(new_cases) AS number_of_cases ,SUM(new_deaths) AS number_of_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS deaths_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY date
ORDER BY 4 DESC;

-- Total death and death percentage in the world 
SELECT SUM(new_cases) AS number_of_cases ,SUM(new_deaths) AS number_of_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS deaths_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL;

-- Join the Death table and Vaccines
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, 
SUM(cvnew_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS counting_people_vaccinated
FROM CovidDeaths cd
JOIN Covidvaccine cv
	ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
ORDER BY 2,3;