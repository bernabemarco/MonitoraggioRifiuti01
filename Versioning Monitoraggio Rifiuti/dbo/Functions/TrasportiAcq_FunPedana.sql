

CREATE FUNCTION [dbo].[TrasportiAcq_FunPedana] 
(
    @Esercizio Decimal(5,0),
    @TipoDoc nVarchar(3),
    @NumeroDoc Decimal(10,0)
)
RETURNS decimal(19,6)
AS
BEGIN

    DECLARE @Result decimal(19,6)
    
    SET @Result = 0
    
    SELECT 
        @Result = SUM(RD.QTAGEST * AFC.FATTORE) 
    FROM 
        RIGHEDOCUMENTI RD
    CROSS APPLY
        TP_TRASPORTOPARAMETRIACQ PAR
    INNER JOIN ARTICOLIFATTORICONVERSIONE AFC
        ON AFC.CODART = RD.CODART AND
           AFC.UM1 = RD.UMGEST AND
           AFC.UM2 = PAR.UMPEDANA
    WHERE 
        ESERCIZIO = @Esercizio AND 
        TIPODOC = @TipoDoc AND 
        NUMERODOC = @NumeroDoc

    RETURN @Result

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[TrasportiAcq_FunPedana] TO [Metodo98]
    AS [dbo];

