

CREATE FUNCTION [dbo].[FunTipoConfOrdine](@ProgressivoRP Decimal(10,0)) RETURNS NVARCHAR(1)
AS
BEGIN
DECLARE @TipoConf    VARCHAR(1)
DECLARE @TotNumRighe DECIMAL(10,0)
    
    SET @TotNumRighe = 0
    
    SET @Tipoconf = 'A'
    SELECT @TotNumRighe= (SELECT count(*) FROM TP_VISTAQTACONFDOCEURITMO
                               WHERE IDTesta = @ProgressivoRP AND TIPO = 'M')
     
        IF @TotNumRighe <> 0 
           BEGIN
             Set @Tipoconf = 'M'
           End
        
        RETURN(@TipoConf)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunTipoConfOrdine] TO [Metodo98]
    AS [dbo];

