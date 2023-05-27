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
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001

		-- Ese SP lo que hace es insertar un producto
		-- En este caso se puede generar un dirty read se necesita los SP InsertProduct y AverageProductPrice
		-- El dirty read se generaría en el caso donde se llame al InsertProduct y antes de que se haga el commit
		-- Se llame al AverageProductPrice, lo que generaría un dirty read 
		-- Esto ocurre porque la lectura del gasto promedio se realiza antes de que la transacción de inserción del producto se complete y se confirme
		-- Lo que significa que se está leyendo un dato que aún no ha sido confirmado o puede ser revertido.

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