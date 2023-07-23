//Extraer agentes cuyo nombre empieza por M o termina en O.
SELECT * FROM agents WHERE name ILIKE 'm%' OR name ILIKE '%o';

//Escribir una consulta que produzca una lista en orden alfabético, de toda las distintas ocupaciones en la tabla Customers que contengan la palabra engineer
SELECT DISTINCT "Occupation" from customers WHERE occupation iLIKE '%engineer%' order by occupation asc;

//Escribir una consulta que devuelva el ID del cliente, su nombre y una columna nueva llamada 'mayor30' que contenga 'sí'si el cxliente tiene más de 30 años y 'no' en caso contrario
SELECT customerid, name, age,
	CASE WHEN age > 30 THEN 'si' 
	ELSE 'no' END as mayor30  
	FROM customers;

//Escribir una consulta que devuelva todas las llamadas realizadas a clientes de la profesión de ingeniería y muestre si son mayores o menores de 30, así como si terminaron comprando el producto de esa llamada
SELECT callid, agentid, pickedup,duration,productsold, cs.customerid, ct.occupation, ct.age,
	CASE WHEN age > 30 THEN 'si' 
	    ELSE 'no' END as mayor30  
	FROM calls as cs
	JOIN customers as ct ON cs.customerid = ct.customerid 
	WHERE ct.occupation iLIKE '%engineer%';

// Calcular las ventas totales y las llamadas totales realizadas a los clientes de la profesión de ingeniería
SELECT SUM(cs.productsold) as total_sells, COUNT(cs.callid) as total_calls
	from calls as cs
	JOIN customers as ct ON ct.customerid = cs.customerid
	WHERE ct.occupation ILIKE '%engineer%' 

// Calcular las mismas métrticas que la anterior para toda la base de clientes
SELECT SUM(cs.productsold) as total_sells, COUNT(cs.callid) as total_calls
	from calls as cs

// Para cada agente: el nombre del agente, la cantidad de llamadas, las llamadas más largas y más cortas, la duración promedio de las llamadas y la cantidad total de productos vendidos
SELECT agt.name as "AgentName", 
	count(agt.agentid) as "NCalls", 
	min(duration) as "Shortest" , 
	max(duration) as "Longest" , 
	round(avg(duration),3) as "AvgDuration",
	sum(cs.productsold) as "TotalSales"
	from agents as agt 
	    JOIN calls as cs ON cs.agentid = agt.agentid
    WHERE cs.PickedUp = 1
	GROUP BY agt.name
    ORDER BY agt.name

// Para cada agente cuantos segundos en promedio les toma vender un producto cuando tiene exito
SELECT agt.name,
	round(sum(duration)/count(cs.callid),3) as "AvgDuration"
	from agents as agt 
	JOIN calls as cs ON cs.agentid = agt.agentid
    WHERE cs.productsold = 1
	GROUP BY agt.name 
    ORDER BY agt.name


// Para cada agente, cuántos segundos en promedio permanecen en el teléfono antes de darse por vencidos cuando no tienen éxito
SELECT agt.name,
	round(sum(duration)/count(cs.callid),3) as "AvgDuration"
	from agents as agt 
	JOIN calls as cs ON cs.agentid = agt.agentid
    WHERE cs.productsold = 0
	GROUP BY agt.name 
    ORDER BY agt.name
