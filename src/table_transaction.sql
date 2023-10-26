CREATE DATABASE transactionExample;

USE transactionExample;

CREATE TABLE orders(
	orderNumbers INT auto_increment,
    orderDate date,
    requiredDate date,
    shippedDate date,
    orderStatus ENUM('DESPACHADO','EM ANDAMENTO','ENTREGUE'),
    customerNumber int,
    CONSTRAINT pk_orders PRIMARY KEY (orderNumbers) 
);

DESC orders;

CREATE TABLE ordersDetails(
	orderNumbers int auto_increment,
    productCode varchar(255),
    quantityOrder int,
    price varchar(255),
	constraint fk_orderdetails foreign key (orderNumbers) references orders(orderNumbers),
    constraint pk_orderdatails primary key (orderNumbers, productCode)
);

DESC ordersDetails;

SELECT * FROM ordersDetails;
SELECT * FROM orders;

select * from orders join ordersDetails using(orderNumbers);