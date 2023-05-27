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
	DECLARE @total DECIMAL(18,2);
	-- operaciones de select que no tengan que ser bloqueadas
	SELECT @total = SUM(amount)
	FROM BalanceHistory
	INNER JOIN EntityBalances ON BalanceHistory.entitybalanceid = EntityBalances.entitybalanceid
	WHERE entityid = @entityid AND BalanceHistory.date >= @date;
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001

		-- El phantom read puede ocurrir cuando se le agrega un nuevo movimiento a una entidad en especifico
		-- Al calcular el total antes de la transaccion y utilizar ese valor para luego calcular el promedio
		-- Si se agrega un nuevo movimiento despues de haber calculado el total, la cantidad de columnas que
		-- cumplen con la condicion va a ser diferente, por lo tanto, el promedio estaria malo por un phantom
		-- read, ya que, se agrego una nueva columna mientras se hacia la transaccion

		-- put your code here

		WAITFOR DELAY '00:00:05'

		SELECT @total, COUNT(BalanceHistory.balancehistoryid) AS totalMovements,
		(@total / COUNT(BalanceHistory.balancehistoryid) * 1.0) AS Average
		FROM BalanceHistory
		INNER JOIN EntityBalances ON BalanceHistory.entitybalanceid = EntityBalances.entitybalanceid
		WHERE entityid = @entityid AND BalanceHistory.date >= @date;


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