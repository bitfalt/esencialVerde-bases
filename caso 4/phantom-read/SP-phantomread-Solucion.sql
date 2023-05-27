CREATE PROCEDURE [dbo].[calculateBalanceHistory]
	@entityid INT,
	@date DATE
AS
BEGIN

	SET NOCOUNT ON -- no retorne metadatos

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @totalAmount DECIMAL(18,2);
    DECLARE @totalMovements INT;
    DECLARE @average DECIMAL(18,2);


	-- operaciones de select que no tengan que ser bloqueadas


	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001

        -- Una posible solucion seria calcular el total de columnas mientras se realiza la suma
        -- y almacenarlos en una variable, de esta forma se tendrian siempre los valores correctos al
        -- realizar ambas operaciones evitando el posible phantom read

		-- put your code here
        SELECT @totalAmount = SUM(amount), @totalMovements = COUNT(*)
        FROM BalanceHistory
        INNER JOIN EntityBalances ON BalanceHistory.entitybalanceid = EntityBalances.entitybalanceid
        WHERE entityid = @entityid AND BalanceHistory.date >= @date;

        SET @average = (@totalAmount / @totalMovements * 1.0);

        SELECT @totalAmount, @totalMovements, @average AS Average;


		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()

		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i',
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH
END
RETURN 0
GO