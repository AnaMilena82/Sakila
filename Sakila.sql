USE sakila
-- Consultas
-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de ciudad_id = 312? 
-- tu consulta debe devolver el nombre, apellido, correo electrónico y dirección del

SELECT cu.first_name, cu.last_name, cu.email, ad.address, ad.city_id, ci.city, co.country FROM customer  cu
JOIN address ad ON ad.address_id=cu.address_id 
JOIN city ci ON ci.city_id=ad.city_id 
JOIN country co ON co.country_id=ci.country_id 
WHERE ad.city_id = 312;

-- 2. ¿Qué consulta ejecutarías para obtener todas las películas de comedias? 
-- Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación, las características especiales y el género (categoría).

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name FROM film f 
JOIN film_category fc ON f.film_id= fc.film_id 
JOIN category c ON c.category_id=fc.category_id 
WHERE c.name="Comedy";

-- 3. ¿Qué consulta ejecutarías para obtener todas las películas por actor_id=5?
-- Tu consulta debe devolver el id del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.
SELECT fa.actor_id, a.first_name, f.title, f.description, f.release_year FROM film_actor fa 
JOIN actor a ON fa.actor_id = a.actor_id 
JOIN film f ON fa.film_id = f.film_id 
WHERE fa.actor_id = 5;


-- 4. ¿Qué consulta ejecutarías para obtener todos los clientes en store_id=1 y dentro de estas ciudades (1, 42, 312 y 459)?
-- Tu consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT cus.store_id, cus.first_name, cus.last_name, cus.email, ad.address, ad.city_id 
FROM customer cus 
JOIN address ad ON cus.address_id=ad.address_id
JOIN city ci ON ad.city_id = ci.city_id
WHERE cus.store_id = 1 and ci.city_id IN (1, 42, 312, 459);


-- 5. ¿Qué consulta ejecutarías para obtener todas las películas con una "calificación = G" y una "característica especial = 
-- detrás de escena", unidas por actor_id = 15?  Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación y la característica especial. Sugerencia: puede usar la función LIKE para obtener la parte “detrás de escena”.

SELECT f.title, f.description, f.release_year, f.rating, f.special_features
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.rating = 'G' AND f.special_features LIKE '%behind the scenes%' AND fa.actor_id = 15;


-- 6. ¿Qué consulta ejecutarías para obtener todos los actores que se unieron al film_id = 369? 
-- Tu consulta debe devolver film_id, título, actor_id y actor_name.

SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id = 369;

-- 7. ¿Qué consulta ejecutarías para obtener todas las películas de drama con una tarifa de arriendo de 2,99? 
-- Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación, las características especiales y el género (categoría).

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS genero
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Drama' AND f.rental_rate = 2.99;


-- 8. ¿Qué consulta ejecutarías para obtener todas las películas de acción que estén unidas por SANDRA KILMER? 
-- Tu consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la clasificación, las características especiales, el género (categoría) y el nombre y apellido del actor.

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name AS genero, CONCAT(a.first_name, ' ', a.last_name) AS actor_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE c.name = 'Action' AND CONCAT(a.first_name, ' ', a.last_name) = 'SANDRA KILMER';
