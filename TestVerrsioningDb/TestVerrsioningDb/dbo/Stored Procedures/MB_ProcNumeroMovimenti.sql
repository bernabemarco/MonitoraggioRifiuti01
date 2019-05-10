

CREATE PROCEDURE dbo.MB_ProcNumeroMovimenti(@Action Smallint, 
                                                  @DATA DECIMAL(8,0) = 0,
                                                   @CODARTICOLO VARCHAR(50) = '',
                                                    @CODDEPOSITO VARCHAR(10) = '',
                                                     @NRIFPARTITA VARCHAR(15) = '',
                                                      @QTA DECIMAL(16,6) = 0,
                                                       @UM VARCHAR(3) = '',
                                                        @IMPORTOTOTNETTOEURO DECIMAL(19,6) = 0,
                                                         @IMPORTOTOTLORDOEURO DECIMAL(19,6) = 0,
                                                          @NUMMOVIMENTI INT)
AS
BEGIN
SET NOCOUNT ON
    
    DELETE FROM MB_ACQUISTATO_STORICO
    WHERE CAST(CONVERT(VARCHAR(8),DATA,112) AS DECIMAL(8,0)) = CAST(@DATA AS VARCHAR(8)) AND
          CODARTICOLO = @CODARTICOLO  AND 
          CODDEPOSITO = @CODDEPOSITO  AND 
          NRRIFPARTITA = @NRIFPARTITA
          
    IF (@Action = 0)
        BEGIN
            INSERT INTO MB_ACQUISTATO_STORICO(DATA,CODARTICOLO,CODDEPOSITO,NRRIFPARTITA,QTA,UM,VALORENETTO,VALORELORDO,VALOREPREMIO,UtenteModifica,DataModifica)
            SELECT
                    @DATA,
                    CODART,
                    CODDEPOSITO,
                    @NRIFPARTITA,
                    SUM(QTA) AS QTA,
                    @UM AS UM,
                    SUM(IMPORTOTOTNETTOEURO) AS IMPORTOTOTNETTOEURO,
                    SUM(IMPORTOTOTLORDOEURO) AS IMPORTOTOTLORDOEURO,
                    0,
                    USER_NAME(),
                    GETDATE() 
                FROM
                (
                    SELECT TOP (@NUMMOVIMENTI) 
                        STMAG.CODART,
                        STMAG.CODDEPOSITO,
                        (STMAG.QTA1UM * STMAG.QUANTITACARICO) AS QTA,
                        (STMAG.IMPORTOTOTNETTOEURO * STMAG.VALORECARICO) AS IMPORTOTOTNETTOEURO,
                        (STMAG.IMPORTOTOTLORDOEURO * STMAG.VALORECARICO) AS IMPORTOTOTLORDOEURO
                    FROM STORICOMAG STMAG,
                         MB_FunGetCausaliValide() FGCV
                    WHERE FGCV.TIPO = 0 AND
                          STMAG.CODCAUSALE = FGCV.CODCAUSALE AND
                          (STMAG.TIPODOC = FGCV.CODDOCUMENTO OR FGCV.CODDOCUMENTO = '') AND
                          CAST(CONVERT(VARCHAR(8),STMAG.DATAMOV,112) AS DECIMAL(8,0)) <= CAST(@DATA AS VARCHAR(8)) AND
                          STMAG.CODART = @CODARTICOLO  AND 
                          STMAG.CODDEPOSITO = @CODDEPOSITO  AND 
                          (STMAG.NRIFPARTITA = @NRIFPARTITA OR @NRIFPARTITA = '')
                    ORDER BY DATAMOV DESC
                ) A
                GROUP BY CODART,
                         CODDEPOSITO
        END
   
RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_ProcNumeroMovimenti] TO [Metodo98]
    AS [dbo];

