SELECT w.id, wp.age, w.coins_needed, w.power FROM Wands as w
JOIN Wands_Property as wp
on w.code = wp.code
where w.coins_needed = (select min(coins_needed)
                       from Wands as w2 inner join Wands_Property as wp2 
                       on w2.code = wp2.code 
                       where wp2.is_evil = 0 and wp.age = wp2.age and w.power = w2.power)
order by w.power desc, wp.age desc;