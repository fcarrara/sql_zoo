1.

SELECT id, title
FROM movie
WHERE yr=1962

2.

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

3.

SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'

4.

SELECT title FROM movie
WHERE id IN (11768, 11955, 21191)

5.

SELECT id FROM actor
WHERE name = 'Glenn Close'

6.

SELECT id FROM movie
WHERE title = 'Casablanca'

7.

SELECT name FROM actor
JOIN casting ON (actorid = id)
WHERE movieid=11768

8.

SELECT name FROM actor
JOIN casting ON (actorid = id)
WHERE movieid IN (SELECT id FROM movie WHERE title = 'Alien')

9.

SELECT title FROM movie
JOIN casting ON (movieid = id)
WHERE actorid IN (SELECT id FROM actor WHERE name = 'Harrison Ford')

10.

SELECT title FROM movie
JOIN casting ON (movieid = id)
WHERE actorid IN (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord > 1

11.

SELECT title, name FROM movie, casting, actor
WHERE movie.id = movieid
AND actor.id = actorid
AND ord = 1
AND yr = 1962

12.

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

13.

SELECT title, name FROM actor, casting, movie
WHERE actor.id = actorid
AND movie.id = movieid
AND ord = 1
AND movieid IN
    (SELECT movieid FROM casting, actor
     WHERE actorid=actor.id
     AND name='Julie Andrews')

14.

SELECT name FROM casting 
JOIN actor ON  (actorid = actor.id)
WHERE ord=1
GROUP BY name
HAVING COUNT(movieid)>=30

15.

SELECT title, COUNT(actorid) FROM movie, casting
WHERE movieid = movie.id
AND yr = 1978
GROUP BY title
ORDER BY 2 DESC

16.

SELECT DISTINCT d.name
FROM actor d JOIN casting a ON (a.actorid=d.id)
   JOIN casting b ON (a.movieid=b.movieid)
   JOIN actor c ON (b.actorid=c.id 
                AND c.name='Art Garfunkel')
WHERE d.id != c.id
