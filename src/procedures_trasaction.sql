DROP PROCEDURE sql_fail;

DELIMITER //
CREATE procedure sql_fail()
BEGIN
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
		ROLLBACK;
        select 'Erro durante a transação' AS Resultado;
	END;
    START TRANSACTION;
    INSERT INTO orders VALUES(9,'2023-07-05', '2023-07-04', '2023-07-03', 'EM ANDAMENTO');     
	INSERT INTO ordersDetails VALUES(9, '23_1234', 30, '123', 1),
									(9, '23_4321', 50, '88.02', 2);
END//

call sql_fail();

select * from orders;