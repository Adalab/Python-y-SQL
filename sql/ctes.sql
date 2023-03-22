USE northwind;

/*1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
id del cliente y el nombre de la compañia de la tabla Customers.*/

WITH info_clientes AS (

						SELECT customer_id, company_name
                        FROM customers)
                        
	SELECT * FROM info_clientes;


/*2. Selecciona solo los de que vengan de "Germany"*/

WITH info_clientes AS (

						SELECT customer_id, company_name
                        FROM customers
                        WHERE country = "Germany")
                        
	SELECT * 
    FROM info_clientes;



/*3. Extraed el id de las facturas y su fecha de cada cliente.
todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).*/

WITH info_clientes AS (

						SELECT customer_id, company_name
                        FROM customers)
                        
	SELECT customer_id, company_name, order_id, order_date
    FROM info_clientes
    NATURAL JOIN orders
    ORDER BY customer_id;


/*4. Contad el número de facturas por cliente.
el número de facturas emitidas por cada cliente.*/

WITH info_clientes AS (

						SELECT customer_id, company_name
                        FROM customers)
                        
	SELECT customer_id, company_name, COUNT(order_id) AS "NumeroFacturas"
    FROM info_clientes
    NATURAL JOIN orders
    GROUP BY customer_id
    ORDER BY customer_id;


/*5. Cantidad media pedida de todos los productos ProductID.
extraer la suma de las cantidades por cada producto y calcular la media.*/

WITH info_productos AS (

						SELECT product_id, product_name, quantity
                        FROM products
                        INNER JOIN order_details
                        ON products.product_id = order_details.product_id
                        GROUP BY product_id, quantity)
                        
	SELECT product_name AS "Producto", AVG(quantity) AS "Media"
    FROM info_productos
    GROUP BY product_name
    ORDER BY Producto;
