-- 1) ORDER DETAILS FILE IMPORT

DROP TABLE IF EXISTS ORDER_DETAILS;

CREATE TABLE IF NOT EXISTS ORDER_DETAILS
(
 	order_details_id   int primary key,
    order_id	       int ,
    pizza_id	       varchar(20),
    quantity	       int

);

SELECT * FROM ORDER_DETAILS;




--2) ORDERS FILE IMPORT 
DROP TABLE IF EXISTS ORDERS ;

CREATE TABLE IF NOT EXISTS ORDERS
(
	order_id	INT PRIMARY KEY,
    date	    DATE ,
    time	    TIME
	
);
SELECT * FROM ORDERS;


--3) IMPORT PIZZA TYPE FILE

DROP TABLE IF EXISTS PIZZA_TYPES;
CREATE TABLE IF NOT EXISTS PIZZA_TYPES
(
      pizza_type_id	 VARCHAR(20) PRIMARY KEY,
      name	         VARCHAR(50),
      category	     VARCHAR(7),
     ingredients	 VARCHAR(100)
);

SELECT * FROM PIZZA_TYPES;



--4) IMPORT PIZZAS FILE
DROP TABLE IF EXISTS PIZZAS;
CREATE TABLE IF NOT EXISTS PIZZAS(
	pizza_id	varchar(20),
	pizza_type_id	varchar(20),
	size	varchar(20),
	price	FLOAT
);

SELECT * FROM PIZZAS;
