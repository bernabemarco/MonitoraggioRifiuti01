

CREATE PROCEDURE [dbo].[Proc_Vendors_DuplicaPuntoVendita](@CodPuntoVendita_Cur Varchar(7),
                                                           @CodPuntoVendita_Tmp Varchar(7),
                                                            @CodPuntoVendita_New Varchar(7) OUTPUT)
AS

BEGIN

SET NOCOUNT ON;
    
    BEGIN TRAN  
    
    SET @CodPuntoVendita_New = ''
    
    IF EXISTS(SELECT [CODCONTO] FROM [dbo].[ANAGRAFICACF] WHERE [CODCONTO] = @CodPuntoVendita_Tmp) AND 
        NOT EXISTS(SELECT [CODCONTO] FROM [dbo].[TP_PUNTIVENDITA] WHERE [CODCONTO] = @CodPuntoVendita_Tmp)
        BEGIN
            INSERT INTO [dbo].[TP_PUNTIVENDITA]([CODCONTO],[DSCCONTO],[NRLISTINO],[AZIENDA],[DEPOSITO],[ORARIOCOLLEGAMENTO],[ULTPREPAR],[ULTTRASF],[ULTRIC]
                                               ,[ATTIVO],[FORNITORE],[RANGEDA],[RANGEA],[TIPOCODIFICA],[TIPOELABORAZIONE],[PRIORITA],[PATHR],[PATHT],[TIPOTRASFDATI]
                                               ,[CODMASTRO],[CODLISTINO],[TIPOMSG],[RANGEIDDA],[RANGEIDA],[NRLISTVENACQ],[EXPDATADOC],[UTENTEMODIFICA],[DATAMODIFICA])
            SELECT @CodPuntoVendita_Tmp,(SELECT [DSCCONTO1] FROM [dbo].[ANAGRAFICACF] WHERE [CODCONTO] = @CodPuntoVendita_Tmp),[NRLISTINO],[AZIENDA],[DEPOSITO],[ORARIOCOLLEGAMENTO],[ULTPREPAR],[ULTTRASF],[ULTRIC]
                  ,[ATTIVO],[FORNITORE],[RANGEDA],[RANGEA],[TIPOCODIFICA],[TIPOELABORAZIONE],[PRIORITA],[PATHR],[PATHT],[TIPOTRASFDATI]
                  ,[CODMASTRO],[CODLISTINO],[TIPOMSG],[RANGEIDDA],[RANGEIDA],[NRLISTVENACQ],[EXPDATADOC],USER_NAME(),GETDATE()
            FROM [dbo].[TP_PUNTIVENDITA]
            WHERE [CODCONTO] = @CodPuntoVendita_Cur
            
            IF NOT EXISTS(SELECT [CODICE] FROM [dbo].[TP_CONFIGESPORTAZ] WHERE [CODICE] = @CodPuntoVendita_Tmp)
            INSERT INTO [dbo].[TP_CONFIGESPORTAZ]([TIPO],[CODICE],[TABELLEINESPORTAZIONE],[GRUPPO],[CATEGORIA],[CATEGORIASTATISTICA],[ARTICOLICONTIPOLOGIA],[TIPORIGA],[FAMIGLIAPOS],[REPARTOPOS],[UTENTEMODIFICA],[DATAMODIFICA])
            SELECT [TIPO],@CodPuntoVendita_Tmp,[TABELLEINESPORTAZIONE],[GRUPPO],[CATEGORIA],[CATEGORIASTATISTICA],[ARTICOLICONTIPOLOGIA],[TIPORIGA],[FAMIGLIAPOS],[REPARTOPOS],USER_NAME(),GETDATE()
            FROM [dbo].[TP_CONFIGESPORTAZ]
            WHERE [CODICE] = @CodPuntoVendita_Cur
            
            IF NOT EXISTS(SELECT [CODAGENTE] FROM [dbo].[TP_DOCTRASFAG] WHERE [CODAGENTE] = @CodPuntoVendita_Tmp)
            INSERT INTO [dbo].[TP_DOCTRASFAG]([CODAGENTE],[CODICEDOC],[TipoGriglia],[GiacDisp],[TIPO],[TIPODOCEXP],[DESCDOCEXP],[DOCPREDEF],[ORDINETABLET],[RISPETTADOCORIGINE],[PRELEVABILE],[UTENTEMODIFICA],[DATAMODIFICA])
            SELECT @CodPuntoVendita_Tmp,[CODICEDOC],[TipoGriglia],[GiacDisp],[TIPO],[TIPODOCEXP],[DESCDOCEXP],[DOCPREDEF],[ORDINETABLET],[RISPETTADOCORIGINE],[PRELEVABILE],USER_NAME(),GETDATE()
            FROM [dbo].[TP_DOCTRASFAG]
            WHERE [CODAGENTE] = @CodPuntoVendita_Cur
            
            IF NOT EXISTS(SELECT [Entita] FROM [dbo].[TP_TIPIAGPV] WHERE [Entita] = @CodPuntoVendita_Tmp)
            INSERT INTO [dbo].[TP_TIPIAGPV]([Entita],[Priorita])
            SELECT @CodPuntoVendita_Tmp,[Priorita] 
            FROM [dbo].[TP_TIPIAGPV]
            WHERE [Entita] = @CodPuntoVendita_Cur

            SET @CodPuntoVendita_New = @CodPuntoVendita_Tmp
        END
        
    IF @@ERROR <> 0 GOTO ErrorHandler
    COMMIT TRAN
    RETURN(0)
  
ErrorHandler:
    ROLLBACK TRAN
    PRINT @@ERROR
    SET @CodPuntoVendita_New = ''
    RETURN(@@ERROR)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_Vendors_DuplicaPuntoVendita] TO [Metodo98]
    AS [dbo];

