/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT customer_id
FROM customer
INNER JOIN rental USING (customer_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
WHERE
    film_id in (
        SELECT
          film.film_id
        FROM film 
        INNER JOIN inventory ON inventory.film_id = film.film_id
        INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
        INNER JOIN payment ON payment.rental_id = rental.rental_id
        GROUP BY film.film_id
        ORDER BY sum(payment.amount) DESC
        LIMIT 5
    )
ORDER BY customer_id;