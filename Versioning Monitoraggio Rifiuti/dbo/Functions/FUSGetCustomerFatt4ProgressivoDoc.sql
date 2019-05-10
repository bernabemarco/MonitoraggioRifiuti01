-- =============================================
-- Author:		Giosuè Iacobelli
-- Create date: 
-- Description:	Funzione FUSGetCustomer4ProgressivoDoc di Pasquale De Biase Modificata
-- =============================================
CREATE FUNCTION [dbo].[FUSGetCustomerFatt4ProgressivoDoc] 
(
	-- Add the parameters for the function here
	@IDTESTA decimal(10,0),
	@Esercizio decimal(5,0)
)
RETURNS  Varchar(7)
AS
BEGIN
	Declare @CodCliforfatt varchar(7)
-- Add the SELECT statement with parameter references here
	SELECT  @CodCliforfatt= CODCFFATT FROM TESTEDOCUMENTI WHERE PROGRESSIVO =@IDTESTA AND ESERCIZIO = @Esercizio
	RETURN @CodCliforfatt
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUSGetCustomerFatt4ProgressivoDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FUSGetCustomerFatt4ProgressivoDoc] TO [Metodo98]
    AS [dbo];

