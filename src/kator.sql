SELECT w.id, wp.age, w.coins_needed, w.power FROM Wands as w
JOIN Wands_Property as wp
on w.code = wp.code
where w.coins_needed = (select min(coins_needed)
                       from Wands as w2 inner join Wands_Property as wp2 
                       on w2.code = wp2.code 
                       where wp2.is_evil = 0 and wp.age = wp2.age and w.power = w2.power)
order by w.power desc, wp.age desc;


SELECT c.hacker_id, h.name, count(c.challenge_id) 
FROM Hackers AS h JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
HAVING count(c.challenge_id) = (SELECT TOP 1 count(c1.challenge_id) FROM Challenges AS c1 GROUP BY c1.hacker_id 
              ORDER BY count(*) desc) or
count(c.challenge_id) NOT IN (SELECT count(c2.challenge_id) FROM Challenges AS c2 GROUP BY c2.hacker_id 
            HAVING c2.hacker_id <> c.hacker_id)
ORDER BY count(c.challenge_id) DESC, c.hacker_id;