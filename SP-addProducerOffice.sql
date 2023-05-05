-----------------------------------------------------------
-- Autor: Daniel Garbanzo & Yi Wen Liang
-- Fecha: 4/5/2023
-- Descripcion: Agrega una oficina, con una direccion aleatorio a un producer
-- Producer es el id y officeName el nombre de la oficina
-----------------------------------------------------------
CREATE PROCEDURE esenVerde_addProducerOffice
	@producer INT,
	@officeName VARCHAR(30)
AS
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @Addressid INT;
	SELECT TOP 1 @Addressid = addressid
	FROM dbo.Addresses
	ORDER BY NEWID();
	
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

		INSERT INTO dbo.Offices(name, addressid, producerid)
		VALUES(@OfficeName, @Addressid, @producer);

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

