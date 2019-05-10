

Create FUNCTION FunStringVarEsplicite4Feature
(
    -- Add the parameters for the function here
    @Codice varchar(50)
)
RETURNS varchar(MAX)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result varchar(MAX)
    
    SET @Result =(Select CODTIPOLOGIA + '=' + dbo.padR(CodVariante,LungVariante,' ') +';'
    FROM FEATUREARTICOLO WHERE codarticolo = @Codice ORDER By NRRIGA
    FOR XML PATH('') )

    -- Return the result of the function
    RETURN @Result

END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunStringVarEsplicite4Feature] TO [Metodo98]
    AS [dbo];

