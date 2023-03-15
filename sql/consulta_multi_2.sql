/*1. Qué empresas tenemos en la BBDD Northwind:
consulta que nos devuelva el nombre de todas las empresas cliente, 
los ID de sus pedidos y las fechas.*/

SELECT  orders.order_id, customers.company_name, orders.order_date
	FROM customers 
    NATURAL LEFT JOIN orders;
#obtenemos la bbdd de todas las empresas por orden alfabético, junto a su ID y fecha.
    
    

/*2. Pedidos por cliente de UK:
información acerca del número de pedidos que ha realizado cada cliente del propio Reino Unido.
Nombre de cada compañía cliente junto con el número de pedidos.*/

SELECT customers.company_name AS "NombreCliente", COUNT(orders.order_id) AS "NumeroPedidos"
	FROM customers
    NATURAL LEFT JOIN orders
    WHERE customers.country = "UK" 
    GROUP BY customers.company_name;
#obtenemos nombre compañía cliente y número pedidos en país UK



/*3. Empresas de UK y sus pedidos:
todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) 
junto con los ID de todos los pedidos que han realizado, 
el nombre de contacto de cada empresa y la fecha del pedido.*/

SELECT  orders.order_id, customers.company_name AS "NombreCliente", orders.order_date AS "FechaPedidos"
	FROM customers 
    LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
    WHERE customers.country = "UK";
    



/*4. Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN:
consulta que muestre datos de todas las empleadas y sus supervisoras. 
La ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, 
¿sabes decir quién es el director?*/

SELECT A.city, A.first_name AS "NombreEmpleado", A.last_name AS "ApellidoEmpleado", B.city, B.first_name AS "NombreJefe", B.last_name AS "ApellidoJefe"
	FROM employees AS A, employees AS B
	WHERE B.employee_id = A.reports_to;
#sale la lista de ciudades, nombre de empleado y su apellido, junto a la ciudad del jefe y su nombre/apellido
    





/*5. BONUS: FULL OUTER JOIN 
Pedidos y empresas con pedidos asociados o no:
todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados o no. Muestra el ID del pedido, 
el nombre de la empresa y la fecha del pedido (si existe).*/