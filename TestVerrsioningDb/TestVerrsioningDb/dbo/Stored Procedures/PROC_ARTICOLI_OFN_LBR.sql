
/*35000 = CodFor
35001 = TP_CodDep
35002 = Gruppo
35003 = Categoria
35004 = CodCategoriaStat
35005 = Varianti
35006 = CodArt
35007 = DescArticolo
35008 = BRAND*/
CREATE PROCEDURE dbo.PROC_ARTICOLI_OFN_LBR(@IDSESSIONE DECIMAL(10,0),
                                                @CODFOR nVARCHAR(4000),
                                                 @TP_CODDEP nVARCHAR(4000),
                                                  @GRUPPO nVARCHAR(4000),
                                                   @CODCATEGORIASTAT nVARCHAR(4000),
                                                    @CATEGORIA nVARCHAR(4000),
                                                     @VARESPLICITE nVARCHAR(4000),
                                                      @CODART nVARCHAR(4000),
                                                       @DESCARTICOLO nVARCHAR(4000),
                                                        @CODMARCHIO nVARCHAR(4000),
                                                         @PERS nVARCHAR(4000),
                                                          @ADDPREVISIONI SMALLINT)
AS
BEGIN
SET NOCOUNT ON
DECLARE @SQLQuery           nVARCHAR(4000)
DECLARE @SQLLotto           nVARCHAR(4000)
DECLARE @ParamDefinition    nVARCHAR(4000)
DECLARE @WhereTabLotti      nVARCHAR(4000)
DECLARE @WhereArticoli      nVARCHAR(4000)
DECLARE @WhereExtramag      nVARCHAR(4000)
DECLARE @WherePers          nVARCHAR(4000)
    
    Set @SQLQuery = N'DELETE FROM TP_ARTICOLIORDINEFORNITORE_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10))
    
    EXEC sp_executesql @SQLQuery
    
    
    /*Set @ParamDefinition = ' @CODART nVARCHAR(4000),
                             @CODFOR nVARCHAR(4000),
                             @TP_CODDEP nVARCHAR(4000),
                             @DESCARTICOLO nVARCHAR(4000),
                             @GRUPPO nVARCHAR(4000),
                             @CODCATEGORIASTAT nVARCHAR(4000),
                             @CATEGORIA nVARCHAR(4000),
                             @VARESPLICITE nVARCHAR(4000),
                             @CODMARCHIO nVARCHAR(4000)'*/
    
    SET @WhereTabLotti = ''
    SET @WhereArticoli = ''
    SET @WhereExtramag = ''
    SET @WherePers = ''
    SET @SQLLotto = ''
    
    If (@CODART Is Not Null)
        BEGIN
            Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@CODART,'CODART','TLRRD.CODART')
            Set @SQLLotto = @SQLLotto + N' WHERE ' + REPLACE(@CODART,'CODART','CODARTICOLO')
        END
    
    If (@CODFOR  Is Not Null)
        BEGIN
            Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@CODFOR,'CODFOR','TLRRD.CODFOR')
            Set @SQLLotto = @SQLLotto + N' AND ' + REPLACE(@CODFOR,'CODFOR','CODFORNITORE')
        END
        
    If (@TP_CODDEP Is Not Null)
        BEGIN
            Set @WhereTabLotti = @WhereTabLotti + N' AND ' + REPLACE(@TP_CODDEP,'TP_CODDEP','TLRRD.TP_CODDEP')
            Set @SQLLotto = @SQLLotto + N' AND ' + REPLACE(@TP_CODDEP,'TP_CODDEP','CODDEPOSITO')
        END
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
    
    If @CODMARCHIO Is Not Null 
        Set @WhereExtramag = @WhereExtramag + N' AND ' + REPLACE(@CODMARCHIO,'CODMARCHIO','TXMAG.CODMARCHIO') 
    If (@PERS Is Not Null)
        BEGIN
            Set @WherePers = @WherePers + N' WHERE ' + @PERS
            Set @WherePers = REPLACE(@WherePers,'CODART','TLRRD.CODART')
            Set @WherePers = REPLACE(@WherePers,'CODFOR','TLRRD.CODFOR')
            Set @WherePers = REPLACE(@WherePers,'TP_CODDEP','TLRRD.TP_CODDEP')
            Set @WherePers = REPLACE(@WherePers,'DESCARTICOLO','ANAGA.DESCRIZIONE') 
            Set @WherePers = REPLACE(@WherePers,'GRUPPO','ANAGA.GRUPPO')
            Set @WherePers = REPLACE(@WherePers,'(CODCATEGORIASTAT','(ANAGA.CODCATEGORIASTAT')
            Set @WherePers = REPLACE(@WherePers,'(CATEGORIA','(ANAGA.CATEGORIA')
            Set @WherePers = REPLACE(@WherePers,'VARESPLICITE','ANAGA.VARESPLICITE') 
            Set @WherePers = REPLACE(@WherePers,'CODMARCHIO','TLRRD.CODMARCHIO') 
            Set @WherePers = REPLACE(@WherePers,'RIGHEDOCUMENTI.TLRRD.CODART','RIGHEDOCUMENTI.CODART')
            Set @SQLLotto = @SQLLotto + N' WHERE ' + @PERS
            Set @SQLLotto = REPLACE(@SQLLotto,'CODART','CODARTICOLO')
            Set @SQLLotto = REPLACE(@SQLLotto,'CODFOR','CODFORNITORE')
            Set @SQLLotto = REPLACE(@SQLLotto,'TP_CODDEP','CODDEPOSITO')
        END
    SET @SQLQuery = N'INSERT INTO TP_ARTICOLIORDINEFORNITORE_TEMP
                    SELECT
                        ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AS IDSESSIONE,
                        CODART,
                        DESCARTICOLO,
                        0 AS QTAORDINATA,
                        0 AS PREVISIONE,
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
                        TLRRD.CODMARCHIO
                    FROM
                        (   
                        SELECT
                            TLRRD.CODART,
                            TLRRD.CODFOR,
                            TLRRD.TP_CODDEP,
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO
                        FROM
                            (
                                SELECT 
                                    TLRRD.CODART,
                                    TLRRD.CODFOR,
                                    TLRRD.TP_CODDEP
                                FROM 
                                    TABLOTTIRIORDINO TLRRD,
                                    TP_TABMagazzini TM
                                WHERE
                                    ((TLRRD.CODART<>'''' AND TLRRD.CODART IS NOT NULL)) AND 
                                    ((TLRRD.CODFOR<>'''' AND TLRRD.CODFOR IS NOT NULL)) AND
                                    ((TLRRD.TP_FORNFATTURAZIONE<>'''' AND TLRRD.TP_FORNFATTURAZIONE IS NOT NULL)) AND
                                    ((TLRRD.TP_CODDEP<>'''' AND TLRRD.TP_CODDEP IS NOT NULL)) AND
                                    TLRRD.TP_CodDep=TM.CodDeposito ' + @WhereTabLotti + '
                                GROUP BY 
                                    TLRRD.CODART,   
                                    TLRRD.CODFOR,
                                    TLRRD.TP_CODDEP
                            ) TLRRD,
                            TP_EXTRAMAG TXMAG
                        WHERE
                            TXMAG.CODART=TLRRD.CODART AND 
                            TXMAG.CONSIDACQ=1 ' + @WhereExtramag + '
                        GROUP BY 
                            TLRRD.CODART,   
                            TLRRD.CODFOR,
                            TLRRD.TP_CODDEP,
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO
                        ) TLRRD
                        INNER JOIN
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
                            ARTTIPOLOGIA=0
                            ' + @WhereArticoli + ') ANAGA
                        ON ANAGA.CODICE=TLRRD.CODART
                    ' + @WherePers + '
                    ) ARTICOLIFORNITORI 
                    GROUP BY 
                        CODART,
                        DESCARTICOLO'
    
    EXEC sp_executesql @SQLQuery /*, @ParamDefinition, @CODART, @CODFOR, @TP_CODDEP, @DESCARTICOLO, @GRUPPO, @CODCATEGORIASTAT, @CATEGORIA, @VARESPLICITE, @CODMARCHIO*/
    --PRINT @SQLQuery
    --PRINT @SQLLotto
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ARTICOLI_OFN_LBR] TO [Metodo98]
    AS [dbo];

