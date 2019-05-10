

CREATE PROCEDURE dbo.MB_ProcAcquistatoUltimo(@Action Smallint, 
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
    DELETE FROM MB_ACQUISTATO_STORICO WHERE CODARTICOLO = @CODARTICOLO AND TIPO = 0
    IF (@Action = 0)
        BEGIN
            INSERT INTO MB_ACQUISTATO_STORICO(DATA,CODARTICOLO,CODDEPOSITO,NRRIFPARTITA,QTA,UM,VALORENETTO,VALORELORDO,VALOREPREMIO,ULTIMO,UtenteModifica,DataModifica)
            SELECT  CAST(CONVERT(VARCHAR(8),DATA,112) AS DECIMAL(8,0)),CODARTICOLO,'','',1,UM,PREZZOEURO,PREZZORIGHEDOCEURO,0,1,USER_NAME(),GETDATE() 
            FROM dbo.STORICOPREZZIARTICOLO 
            WHERE 
                    codarticolo = @CODARTICOLO AND TipoPrezzo ='F' 
                AND CAST(CONVERT(VARCHAR(8),DATA,112) AS DECIMAL(8,0)) <=  @DATA 
            GROUP BY DATA,CODARTICOLO,UM,PREZZOEURO,PREZZORIGHEDOCEURO
            order by data desc  
                        
            SET @Action = -1
        END
   
RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_ProcAcquistatoUltimo] TO [Metodo98]
    AS [dbo];

