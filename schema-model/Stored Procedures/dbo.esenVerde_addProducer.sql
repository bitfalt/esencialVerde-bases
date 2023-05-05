SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[esenVerde_addProducer]
	@producer TProducerData READONLY,
	@address TAddressData READONLY,
	@officeName VARCHAR(30)
AS
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @lastAddressid INT;
	DECLARE @lastProducerid INT;
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

		INSERT INTO dbo.Producers(name)
		SELECT name FROM @producer;
		SET @lastProducerid = SCOPE_IDENTITY();

		INSERT INTO dbo.Addresses(countryid, stateid, city, street, postalCode)
		SELECT countryid, stateid, city, street, postalCode FROM @address;
		SET @lastAddressid = SCOPE_IDENTITY();

		INSERT INTO dbo.Offices(name, addressid, producerid)
		VALUES(@OfficeName, @lastAddressid, @lastProducerid);

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
