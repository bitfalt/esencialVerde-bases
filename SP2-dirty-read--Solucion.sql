CREATE PROCEDURE [dbo].[InsertProduct]
	@Productid INT,
	@Name nchar(20),
	@Price decimal(12,2),
	@Expenses decimal(12,2)

AS
BEGIN

	SET NOCOUNT ON -- no retorne metadatos

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	-- operaciones de select que no tengan que ser bloqueadas
	
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1


		-- Al establecer el nivel de aislamiento en REPEATABLE READ, se garantiza la consistencia de los datos
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		-- Esto evita que otras transacciones modifiquen los mismos datos mientras la transacción actual está en curso
		-- Asegurando que los cambios realizados por la transacción sean persistentes y no se pierdan debido a una operación de escritura concurrente.


		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001

		-- Ese SP lo que hace es insertar un producto
		INSERT INTO Products (productid, name, price, expenses)
		VALUES (@Productid, @Name, @Price, @Expenses);


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