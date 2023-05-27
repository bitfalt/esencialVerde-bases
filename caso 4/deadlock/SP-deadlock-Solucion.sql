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
        -- una posible solucion para evitar el deadlock es mantener constante el orden de trabajo de las
        -- tablas, en este caso se cambio para que ambos stored procedures trabajen en el mismo orden
        -- de esta manera se evita un posible deadlock

		-- put your code here
        UPDATE Contracts
		SET status = 'Pending'
		WHERE contractid = @contract

		UPDATE ContractTerms
		SET value = @newValue
		WHERE termid = @termid AND contractid = @contract


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