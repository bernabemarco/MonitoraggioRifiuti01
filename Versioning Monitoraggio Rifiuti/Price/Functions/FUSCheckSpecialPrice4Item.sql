

CREATE FUNCTION [Price].[FUSCheckSpecialPrice4Item] 
(
    @Codart varchar(50),
    @Esercizio decimal(5,0)
)
RETURNS Smallint
--ENCRY--
AS
BEGIN
    DECLARE @Result Smallint

    SELECT @Result = UsaPrezziPart FROM AnagraficaArticoliComm WHERE CodiceArt=@codart AND Esercizio=@Esercizio
    RETURN @Result

END

