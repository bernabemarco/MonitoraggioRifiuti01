

CREATE FUNCTION [dbo].[Fun_Vendors_UltimoDocumento](@IdSessione Decimal(5,0),
                                                     @CodAgente Varchar(7))
RETURNS TABLE 
AS
RETURN 
(
    
    SELECT
        TOT_DOC1.CLIENTE,
        TOT_DOC1.IDTESTA,
        ROW_NUMBER() OVER (PARTITION BY TOT_DOC1.IDTESTA ORDER BY TOT_DOC1.IDTESTA DESC) AS IDRIGA,
        TOT_DOC1.TIPODOC,
        TOT_DOC1.ESERCIZIO,
        TOT_DOC1.DATADOC,
        TOT_DOC1.NUMERODOC,
        TOT_DOC1.CODART,
        TOT_DOC1.DESCRIZIONEART,
        TOT_DOC1.QTAGEST,
        TOT_DOC1.UMGEST,
        TOT_DOC1.QTAPREZZO,
        TOT_DOC1.UMPREZZO,
        TOT_DOC1.ANNOTAZIONI,
        FP.Price AS PREZZOUNITLORDOEURO,
        FP.DiscountEX AS SCONTIESTESI,
        dbo.FunPrezzoNetto(FP.Price,CAST(FP.DiscountEX AS Varchar(250))) AS PREZZOUNITNETTOEURO,
        TOT_DOC1.ComposizioneEstemporaneo
    FROM
    (
        SELECT
            TD.CODCLIFOR AS CLIENTE,
            RD.IDTESTA,
            ROW_NUMBER() OVER (PARTITION BY RD.IDTESTA,RD.CODART ORDER BY RD.IDTESTA,RD.CODART DESC) AS IDRIGA, 
            TD.TIPODOC,
            TD.ESERCIZIO,
            TD.DATADOC,
            TD.NUMERODOC,
            TD.CODPAGAMENTO,
            RD.CODART,
            RD.DESCRIZIONEART,
            RD.NUMLISTINO,
            SUM(RD.QTAGEST) AS QTAGEST,
            RD.UMGEST,
            SUM(RD.QTAPREZZO) AS QTAPREZZO,
            RD.UMPREZZO,
            '' AS ANNOTAZIONI,
            '' AS ComposizioneEstemporaneo 
        FROM  
            (    
                SELECT 
                    ROW_NUMBER() OVER (PARTITION BY TD.TIPODOC,TD.CODCLIFOR ORDER BY TD.DATADOC DESC) AS ID_DOC,
                    PROGRESSIVO,
                    TIPODOC,
                    TD.ESERCIZIO,
                    DATADOC,
                    NUMERODOC,
                    CODCLIFOR,
                    CODPAGAMENTO,
                    NUMDESTDIVERSAMERCI    
                FROM 
                    TESTEDOCUMENTI TD,
                    (SELECT DISTINCT CODICEDOC FROM TP_DOCTRASFAG WHERE TIPO = 'R') DAG,
                    ANAGRAFICARISERVATICF ARC    
                WHERE 
                    DAG.CODICEDOC = TD.TIPODOC AND 
                    TD.CODCLIFOR IN(SELECT DISTINCT CODCONTO FROM TP_CLIENTIEXPORT WHERE MODCHIAVE = @IdSessione) AND ((TD.CODAGENTE1=@CodAgente OR TD.CODAGENTE2=@CodAgente OR TD.CODAGENTE3=@CodAgente)) AND 
                    TD.CODCLIFOR = ARC.CODCONTO AND 
                    ARC.ESERCIZIO = YEAR(GETDATE()) AND 
                    ARC.USAPRZCOMMERCIALI = 0 
            ) TD 
        INNER JOIN RIGHEDOCUMENTI RD 
            ON RD.IDTESTA = TD.PROGRESSIVO AND RD.TIPORIGA IN ('N','O') 
        LEFT JOIN TP_EXTRARIGHEDOC TE 
            ON TE.IDTESTA = RD.IDTESTA AND TE.IDRIGA = RD.IDRIGA 
        WHERE 
            TD.ID_DOC = 1
        GROUP BY
            TD.CODCLIFOR,
            RD.IDTESTA,
            TD.TIPODOC,
            TD.ESERCIZIO,
            TD.DATADOC,
            TD.NUMERODOC,
            TD.CODPAGAMENTO,
            RD.CODART,
            RD.DESCRIZIONEART,
            RD.NUMLISTINO,
            RD.UMGEST,
            RD.UMPREZZO
    ) TOT_DOC1
    CROSS APPLY (SELECT * FROM [price].[GetSpecialPrice_Discount] (TOT_DOC1.CLIENTE,TOT_DOC1.CODART,TOT_DOC1.QTAPREZZO,GETDATE(),YEAR(GETDATE()),TOT_DOC1.NUMLISTINO,TOT_DOC1.UMPREZZO,TOT_DOC1.CODPAGAMENTO,0,'',0,'')) FP 
    -- Versione 9 -- CROSS APPLY (SELECT * FROM [price].[GetSpecialPrice_Discount] (TOT_DOC1.CLIENTE,TOT_DOC1.CODART,TOT_DOC1.QTAPREZZO,GETDATE(),YEAR(GETDATE()),TOT_DOC1.NUMLISTINO,TOT_DOC1.UMPREZZO,TOT_DOC1.CODPAGAMENTO,'','')) FP 

    WHERE
        TOT_DOC1.IDRIGA = 1
    UNION
    SELECT
        TOT_DOC2.CLIENTE,
        TOT_DOC2.IDTESTA,
        ROW_NUMBER() OVER (PARTITION BY TOT_DOC2.IDTESTA ORDER BY TOT_DOC2.IDTESTA) AS IDRIGA,
        TOT_DOC2.TIPODOC,
        TOT_DOC2.ESERCIZIO,
        TOT_DOC2.DATADOC,
        TOT_DOC2.NUMERODOC,
        TOT_DOC2.CODART,
        TOT_DOC2.DESCRIZIONEART,
        TOT_DOC2.QTAGEST,
        TOT_DOC2.UMGEST,
        TOT_DOC2.QTAPREZZO,
        TOT_DOC2.UMPREZZO,
        TOT_DOC2.ANNOTAZIONI,
        FP.Price AS PREZZOUNITLORDOEURO,
        '' AS SCONTIESTESI,
        dbo.FunPrezzoNetto(FP.Price,FP.Discount) AS PREZZOUNITNETTOEURO,
        TOT_DOC2.ComposizioneEstemporaneo
    FROM
    (
        SELECT
            TD.CODCLIFOR AS CLIENTE,
            RD.IDTESTA,
            ROW_NUMBER() OVER (PARTITION BY RD.IDTESTA,RD.CODART ORDER BY RD.IDTESTA,RD.CODART DESC) AS IDRIGA, 
            TD.TIPODOC,
            TD.ESERCIZIO,
            TD.DATADOC,
            TD.NUMERODOC,
            TD.CODPAGAMENTO,
            TD.NUMDESTDIVERSAMERCI,
            RD.CODART,
            RD.DESCRIZIONEART,
            RD.NUMLISTINO,
            SUM(RD.QTAGEST) AS QTAGEST,
            RD.UMGEST,
            SUM(RD.QTAPREZZO) AS QTAPREZZO,
            RD.UMPREZZO,
            '' AS ANNOTAZIONI,
            '' AS ComposizioneEstemporaneo 
        FROM  
            (    
                SELECT 
                    ROW_NUMBER() OVER (PARTITION BY TD.TIPODOC,TD.CODCLIFOR ORDER BY TD.DATADOC DESC) AS ID_DOC,
                    PROGRESSIVO,
                    TIPODOC,
                    TD.ESERCIZIO,
                    DATADOC,
                    NUMERODOC,
                    CODCLIFOR,
                    CODPAGAMENTO,
                    NUMDESTDIVERSAMERCI    
                FROM 
                    TESTEDOCUMENTI TD,
                    (SELECT DISTINCT CODICEDOC FROM TP_DOCTRASFAG WHERE TIPO = 'R') DAG,
                    ANAGRAFICARISERVATICF ARC    
                WHERE 
                    DAG.CODICEDOC = TD.TIPODOC AND 
                    TD.CODCLIFOR IN(SELECT DISTINCT CODCONTO FROM TP_CLIENTIEXPORT WHERE MODCHIAVE = @IdSessione) AND ((TD.CODAGENTE1=@CodAgente OR TD.CODAGENTE2=@CodAgente OR TD.CODAGENTE3=@CodAgente)) AND 
                    TD.CODCLIFOR = ARC.CODCONTO AND 
                    ARC.ESERCIZIO = YEAR(GETDATE()) AND 
                    ARC.USAPRZCOMMERCIALI = 1 
            ) TD 
        INNER JOIN RIGHEDOCUMENTI RD 
            ON RD.IDTESTA = TD.PROGRESSIVO AND RD.TIPORIGA IN ('N','O') 
        LEFT JOIN TP_EXTRARIGHEDOC TE 
            ON TE.IDTESTA = RD.IDTESTA AND TE.IDRIGA = RD.IDRIGA 
        WHERE 
            TD.ID_DOC = 1
        GROUP BY
            TD.CODCLIFOR,
            RD.IDTESTA,
            TD.TIPODOC,
            TD.ESERCIZIO,
            TD.DATADOC,
            TD.NUMERODOC,
            TD.CODPAGAMENTO,
            TD.NUMDESTDIVERSAMERCI,
            RD.CODART,
            RD.DESCRIZIONEART,
            RD.NUMLISTINO,
            RD.UMGEST,
            RD.UMPREZZO
    ) TOT_DOC2
    CROSS APPLY (SELECT * FROM [price].[GetSpecialPrice_Discount_Extensive_Sintetic] (TOT_DOC2.CLIENTE,TOT_DOC2.NUMDESTDIVERSAMERCI,TOT_DOC2.CODART,TOT_DOC2.QTAPREZZO,TOT_DOC2.DATADOC,TOT_DOC2.ESERCIZIO,TOT_DOC2.NUMLISTINO,TOT_DOC2.UMPREZZO)) FP 
    WHERE
        TOT_DOC2.IDRIGA = 1

)


GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_Vendors_UltimoDocumento] TO [Metodo98]
    AS [dbo];

