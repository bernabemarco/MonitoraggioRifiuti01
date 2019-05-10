
/****** Oggetto: funzione definita dall'utente dbo.FunTOTDOCNETTOOMAGGI    Data dello script: 22/04/2005 10.39.49 ******/
CREATE FUNCTION [dbo].[FunTOTDOCNETTOOMAGGI](@Progressivo Decimal(10,0))
RETURNS Decimal(18,6)
AS
BEGIN

DECLARE @TOTALE Decimal(18,6)
	
	SELECT @TOTALE=(TOTIMPONIBILEEURO - TOTOMAGGIEURO) FROM TESTEDOCUMENTI WHERE Progressivo=@Progressivo

	RETURN(@TOTALE)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTOTDOCNETTOOMAGGI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunTOTDOCNETTOOMAGGI] TO [Metodo98]
    AS [dbo];

