1.

SELECT COUNT(*) FROM stops

2.

SELECT id FROM stops
WHERE name = 'Craiglockhart'

3.

SELECT id, name FROM stops, route
WHERE id = stop
AND company = 'LRT'
AND num = 4

4.

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

5.

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

6.

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

7.

SELECT DISTINCT route1.company, route1.num
FROM route route1, route route2
WHERE route1.num=route2.num AND route1.company=route2.company
AND route1.stop=115 AND route2.stop=137

8.

SELECT DISTINCT route1.company, route1.num
FROM route route1, route route2, stops stop1, stops stop2
WHERE route1.num=route2.num AND route1.company=route2.company
AND route1.stop=stop1.id and route2.stop = stop2.id
AND stop1.name='Craiglockhart' AND stop2.name='Tollcross'

9.

SELECT DISTINCT S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Craiglockhart'
AND S1.id=R1.stop
AND R1.company=R2.company AND R1.num=R2.num
AND R2.stop=S2.id

10.

SELECT DISTINCT an, ac, stops.name, dn, dc
FROM (SELECT a.num as an, a.company as ac, b.stop as bstop
      FROM route a JOIN route b 
      JOIN stops s ON a.num=b.num AND s.id=a.stop
      WHERE s.name='Craiglockhart') T1
JOIN (SELECT d.num as dn, d.company as dc, c.stop as cstop
      FROM route c JOIN route d 
      JOIN stops s ON c.num=d.num AND c.company=d.company AND s.id=d.stop
      WHERE s.name='Sighthill') T2
JOIN stops ON bstop=cstop AND bstop=stops.id