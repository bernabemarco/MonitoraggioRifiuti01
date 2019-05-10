

CREATE PROCEDURE dbo.MB_ProcAcquistatoListino(@Action Smallint, 
                                                  @DATA DECIMAL(8,0) = 0,
                                                   @CODARTICOLO VARCHAR(50) = '',
                                                    @CODDEPOSITO VARCHAR(10) = '',
                                                     @NRIFPARTITA VARCHAR(15) = '',
                                                      @QTA DECIMAL(16,6) = 0,
                                                       @UM VARCHAR(3) = '',
                                                        @IMPORTOTOTNETTOEURO DECIMAL(19,6) = 0,
                                                         @IMPORTOTOTLORDOEURO DECIMAL(19,6) = 0,
                                                          @LISTINO AS DECIMAL(5,0) = 0)
AS
BEGIN
SET NOCOUNT ON
    /*SET @IMPORTOTOTLORDOEURO = 0
    SELECT @IMPORTOTOTLORDOEURO = PREZZOEURO , @IMPORTOTOTLORDOEURO = TP_PREZZOPARTEURO FROM LISTINIARTICOLI WHERE NRLISTINO = @LISTINO AND UM = @UM AND CODART = @CODARTICOLO*/
    DELETE FROM MB_ACQUISTATO_STORICO WHERE CODARTICOLO = @CODARTICOLO AND UM = @UM AND TIPO = 0
    
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
                                '19900101' , 
                                CODART, 
                                '' , 
                                '' ,    
                                1, 
                                UM , 
                                PREZZOEURO, 
                                TP_PREZZOPARTEURO, 
                                0 ,
                                USER_NAME() , 
                                GETDATE()
                            FROM LISTINIARTICOLI 
                            WHERE NRLISTINO = @LISTINO AND UM = @UM AND CODART = @CODARTICOLO
                            
                        --  SET @Action = -1
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
    ON OBJECT::[dbo].[MB_ProcAcquistatoListino] TO [Metodo98]
    AS [dbo];

