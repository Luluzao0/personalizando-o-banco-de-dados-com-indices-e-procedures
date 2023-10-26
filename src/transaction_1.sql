SET @@autocommit = off; 

START TRANSACTION;
	 SELECT
		@orderNumber:=max(orderNumbers)+1
	FROM
		orders;

	INSERT INTO orders( orderNumbers,
						orderDate,
						requiredDate,
						shippedDate,
						orderStatus	
					)
	VALUES(@orderNumber,
			'2005-05-31',
			'2005-6-10',
			'2005-06-11',
			'EM PROGRESSO'
			);

	SAVEPOINT insercao_em_order;
    
	SELECT
		@orderNumber:=max(orderNumbers)
	FROM
		orders;

	INSERT INTO ordersDetails(orderNumbers,
							 productCode,
							 quantityOrder,
							 price
							 )
	VALUES(@orderNumber,181749, 30, '136'),
		  (@orderNumber,182248, 50, '55.09'); 
      
SAVEPOINT insercao_em_orderdetails;

COMMIT;


rollback;