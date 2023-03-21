USE northwind;
/*1. pedidos con el máximo "order_date" para cada empleado:
 saber la fecha de los pedidos más recientes que ha gestionado cada empleado.
 query correlacionada.*/
 
 SELECT *
	FROM orders AS o1
    WHERE o1.order_date = (
			SELECT MAX(order_date)
            FROM orders AS o2
            WHERE o1.employee_id = o2.employee_id);
 
 /*2. precio unitario máximo (unit_price) de cada producto vendido:
  productos vendidos y su precio unitario.
  queries correlacionadas.*/
  
 SELECT DISTINCT(product_id), unit_price AS "Max_unit_price_sold"
	FROM order_details AS od1
    WHERE od1.unit_price = (
		SELECT MAX(unit_price)
		FROM order_details AS od2
		WHERE od1.product_id = od2.product_id);
  
  
/*3. Ciudades que empiezan con "A" o "B":
compañias que están afincadas en ciudades que empiezan por "A" o "B". 
ciudad, el nombre de la compañia y el nombre de contacto.*/

SELECT city, company_name, contact_name
	FROM customers
	WHERE city LIKE 'A%' OR city LIKE 'B%';



/*4. pedidos que han hecho en las ciudades que empiezan con L.
 mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".*/
 
 SELECT city, company_name, contact_name, COUNT(order_id) AS 'NumeroPedidos'
	FROM customers
    NATURAL JOIN orders
	WHERE city LIKE 'L%'
    GROUP BY customer_id;
 

 /*5. clientes cuyo "contact_title" no incluya "Sales".
 Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.*/
 
SELECT contact_name, contact_title, company_name
	FROM customers
	WHERE contact_title NOT LIKE '%Sales%';
 
 
 /*6. clientes que no tengan una "A" en segunda posición en su nombre:
 Devolved unicamente el nombre de contacto.*/
 
SELECT contact_name
	FROM customers
	WHERE contact_name NOT LIKE '_a%';