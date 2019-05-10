

CREATE PROCEDURE [dbo].[PROC_ARTICOLI_CONFRONTO](@IDSESSIONE DECIMAL(10,0),
                                                  @CODARTICOLORIF   nVARCHAR(50),
                                                   @DELETE SMALLINT,
                                                    @GRUPPO nVARCHAR(4000),
                                                     @CODCATEGORIASTAT nVARCHAR(4000),
                                                      @CATEGORIA nVARCHAR(4000),
                                                       @CODFAMIGLIAPOS nVARCHAR(4000),
                                                        @CODREPARTOPOS nVARCHAR(4000),
                                                         @GRUPPOPRZPART nVARCHAR(4000),
                                                          @LIVELLOMERC nVARCHAR(4000),
                                                           @CODARTICOLO nVARCHAR(4000),
                                                            @ALTERNATIVO nVARCHAR(4000)) 

AS

BEGIN

SET NOCOUNT ON

/*Parametri*/
DECLARE @Esercizio          DECIMAL(5,0)

/*Clausole Where*/
DECLARE @WhereArticolo      nVARCHAR(4000)
DECLARE @WhereArticoloComm  nVARCHAR(4000)
DECLARE @WhereTpExtramag    nVARCHAR(4000)
DECLARE @SQLQuery           nVARCHAR(4000)
    
    SET @SQLQuery = ''
    SET @WhereArticolo = ''
    SET @WhereArticoloComm = ''
    SET @WhereTpExtramag = ''

    SELECT @Esercizio = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME()

    IF (@DELETE = 1)
        BEGIN
            Set @SQLQuery = N'DELETE FROM TP_CONFRONTOARTICOLI_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10))

            EXEC sp_executesql @SQLQuery
        END

    If @CODARTICOLO Is Not Null 
        Set @WhereArticolo = @WhereArticolo + N' AND A.CODICE = ''' + @CODARTICOLO + ''''
    
    If @GRUPPO  Is Not Null 
        Set @WhereArticolo = @WhereArticolo + N' AND A.GRUPPO = ' + @GRUPPO

    If @CODCATEGORIASTAT Is Not Null 
        Set @WhereArticolo = @WhereArticolo + N' AND A.CODCATEGORIASTAT = ' + @CODCATEGORIASTAT
    
    If @CATEGORIA Is Not Null 
        Set @WhereArticolo = @WhereArticolo + N' AND A.CATEGORIA = ' + @CATEGORIA
    
    If @LIVELLOMERC Is Not Null 
        BEGIN
            Set @WhereArticolo = @WhereArticolo + N' AND A.CODICE IN(SELECT CODICE FROM TP_LIVELLIARTICOLI WHERE CODLIVELLOINTERNO = ''' + @LIVELLOMERC + ''')'
        END
    ELSE
        BEGIN
            SET @LIVELLOMERC = '0'
        END

    If @CODFAMIGLIAPOS Is Not Null 
        Set @WhereTpExtramag = @WhereTpExtramag + N' AND TE.CODFAMIGLIAPOS = ' + @CODFAMIGLIAPOS

    If @CODREPARTOPOS Is Not Null 
        Set @WhereTpExtramag = @WhereTpExtramag + N' AND TE.CODREPARTOPOS = ' + @CODREPARTOPOS
    
    If @GRUPPOPRZPART  Is Not Null 
        Set @WhereArticoloComm = @WhereArticoloComm + N' AND AC.GRUPPOPRZPART = ' + @GRUPPOPRZPART
    
    IF @ALTERNATIVO Is Null
        BEGIN
            SET @SQLQuery = N'INSERT INTO TP_CONFRONTOARTICOLI_TEMP([IdSessione],[Grafico],[CodArticolo],[Descrizione],[Gruppo],[Categoria],[CodCategoriaStat],[CodFamigliaPos],[CodRepartoPos],[GruppoPrzPart],[LivelloMerceologico],[Tipo],[UtenteModifica],[DataModifica])
                              SELECT
                                ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ',
                                0 AS GRAFICO,
                                A.CODICE AS ARTICOLO,
                                A.DESCRIZIONE,
                                ISNULL(A.GRUPPO,0),
                                ISNULL(A.CATEGORIA,0),
                                ISNULL(A.CODCATEGORIASTAT,0),
                                ISNULL(TE.CODFAMIGLIAPOS,0),
                                ISNULL(TE.CODREPARTOPOS,0),
                                ISNULL(AC.GRUPPOPRZPART,0),
                                ISNULL(''' + @LIVELLOMERC + ''','''') AS LIVELLOMERCEOLOGICO,
                                0 AS TIPO,
                                USER_NAME(),
                                GETDATE()
                              FROM
                                ANAGRAFICAARTICOLI A,
                                ANAGRAFICAARTICOLICOMM AC,
                                TP_EXTRAMAG TE
                              WHERE
                                A.ARTTIPOLOGIA = 0 AND
                                A.CODICE <> ''' + @CODARTICOLORIF + ''' ' + @WhereArticolo + ' AND
                                AC.CODICEART = A.CODICE AND
                                AC.ESERCIZIO = ' + CAST(@Esercizio AS nVARCHAR(5)) + ' ' + @WhereArticoloComm + ' AND
                                TE.CODART = A.CODICE ' + @WhereTpExtramag + ' AND
                                NOT EXISTS(SELECT CODARTICOLO FROM TP_CONFRONTOARTICOLI_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AND CODARTICOLO = A.CODICE)'
    
        END
    ELSE
        BEGIN           
            /*SOST ALTER*/  
            SET @SQLQuery = N'INSERT INTO TP_CONFRONTOARTICOLI_TEMP([IdSessione],[Grafico],[CodArticolo],[Descrizione],[Gruppo],[Categoria],[CodCategoriaStat],[CodFamigliaPos],[CodRepartoPos],[GruppoPrzPart],[LivelloMerceologico],[Tipo],[UtenteModifica],[DataModifica])
                              SELECT
                                ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ',
                                0 AS GRAFICO,
                                A.CODICE AS ARTICOLO,
                                A.DESCRIZIONE,
                                ISNULL(A.GRUPPO,0),
                                ISNULL(A.CATEGORIA,0),
                                ISNULL(A.CODCATEGORIASTAT,0),
                                ISNULL(TE.CODFAMIGLIAPOS,0),
                                ISNULL(TE.CODREPARTOPOS,0),
                                ISNULL(AC.GRUPPOPRZPART,0),
                                ISNULL(''' + @LIVELLOMERC + ''','''') AS LIVELLOMERCEOLOGICO,
                                0 AS TIPO,
                                USER_NAME(),
                                GETDATE()
                              FROM
                                ANAGRAFICAARTICOLI A,
                                ANAGRAFICAARTICOLICOMM AC,
                                (
                                    SELECT 
                                        SD.CODICE_SOST_ALTER 
                                    FROM 
                                        TP_SOST_ALTER_TESTE ST,
                                        TP_SOST_ALTER_DETT SD
                                    WHERE
                                        ST.CODICE = ''' + @ALTERNATIVO + ''' AND
                                        ST.CODICE = SD.CODICE AND
                                        ST.DATA_INI <= GETDATE() AND
                                        ST.DATA_FIN >= GETDATE()
                                ) SOSTALTER,
                                TP_EXTRAMAG TE
                            WHERE
                                A.ARTTIPOLOGIA = 0 AND
                                ((A.CODICE <> ''' + @CODARTICOLORIF + ''' AND A.CODICE = SOSTALTER.CODICE_SOST_ALTER)) AND
                                A.CODICE <> ''' + @CODARTICOLORIF + ''' ' + @WhereArticolo + ' AND
                                AC.CODICEART = A.CODICE AND
                                AC.ESERCIZIO = ' + CAST(@Esercizio AS nVARCHAR(5)) + ' ' + @WhereArticoloComm + ' AND
                                TE.CODART = A.CODICE ' + @WhereTpExtramag + ' AND
                                NOT EXISTS(SELECT CODARTICOLO FROM TP_CONFRONTOARTICOLI_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AND CODARTICOLO = A.CODICE)'
        END

    --PRINT @SQLQuery
    EXEC sp_executesql @SQLQuery 

    SET @SQLQuery = N'INSERT INTO TP_CONFRONTOARTICOLI_TEMP([IdSessione],[Grafico],[CodArticolo],[Descrizione],[Gruppo],[Categoria],[CodCategoriaStat],[CodFamigliaPos],[CodRepartoPos],[GruppoPrzPart],[LivelloMerceologico],[Tipo],[UtenteModifica],[DataModifica])
                      SELECT
                        ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ',
                        0 AS GRAFICO,
                        A.CODICE AS ARTICOLO,
                        A.DESCRIZIONE,
                        ISNULL(A.GRUPPO,0),
                        ISNULL(A.CATEGORIA,0),
                        ISNULL(A.CODCATEGORIASTAT,0),
                        ISNULL(TE.CODFAMIGLIAPOS,0),
                        ISNULL(TE.CODREPARTOPOS,0),
                        ISNULL(AC.GRUPPOPRZPART,0),
                        ISNULL(''' + @LIVELLOMERC + ''','''') AS LIVELLOMERCEOLOGICO,
                        1 AS TIPO,
                        USER_NAME(),
                        GETDATE()
                      FROM
                        ANAGRAFICAARTICOLI A,
                        ANAGRAFICAARTICOLICOMM AC,
                        TP_EXTRAMAG TE
                      WHERE
                        A.ARTTIPOLOGIA = 0 AND
                        A.CODICE = ''' + @CODARTICOLORIF + ''' AND
                        AC.CODICEART = A.CODICE AND
                        AC.ESERCIZIO = ' + CAST(@Esercizio AS nVARCHAR(5)) + ' AND
                        TE.CODART = A.CODICE AND 
                        NOT EXISTS(SELECT CODARTICOLO FROM TP_CONFRONTOARTICOLI_TEMP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AND CODARTICOLO = A.CODICE)'


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
    ON OBJECT::[dbo].[PROC_ARTICOLI_CONFRONTO] TO [Metodo98]
    AS [dbo];

