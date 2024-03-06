/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

SELECT special_features, count(special_features)
FROM (SELECT unnest(special_features) as special_features
      FROM film) as tbl
GROUP BY special_features
ORDER BY special_features;
