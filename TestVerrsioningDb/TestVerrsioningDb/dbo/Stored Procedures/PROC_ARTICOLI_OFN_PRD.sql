

CREATE PROCEDURE dbo.PROC_ARTICOLI_OFN_PRD(@IDSESSIONE DECIMAL(10,0),
                                                 @CODFOR nVARCHAR(4000),
                                                  @NOMEPIANO nVARCHAR(4000),
                                                   @GRUPPO nVARCHAR(4000),
                                                    @CODCATEGORIASTAT nVARCHAR(4000),
                                                     @CATEGORIA nVARCHAR(4000),
                                                      @VARESPLICITE nVARCHAR(4000),
                                                       @CODART nVARCHAR(4000),
                                                        @DESCARTICOLO nVARCHAR(4000),
                                                         @RIFCOMM nVARCHAR(4000),
                                                          @DATACONSEGNA nVARCHAR(4000),
                                                           @PERS nVARCHAR(4000))
AS
BEGIN
SET NOCOUNT ON
DECLARE @SQLQuery           nVARCHAR(4000)
DECLARE @ParamDefinition    nVARCHAR(4000)
DECLARE @WhereTabLotti      nVARCHAR(4000)
DECLARE @WhereArticoli      nVARCHAR(4000)
DECLARE @WherePers          nVARCHAR(4000)
    
    Set @SQLQuery = N'DELETE FROM TP_ARTICOLIORDINEFORNITORE_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10))
    
    EXEC sp_executesql @SQLQuery
    
    
    /*Set @ParamDefinition = ' @CODART nVARCHAR(4000),
                             @CODFOR nVARCHAR(4000),
                             @NOMEPIANO nVARCHAR(4000),
                             @DESCARTICOLO nVARCHAR(4000),
                             @GRUPPO nVARCHAR(4000),
                             @CODCATEGORIASTAT nVARCHAR(4000),
                             @CATEGORIA nVARCHAR(4000),
                             @VARESPLICITE nVARCHAR(4000),
                             @RIFCOMM nVARCHAR(4000)'*/
    
    SET @WhereTabLotti = ''
    SET @WhereArticoli = ''
    SET @WherePers = ''
    If @CODART Is Not Null 
        Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@CODART,'CODART','PP.CODART')
    
    If @CODFOR  Is Not Null 
        Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@CODFOR,'CODFOR','PP.CODFOR')
    
    If @RIFCOMM Is Not Null 
        Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@RIFCOMM,'RIFCOMMESSA','PP.RIFCOMMCLI') 
    
    If @DATACONSEGNA Is Not Null 
        Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@DATACONSEGNA,'DATACONSEGNA','PP.DATACONS')
    If @NOMEPIANO Is Not Null 
        Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@NOMEPIANO,'NOMEPIANIF','PP.NOMEPIANIF')
    If @DESCARTICOLO Is Not Null 
        Set @WhereArticoli = @WhereArticoli + N' AND ' + REPLACE(@DESCARTICOLO,'DESCARTICOLO','ANAGRAFICAARTICOLI.DESCRIZIONE') 
    
    If @GRUPPO  Is Not Null 
        Set @WhereArticoli = @WhereArticoli + N' AND ' + REPLACE(@GRUPPO,'GRUPPO','ANAGRAFICAARTICOLI.GRUPPO')
    If @CODCATEGORIASTAT Is Not Null 
        Set @WhereArticoli = @WhereArticoli + N' AND ' + REPLACE(@CODCATEGORIASTAT,'(CODCATEGORIASTAT','(ANAGRAFICAARTICOLI.CODCATEGORIASTAT')
    
    If @CATEGORIA Is Not Null 
        Set @WhereArticoli = @WhereArticoli + N' AND ' + REPLACE(@CATEGORIA,'(CATEGORIA','(ANAGRAFICAARTICOLI.CATEGORIA')
    If @VARESPLICITE Is Not Null 
        Set @WhereArticoli = @WhereArticoli + N' AND ' + REPLACE(@VARESPLICITE,'VARESPLICITE','ANAGRAFICAARTICOLI.VARESPLICITE') 
    
    If @PERS Is Not Null 
        BEGIN
            Set @WherePers = @WherePers + N' AND ' + @PERS
            
            Set @WherePers = REPLACE(@WherePers,'CODART','TLRRD.CODART')
            Set @WherePers = REPLACE(@WherePers,'CODFOR','TLRRD.CODFOR')
            Set @WherePers = REPLACE(@WherePers,'NOMEPIANIF','TLRRD.NOMEPIANIF')
            Set @WherePers = REPLACE(@WherePers,'DESCARTICOLO','ANAGA.DESCRIZIONE') 
            Set @WherePers = REPLACE(@WherePers,'GRUPPO','ANAGA.GRUPPO')
            Set @WherePers = REPLACE(@WherePers,'(CODCATEGORIASTAT','(ANAGA.CODCATEGORIASTAT')
            Set @WherePers = REPLACE(@WherePers,'(CATEGORIA','(ANAGA.CATEGORIA')
            Set @WherePers = REPLACE(@WherePers,'VARESPLICITE','ANAGA.VARESPLICITE') 
            Set @WherePers = REPLACE(@WherePers,'RIFCOMMESSA','TLRRD.RIFCOMMCLI') 
            Set @WherePers = REPLACE(@WherePers,'DATACONSEGNA','TLRRD.DATACONS') 
        END
    SET @SQLQuery = N'INSERT INTO TP_ARTICOLIORDINEFORNITORE_TEMP
                    SELECT
                        ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AS IDSESSIONE,
                        CODART,
                        DESCARTICOLO,
                        0 AS QTAORDINATA,
                        SUM(QTAORD) AS PREVISIONE,
                        0 AS ANNULLA,
                        USER_NAME() AS UTENTEMODIFICA,
                        GETDATE() AS DATAMODIFICA
                    FROM
                    (
                    SELECT  
                        TLRRD.CODART,
                        TLRRD.CODFOR,
                        TLRRD.TP_CODDEP,
                        ANAGA.DESCARTICOLO,
                        ANAGA.GRUPPO,
                        ANAGA.CATEGORIA,
                        ANAGA.CODCATEGORIASTAT,             
                        ANAGA.VARESPLICITE,
                        TLRRD.CODFAMIGLIAPOS,
                        TLRRD.CODREPARTOPOS,
                        TLRRD.CODMARCHIO,
                        TLRRD.QTAORD
                    FROM
                        (   
                        SELECT
                            TLRRD.CODART,
                            TLRRD.CODFOR,
                            TLRRD.TP_CODDEP,
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO,
                            TLRRD.NOMEPIANIF,
                            TLRRD.DATACONS,
                            TLRRD.RIFCOMMCLI,
                            TLRRD.QTAORD
                        FROM
                            (
                                SELECT 
                                    TLRRD.CODART,
                                    TLRRD.CODFOR,
                                    TLRRD.TP_CODDEP,
                                    PP.NOMEPIANIF,
                                    PP.DATACONS,
                                    PP.RIFCOMMCLI,
                                    SUM(PP.QTAORD - PP.QTDOCEMESSO) AS QTAORD
                                FROM 
                                    TABLOTTIRIORDINO TLRRD,
                                    TP_TABMagazzini TM,
                                    PROGPRODUZIONE PP
                                WHERE
                                    ((TLRRD.CODART <> '''' AND TLRRD.CODART IS NOT NULL)) AND 
                                    ((TLRRD.CODFOR <> '''' AND TLRRD.CODFOR IS NOT NULL)) AND
                                    ((TLRRD.TP_FORNFATTURAZIONE <> '''' AND TLRRD.TP_FORNFATTURAZIONE IS NOT NULL)) AND
                                    ((TLRRD.TP_CODDEP <> '''' AND TLRRD.TP_CODDEP IS NOT NULL)) AND
                                    TLRRD.TP_CodDep = TM.CodDeposito AND 
                                    PP.CODART = TLRRD.CODART AND
                                    PP.CODFOR = TLRRD.CODFOR AND
                                    ((PP.QTAORD>PP.QTADOCUMENTO)) AND 
                                    PP.TIPO = 1 ' + @WhereTabLotti + '
                                GROUP BY 
                                    TLRRD.CODART,   
                                    TLRRD.CODFOR,
                                    TLRRD.TP_CODDEP,
                                    PP.NOMEPIANIF,
                                    PP.DATACONS,
                                    PP.RIFCOMMCLI
                            ) TLRRD,
                            TP_EXTRAMAG TXMAG
                        WHERE
                            TXMAG.CODART = TLRRD.CODART AND 
                            TXMAG.CONSIDACQ = 1
                        GROUP BY 
                            TLRRD.CODART,   
                            TLRRD.CODFOR,
                            TLRRD.TP_CODDEP,
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO,
                            TLRRD.NOMEPIANIF,
                            TLRRD.DATACONS,
                            TLRRD.RIFCOMMCLI,
                            TLRRD.QTAORD
                        ) TLRRD,
                        (SELECT 
                            CODICE,
                            DESCRIZIONE AS DESCARTICOLO,
                            GRUPPO,
                            CATEGORIA,
                            CODCATEGORIASTAT,               
                            VARESPLICITE
                         FROM
                            ANAGRAFICAARTICOLI
                         WHERE
                            ARTTIPOLOGIA = 0
                            ' + @WhereArticoli + ') ANAGA
                    WHERE
                        ANAGA.CODICE = TLRRD.CODART  ' + @WherePers + '
                    ) ARTICOLIFORNITORI 
                    GROUP BY 
                        CODART,
                        DESCARTICOLO'
    --PRINT @SQLQuery
    EXEC sp_executesql @SQLQuery /*, @ParamDefinition, @CODART, @CODFOR, @NOMEPIANO, @DESCARTICOLO, @GRUPPO, @CODCATEGORIASTAT, @CATEGORIA, @VARESPLICITE, @RIFCOMM*/
    
    SET @SQLQuery = N'DELETE FROM TP_ARTICOLIORDINEFORNITORE_TEMP WHERE PREVISIONE <= 0 AND IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10))
    
    --PRINT @SQLQuery
    EXEC sp_executesql @SQLQuery 
    
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ARTICOLI_OFN_PRD] TO [Metodo98]
    AS [dbo];

