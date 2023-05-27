CREATE PROCEDURE [dbo].[ChangeContainerAmount]
	@Amount INT,
	@Container nchar(20)
AS
BEGIN

	SET NOCOUNT ON -- no retorne metadatos

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @Containerid INT
	DECLARE @LocationBefore geography;
	DECLARE @LocationAfter geography;

	SET @LocationBefore = geography::Point(RAND() * 180 - 90, RAND() * 360 - 90, 4326);
	SET @LocationAfter = geography::Point(RAND() * 180 - 90, RAND() * 360 - 90, 4326);

	-- operaciones de select que no tengan que ser bloqueadas

	SELECT @Containerid = containerid 
	FROM Containers 
	WHERE name = @Container;
	
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001

		-- En este caso, un ejemplo de cuando se genera el lost update es cuando ocurren dos transacciones al mismo tiempo sobre el mismo contenedor
		-- El resultado será que una de las transacciones tendrá éxito y se insertará en la tabla "ContainerHistory"
		-- Mientras que la otra transacción se encontrará con un error y realizará un rollback.

		WAITFOR DELAY '00:00:05';

		INSERT INTO ContainerHistory (containerid, date, movementType, quantity, locationBefore, locationAfter)
		VALUES (@Containerid, GetDate(), 7, @Amount, @LocationBefore, @LocationAfter);


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