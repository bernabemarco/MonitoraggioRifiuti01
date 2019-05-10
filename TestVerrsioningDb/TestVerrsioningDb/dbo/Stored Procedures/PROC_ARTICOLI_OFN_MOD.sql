

CREATE PROCEDURE [dbo].[PROC_ARTICOLI_OFN_MOD](@IDSESSIONE DECIMAL(10,0),
                                                @PERS nVARCHAR(4000))

AS

BEGIN

SET NOCOUNT ON

DECLARE @SQLQuery           nVARCHAR(4000)
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
                             @BRAND nVARCHAR(4000)'*/

    
    SET @WherePers = ''

    If @PERS Is Not Null 
        BEGIN
            Set @WherePers = @WherePers + N' AND ' + @PERS
        END

    SET @SQLQuery = N'INSERT INTO TP_ARTICOLIORDINEFORNITORE_TEMP(IdSessione,CodArt,DescArticolo,QtaOrdinata,Previsione,Annulla,UtenteModifica,DataModifica)
                    SELECT
                        ' + CAST(@IDSESSIONE AS VARCHAR(10)) + ' AS IDSESSIONE,
                        CODART,
                        DESCARTICOLO,
                        SUM(QTAORDINATA) AS QTAORDINATA,
                        0 AS PREVISIONE,
                        0 AS ANNULLA,
                        USER_NAME() AS UTENTEMODIFICA,
                        GETDATE() AS DATAMODIFICA
                    FROM
                    (
                    SELECT  
                        TLRRD.CODART,
                        ANAGA.DESCARTICOLO,
                        TLRRD.QTAORDINATA,
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
                            RIGHEDOCUMENTI.CODART,
                            SUM(RIGHEDOCUMENTI.QTAGEST) AS QTAORDINATA,
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO
                        FROM
                            RIGHEDOCUMENTI,
                            TP_EXTRAMAG TXMAG
                        WHERE
                            TXMAG.CODART = RIGHEDOCUMENTI.CODART ' + @WherePers + '
                        GROUP BY 
                            RIGHEDOCUMENTI.CODART,  
                            TXMAG.CODFAMIGLIAPOS,
                            TXMAG.CODREPARTOPOS,
                            TXMAG.CODMARCHIO
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
                            ARTTIPOLOGIA = 0) ANAGA
                    WHERE
                        ANAGA.CODICE = TLRRD.CODART  
                    ) ARTICOLIFORNITORI 
                    GROUP BY 
                        CODART,
                        DESCARTICOLO'

    --select @SQLQuery as [processing-instruction(x)] FOR XML PATH 
    EXEC sp_executesql @SQLQuery /*, @ParamDefinition, @CODART, @CODFOR, @TP_CODDEP, @DESCARTICOLO, @GRUPPO, @CODCATEGORIASTAT, @CATEGORIA, @VARESPLICITE, @BRAND*/

    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_ARTICOLI_OFN_MOD] TO [Metodo98]
    AS [dbo];

