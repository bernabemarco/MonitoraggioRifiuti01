

CREATE FUNCTION [dbo].[FunGetColoreGiacenza](@Articolo NVARCHAR(50),
                                              @Deposito NVARCHAR(10),
                                               @Tipo SMALLINT,
                                                @Agente NVARCHAR(7))
RETURNS nVARCHAR(6)
AS
BEGIN

DECLARE @COLORE nVARCHAR(6)
    
    SET @COLORE = '000000'
    
    IF (@Agente <> '')
        BEGIN
            SELECT @Tipo = ISNULL(GESTGIACAG, 0) FROM TP_TRASFAGENTI WHERE CODAGENTE = @Agente
        END
        
    IF (@Tipo > 0 )
        BEGIN
            SELECT 
                @COLORE = (CASE @Tipo WHEN 1 THEN COLOREG 
                                      WHEN 2 THEN COLOREGI
                                      WHEN 3 THEN COLOREGOI
                           END)
            FROM 
                TP_GiacenzePerColore 
            WHERE 
                CodArticolo = @Articolo AND ((CodDeposito = @Deposito))
        END
        
    RETURN(@COLORE)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunGetColoreGiacenza] TO [Metodo98]
    AS [dbo];

