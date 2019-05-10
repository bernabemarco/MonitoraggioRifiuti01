-- =============================================
-- Author:		Giosuè Iacobelli
-- Create date: 
-- Description:	Funzione FUSGetCustomer4ProgressivoDoc di Pasquale De Biase Modificata
-- =============================================
CREATE FUNCTION [dbo].[FUSGetDestDiv4ProgressivoDoc] 
(
	-- Add the parameters for the function here
	@IDTESTA decimal(10,0),
	@Esercizio decimal(5,0)
)
RETURNS  decimal(5,0)
AS
BEGIN
	Declare @NumDestDivMerci decimal(5,0)
-- Add the SELECT statement with parameter references here
	SELECT  @NumDestDivMerci = NUMDESTDIVERSAMERCI FROM TESTEDOCUMENTI WHERE PROGRESSIVO =@IDTESTA AND ESERCIZIO = @Esercizio
	RETURN @NumDestDivMerci
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUSGetDestDiv4ProgressivoDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FUSGetDestDiv4ProgressivoDoc] TO [Metodo98]
    AS [dbo];

