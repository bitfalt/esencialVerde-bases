CREATE PROCEDURE [dbo].[changeContractTerm]
	@contract INT,
	@term VARCHAR(20),
	@newValue VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON -- no retorne metadatos

	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @termid INT;
	-- operaciones de select que no tengan que ser bloqueadas
	SELECT @termid = termid
	FROM Terms
	WHERE name = @term;
	-- tratar de hacer todo lo posible antes de q inice la transaccion

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION
	END

	BEGIN TRY
		SET @CustomError = 2001
		-- En este Stored Procedure se puede provocar un deadlock si se llama el stored procedure de
		-- terminateContract con el mismo contrato porque por el orden de los UPDATE, se generaria un 
		-- lock en la tabla de ContractTerms y en terminateContract se genera un lock en Contracts
		-- como ambos procedures trabajan sobre las mismas tablas en orden diferente, se espera que una
		-- se libere para que la otra pueda continuar, pero como ambas se bloquean, se genera un deadlock

		-- put your code here
		UPDATE ContractTerms
		SET value = @newValue
		WHERE termid = @termid AND contractid = @contract

		UPDATE Contracts
		SET status = 'Pending'
		WHERE contractid = @contract


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