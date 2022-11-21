-- Question #1
-- Based on the ERD provided, write a SQL query to find the number of occurrences that an ingredient named “Lobster Ravioli” was sold at each store. Rank the stores by dishes sold with the highest occurrence first.

SELECT
  store_name, COUNT(*) as 'the number of Sales'
FROM
  sales sl
  INNER JOIN
  ingredient i
  ON 
  sl.ingredient_id = i.ingredient_id
  INNER JOIN
  store st
  ON 
  sl.store_id = st.store_id
WHERE 
  i.ingredient_name = 'Lobster Ravioli'
GROUP BY 
  sl.ingredient_id
ORDER BY 
  2 DESC



-- Question #2
-- Revise the query from Question #1 to limit the dataset queried between April 1st, 2021 to May 1st, 2021. Return only the stores that have sold more than 45 Lobster Ravioli dishes.

SELECT
  store_name, COUNT(*) as 'the number of Sales'
FROM
  sales sl
  INNER JOIN
  ingredient i
  ON 
  sl.ingredient_id = i.ingredient_id
  INNER JOIN
  store st
  ON 
  sl.store_id = st.store_id
WHERE 
  i.ingredient_name = 'Lobster Ravioli'
  AND sl.business_date BETWEEN '2021-04-01' AND '2021-05-01'
GROUP BY 
  sl.ingredient_id
HAVING 
  COUNT(*) > 45
ORDER BY 
  2 DESC;



-- Question #3
-- Referencing the Sales table, write the corresponding `CREATE` SQL DDL statement. Include and provide justification for any improvements or add-ons as you see fit.

CREATE TABLE Sales
(
  sale_id int NOT NULL,
  ingredient_id int ,
  business_date date NOT NULL,
  sold_price float NOT NULL,
  store_id int,
  PRIMARY KEY (sale_id),
  FOREIGN KEY (store_id) REFERENCES Store(store_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);