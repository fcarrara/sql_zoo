1.

SELECT name, continent, population FROM world

2.

SELECT name FROM world
WHERE population> 200000000

3.

SELECT name, gdp/population FROM world
WHERE population > 200000000 

4.

SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

5.

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

6.

SELECT name FROM world
WHERE name like '%United%'

7.

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

8.

SELECT name, population, area FROM world
WHERE (area > 3000000 OR population > 250000000)
AND NOT (area > 3000000 AND population > 250000000)

9.

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world
WHERE continent = 'South America'

10.

SELECT name, ROUND(gdp/population,-3) FROM world
WHERE gdp > 1000000000000

11.

SELECT name,
       CASE WHEN continent='Oceania' THEN 'Australasia'
            ELSE continent END
FROM world
WHERE name LIKE 'N%'

12.

SELECT name,
       CASE WHEN continent = 'Europe' THEN 'Eurasia'
            WHEN continent = 'Asia' THEN 'Eurasia'
            WHEN continent = 'North America' THEN 'America'
            WHEN continent = 'South America' THEN 'America'
            WHEN continent = 'Caribbean' THEN 'America'
            ELSE continent END
FROM world
WHERE name like 'A%' OR name like 'B%'

13.

SELECT name, continent,
   CASE WHEN continent = 'Oceania' THEN 'Australasia'
        WHEN continent = 'Eurasia' THEN 'Europe/Asia'
        WHEN name = 'Turkey' THEN 'Europe/Asia'
        WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
        WHEN continent = 'Caribbean' AND name NOT LIKE 'B%' THEN 'South America'
        ELSE continent END
FROM world
ORDER BY name 
