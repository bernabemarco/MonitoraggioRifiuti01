
/****** Oggetto: funzione definita dall'utente dbo.FunTOTDOCNETTO    Data dello script: 22/04/2005 10.39.49 ******/
CREATE FUNCTION [dbo].[FunTOTDOCNETTO](@Progressivo Decimal(10,0))
RETURNS Decimal(18,6)
AS
BEGIN

DECLARE @TOTALE Decimal(18,6)
	
	SELECT @TOTALE=(TOTDOCUMENTO - TOTOMAGGIEURO) FROM TESTEDOCUMENTI WHERE Progressivo=@Progressivo

	RETURN(@TOTALE)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTOTDOCNETTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunTOTDOCNETTO] TO [Metodo98]
    AS [dbo];

