

-- User Defined Function



-- =============================================
-- Author:      Paco e Josh
-- Create date: 
-- Description: 
-- =============================================
CREATE FUNCTION [dbo].[MB_FUSConvertCodeDiscount] 
(
    -- Add the parameters for the function here
    @Codice varchar(10), 
    @Type char(1)
)
RETURNS varchar(11)
AS
BEGIN

DECLARE @Result         AS VarChar(11)

    SELECT @Result=@Codice +(CASE T.TIPOCONTO
                            WHEN 0 THEN ''
                            WHEN 1 THEN 'C'
                            WHEN 2 THEN 'F'
                        END)
    FROM
        MB_RAGGRUPPAMENTO_CODICI_TESTE T,
        MB_RAGGRUPPAMENTO_CODICI_RIGHE R,
        VISTA_TRASPORTO_CODICI V
    WHERE
        R.CODRAGGRUPPAMENTO = T.CODICE AND
        V.CODICE = R.CODSCONTO AND
        R.CODSCONTO = @Codice AND
        (((CASE T.TIPOCONTO
            WHEN 0 THEN ''
            WHEN 1 THEN 'C'
            WHEN 2 THEN 'F'
         END) = @Type OR T.TIPOCONTO = 0))



    RETURN @Result

END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_FUSConvertCodeDiscount] TO [Metodo98]
    AS [dbo];

