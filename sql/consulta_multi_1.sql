/*1. Pedidos por empresa en UK:
cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.*/
SELECT customers.company_name, customer_id, COUNT(orders.order_id)
	FROM customers
    NATURAL JOIN orders
    WHERE country = "UK"
    GROUP BY customer_id, company_name;



/*2. Productos pedidos por empresa en UK por año:
query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/


SELECT company_name AS "NombreEmpresa", YEAR(order_date) AS "Año", SUM(quantity) AS "NumObjetos"
	FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    WHERE country = "UK" 
    GROUP BY company_name, YEAR(order_date);
    
#suma de la cantidad de objetos por año por compañía




/*3. Mejorad la query anterior:
misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. 
Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.*/

SELECT company_name AS "NombreEmpresa", YEAR(order_date) AS "Año", SUM(quantity) AS "NumObjetos", SUM((unit_price * quantity) * (1 - discount)) AS "DineroTotal"
	FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    WHERE country = "UK" 
    GROUP BY company_name, YEAR(order_date);



/*4. BONUS: Pedidos que han realizado cada compañía y su fecha:
consulta que indique el nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.*/

SELECT order_id AS "OrderID", company_name AS "CompanyName", order_date AS "OrderDate"
	FROM customers
    NATURAL JOIN orders;
    

#Síndrome de Marc Jacobs



/*5. BONUS: Tipos de producto vendidos:
lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, 
y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).*/

SELECT category_id, category_name, products.product_name, ((quantity) - (quantity * unit_price) * discount) AS "ProductSales"
	FROM categories
    NATURAL JOIN products
    NATURAL JOIN order_details
    GROUP BY category_id, product_name;
