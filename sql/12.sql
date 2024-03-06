/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM (SELECT title
      FROM (SELECT title, unnest(special_features) AS sf
            FROM film) AS BTS
      WHERE sf='Behind the Scenes') as BTS_title
JOIN (SELECT title
      FROM (SELECT title, unnest(special_features) AS sf
            FROM film) AS T
      WHERE sf='Trailers') as T_title USING (title)
ORDER BY title;
