
CREATE FUNCTION [price].[FUSCheckSpecialPrice4Customer] 
(
	@CodClifor varchar(50),
	@Esercizio decimal(5,0)
)
RETURNS Smallint

AS
BEGIN
	DECLARE @Result Smallint

	SELECT @Result = USAPRZPRVPART FROM ANAGRAFICARISERVATICF WHERE CODCONTO=@CodClifor AND Esercizio=@Esercizio

	IF NOT EXISTS(SELECT USAPRZPRVPART FROM ANAGRAFICARISERVATICF WHERE CODCONTO=@CodClifor AND Esercizio=@Esercizio)
			SET  @Result = (SELECT TOP 1 USAPRZPRVPART FROM View_AnagraficaCF WHERE CODCLIFOR=@CodClifor)

	RETURN @Result
END



GO
GRANT EXECUTE
    ON OBJECT::[Price].[FUSCheckSpecialPrice4Customer] TO [Metodo98]
    AS [dbo];

