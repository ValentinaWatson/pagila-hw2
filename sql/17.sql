/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */

SELECT "rank", title, revenue, SUM(revenue) OVER (ORDER BY revenue DESC) AS "total revenue"
FROM (
    SELECT RANK () OVER (ORDER BY COALESCE(SUM(p.amount), 0.00) DESC) AS "rank",
    film.title,
    COALESCE(SUM(p.amount), 0.00) as revenue
    FROM film
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEft JOIN payment p USING (rental_id)
GROUP BY film.title) AS ranked_films
ORDER BY revenue DESC, title ASC;
