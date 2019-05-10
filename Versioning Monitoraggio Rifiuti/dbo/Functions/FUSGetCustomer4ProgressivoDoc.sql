-- =============================================
-- Author:		Pasquale De Biase
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[FUSGetCustomer4ProgressivoDoc] 
(
	-- Add the parameters for the function here
	@IDTESTA decimal(10,0),
	@Esercizio decimal(5,0)
)
RETURNS  Varchar(7)
AS
BEGIN
	Declare @CodClifor varchar(7)
-- Add the SELECT statement with parameter references here
	SELECT  @CodClifor= CODCLIFOR FROM TESTEDOCUMENTI WHERE PROGRESSIVO =@IDTESTA AND ESERCIZIO = @Esercizio
	RETURN @CodClifor
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUSGetCustomer4ProgressivoDoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FUSGetCustomer4ProgressivoDoc] TO [Metodo98]
    AS [dbo];

