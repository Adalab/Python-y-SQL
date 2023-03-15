SELECT 'Hola!' AS tipo_nombre
	FROM customers;
#columna temporal

/*1. información sobre las compañias que tengamos en la BBDD:
query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD.
ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente).
No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
Deberás crear esta columna temporal en cada instrucción SELECT*/

SELECT city, company_name, contact_name, "customers" AS Relationship
	FROM customers
    UNION  
		SELECT city, company_name, contact_name, "suppliers" AS Relationship
        FROM suppliers;
    

/*2. Extraer todos los pedidos gestinados por "Nancy Davolio"
cuantos pedidos ha gestionado "Nancy Davolio",todos los detalles tramitados por ella*/

SELECT * 
	FROM orders
    WHERE employee_id IN (
		SELECT employee_id
		FROM employees 
		WHERE last_name = "Davolio");


/*3. Extraed todas las empresas que no han comprado en el año 1997
podemos usar el estamento year*/

SELECT company_name AS "CompanyName", country AS "Country"
	FROM customers
    WHERE customer_id NOT IN (
		SELECT customer_id 
        FROM orders
        WHERE YEAR(order_date) = 1997);


/*4. Extraed toda la información de los pedidos donde tengamos "Konbu"
todos los pedidos que contengan "Konbu".
 combinar conocimientos adquiridos en las lecciones anteriores como por ejemplo el INNER JOIN.*/
 
 SELECT *
	FROM orders
    WHERE order_id IN (
		SELECT order_id
        FROM order_details NATURAL JOIN products
        WHERE product_name = "Konbu");
