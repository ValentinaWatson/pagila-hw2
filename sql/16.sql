/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

SELECT RANK () OVER (ORDER BY COALESCE(SUM(p.amount), 0.00) DESC) AS "rank", film.title, COALESCE(SUM(p.amount), 0.00) as revenue
FROM film
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEft JOIN payment p USING (rental_id)
GROUP BY film.title
ORDER BY revenue DESC;
