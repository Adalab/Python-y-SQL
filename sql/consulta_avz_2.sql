/* 1. nº pedidos y máxima carga e idempleado en cada caso */

USE northwind;

SELECT COUNT(order_id) AS n_pedidos, MAX(freight) AS max_carga, employee_id
	FROM orders
    GROUP BY employee_id;
    
/* 2. descartar pedidos sin fecha y ordenarlos. */

SELECT  COUNT(order_id) AS n_pedidos, MAX(freight) AS max_carga, employee_id
	FROM orders
    WHERE shipped_date IS NOT NULL
    GROUP BY employee_id
    ORDER BY employee_id;
    
/* 3. número de pedidos por día, con día, mes, año separados*/

SELECT COUNT(order_id), DAY(shipped_date) AS 'Dia', MONTH(shipped_date) AS 'Mes', YEAR(shipped_date) AS 'Año'
	FROM orders
	GROUP BY shipped_date;

/* 4. número de pedidos por mes, año*/

SELECT COUNT(order_id), MONTH(shipped_date) AS 'Mes', YEAR(shipped_date) AS 'Año'
	FROM orders
	GROUP BY Mes, Año;
    
/* 5. nombres de las ciudades con 4 o más empleadas*/

SELECT city, COUNT(employee_id)
	FROM employees
    GROUP BY city
    HAVING COUNT(employee_id) >= 4;
#London

/* 6. pedidos en 2 categorías: "Alto" > 2000, Bajo < 2000*/

    SELECT order_id, 
	CASE
		WHEN SUM((unit_price * quantity) - (unit_price * quantity * discount)) > 2000 THEN "Alto"
		ELSE "Bajo"
        END AS RangoPrecio
        FROM order_details
        GROUP BY order_id;
    
    
    