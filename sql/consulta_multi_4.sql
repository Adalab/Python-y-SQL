/*1. productos "Beverages":
productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/

SELECT product_id AS "ProductId", product_name AS "ProductName", category_id AS "CategoryId"
	FROM products
    WHERE category_id IN (
		SELECT category_id
        FROM categories
        WHERE category_name = "Beverages");
        



/*2.  países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país:*/

SELECT DISTINCT(country)
	FROM customers
    WHERE country NOT IN (
    SELECT DISTINCT(country)
    FROM suppliers);


/*3. clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread":
 OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.*/
 
 SELECT order_id AS "OrderId", customer_id AS "CustomerId"
 FROM orders
 WHERE order_id IN (SELECT order_id
	FROM order_details
    WHERE product_id IN (
		SELECT product_id
		FROM products
		WHERE product_name = "Grandma's Boysenberry Spread")
		AND quantity > 20);
 
 /*4. los 10 productos más caros:
 más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.*/

SELECT product_name AS "Ten_Most_Expensive_Products", unit_price AS "UnitPrice"
	FROM products
    ORDER BY unit_price DESC 
    LIMIT 10;
