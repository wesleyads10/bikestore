- Listar todos Clientes que não tenham realizado uma compra;
SELECT * FROM customers cust
LEFT JOIN orders ord ON cust.customer_id = ord.customer_id
WHERE ord.customer_id is null;

- Listar os Produtos que não tenham sido comprados
SELECT * FROM products prod 
LEFT JOIN order_items oit ON prod.product_id = oit.product_id
WHERE oit.product_id is null;

- Listar os Produtos sem Estoque;
SELECT * FROM products prod 
LEFT JOIN stocks sto ON prod.product_id = sto.product_id
WHERE sto.quantity <= 0;

- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
SELECT br.brand_name, st.store_name, count(*) as Total FROM orders ord 
INNER JOIN order_items oit ON ord.order_id = oit.order_id
INNER JOIN products prod ON oit.product_id = prod.product_id
INNER JOIN brands br ON prod.brand_id = br.brand_id
INNER JOIN stores st ON ord.store_id = st.store_id
GROUP BY br.brand_name, st.store_name;

- Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT * FROM staffs sta 
LEFT JOIN orders ord ON sta.staff_id = ord.staff_id 
WHERE ord.staff_id is null;