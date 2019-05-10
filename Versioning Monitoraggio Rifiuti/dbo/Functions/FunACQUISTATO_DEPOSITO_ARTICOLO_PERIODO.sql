
CREATE FUNCTION [dbo].[FunACQUISTATO_DEPOSITO_ARTICOLO_PERIODO](@ARTICOLO nVARCHAR(50),
												              @MAGAZZINO nVARCHAR(10),
												               @DATAINIZIO DATETIME,
													            @DATAFINE DATETIME)
RETURNS NUMERIC(19,6)
AS
BEGIN   

DECLARE @VENDUTO			AS NUMERIC(19,6)
	
	SET @VENDUTO = 0

	select 
		@VENDUTO = sum(qta1um)
	from 
		storicomag 
	where
		Codart = @ARTICOLO And
		CodDeposito = @MAGAZZINO And
		DataMov Between @DATAINIZIO And @DATAFINE And
		CodCausale In(Select Items from SplitCCVMCAU('CAR')) And
		TipoDoc In(Select Items from SplitCCVMDOC('CAR'))

RETURN(@VENDUTO)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunACQUISTATO_DEPOSITO_ARTICOLO_PERIODO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunACQUISTATO_DEPOSITO_ARTICOLO_PERIODO] TO [Metodo98]
    AS [dbo];

