-- Multiple Join Lab, Matthew Barger
-- 1
select store_id, city, country from sakila.store a
join sakila.address b
on a.address_id = b.address_id
join sakila.city c
on b.city_id = c.city_id
join sakila.country d 
on c.country_id = d.country_id;

-- 2
 Select b.store_id, round(sum(amount), 2)
 from sakila.store a
 join sakila.staff b 
 on a.store_id = b.store_id
 join sakila.payment c
 on b.staff_id = c.staff_id
 group by b.store_id;
 
 -- 3 
Select a.name, avg(length) from sakila.category a
 join sakila.film_category b 
 on a.category_id = b.category_id
 join sakila.film c
 on b.film_id = c.film_id
 group by a.name
 order by avg(length) desc;
 
 -- 4 (assuming 'longest' means "highest average length" as opposed to "longest list of films in category")
 Select a.name, round(avg(length),2) as avg_runtime from sakila.category a
 join sakila.film_category b 
 on a.category_id = b.category_id
 join sakila.film c
 on b.film_id = c.film_id
 group by a.name
 order by avg(length) desc
 limit 3;
 
 -- 5 
SELECT c.title, count(a.inventory_id) as rental_frequency FROM sakila.rental a
join sakila.inventory b on a.inventory_id = b.inventory_id
join sakila.film c on b.film_id = c.film_id
group by c.title
order by rental_frequency desc;
 
 -- 6
 Select a.name, round(sum(amount),2) as top_grossing from sakila.category a
 join sakila.film_category b 
 on a.category_id = b.category_id
 join sakila.inventory c
 on b.film_id = c.film_id
 join sakila.rental d on c.inventory_id = d.inventory_id
 join sakila.payment e 
 on e.rental_id = d.rental_id
 group by a.name
 order by top_grossing desc
 limit 5;
 
 -- 7
Select a.title, c.store_id from sakila.film a
 join sakila.inventory b on a.film_id = b.film_id
 join sakila.store c on b.store_id = c.store_id
 where a.title = 'Academy Dinosaur' and c.store_id = 1;
 
 
 