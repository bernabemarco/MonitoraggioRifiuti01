

CREATE PROCEDURE dbo.MB_ProcAcquistatoMediaRS(@Action Smallint, 
                                                  @DATA DECIMAL(8,0) = 0,
                                                   @CODARTICOLO VARCHAR(50) = '',
                                                    @CODDEPOSITO VARCHAR(10) = '',
                                                     @NRIFPARTITA VARCHAR(15) = '',
                                                      @QTA DECIMAL(16,6) = 0,
                                                       @UM VARCHAR(3) = '',
                                                        @IMPORTOTOTNETTOEURO DECIMAL(19,6) = 0,
                                                         @IMPORTOTOTLORDOEURO DECIMAL(19,6) = 0)
AS
BEGIN
SET NOCOUNT ON
    
    SET @IMPORTOTOTNETTOEURO = dbo.FunCostoMedioGGRSdaData(@CODARTICOLO, @CODDEPOSITO)
    
    DELETE FROM MB_ACQUISTATO_STORICO
    WHERE CODARTICOLO = @CODARTICOLO AND CODDEPOSITO = @CODDEPOSITO
                    
    --IF NOT EXISTS(SELECT DATA FROM MB_ACQUISTATO_STORICO WHERE DATA = @DATA AND CODARTICOLO = @CODARTICOLO AND CODDEPOSITO = @CODDEPOSITO AND NRRIFPARTITA = @NRIFPARTITA AND UM = @UM AND TIPO = 0)
    --  BEGIN
            IF (@Action = 0)
                BEGIN
                    --INSERT INTO MB_ACQUISTATO_STORICO(DATA,CODARTICOLO,CODDEPOSITO,NRRIFPARTITA,QTA,UM,VALORENETTO,VALORELORDO,VALOREPREMIO,UtenteModifica,DataModifica)
                    --SELECT TOP 1 @DATA,CODARTICOLO,CODDEPOSITO,NRRIFPARTITA,QTA,UM,VALORENETTO,VALORELORDO,0,UtenteModifica,DataModifica FROM MB_ACQUISTATO_STORICO
                    --WHERE DATA < @DATA AND CODARTICOLO = @CODARTICOLO AND CODDEPOSITO = @CODDEPOSITO AND NRRIFPARTITA = @NRIFPARTITA AND UM = @UM AND TIPO = 0
                    --ORDER BY DATA DESC
                    
                    --IF (@@ROWCOUNT = 0)
                    --  BEGIN
                            INSERT INTO MB_ACQUISTATO_STORICO(DATA,CODARTICOLO,CODDEPOSITO,NRRIFPARTITA,QTA,UM,VALORENETTO,VALORELORDO,VALOREPREMIO,UtenteModifica,DataModifica)
                            SELECT 
                                19900101 , 
                                @CODARTICOLO , 
                                @CODDEPOSITO , 
                                @NRIFPARTITA ,  
                                1, 
                                @UM , 
                                @IMPORTOTOTNETTOEURO, 
                                @IMPORTOTOTNETTOEURO, 
                                0 ,
                                USER_NAME() , 
                                GETDATE()
                            
                            --SET @Action = -1
                        --END
                END
        --END
    
    --IF (@Action <> -1)
    --  BEGIN
    --      UPDATE MB_ACQUISTATO_STORICO SET 
    --          QTA = QTA + @QTA,
    --          VALORENETTO = VALORENETTO + @IMPORTOTOTNETTOEURO,
    --          VALORELORDO = @IMPORTOTOTLORDOEURO,
    --          UtenteModifica = USER_NAME(),
    --          DataModifica = GETDATE()
    --      WHERE
    --          DATA = @DATA AND
    --          CODARTICOLO = @CODARTICOLO AND
    --          CODDEPOSITO = @CODDEPOSITO AND
    --          NRRIFPARTITA = @NRIFPARTITA AND
    --          UM = @UM AND
    --          TIPO = 0
    --  END
   
RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_ProcAcquistatoMediaRS] TO [Metodo98]
    AS [dbo];

