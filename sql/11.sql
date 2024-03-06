/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name || ' ' || last_name as "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
WHERE film_id IN (SELECT film_id
                  FROM (SELECT film_id, unnest(special_features) AS sf
                        FROM film) as tbl
                  WHERE sf='Behind the Scenes')
ORDER BY "Actor Name";
