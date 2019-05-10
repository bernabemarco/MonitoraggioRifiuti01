

CREATE FUNCTION dbo.SST_IMG_GET_ANFO ( )
RETURNS @table TABLE
    (
      [AFFNCD] [VARCHAR](11) NOT NULL
                             PRIMARY KEY
    , [AFJMTX] [VARCHAR](40) NULL
    , [AFJNTX] [VARCHAR](30) NULL
    , [AFJOTX] [VARCHAR](30) NULL
    , [AFJPTX] [VARCHAR](25) NULL
    , [AFGICD] [VARCHAR](2) NULL
    , [AFJRTX] [VARCHAR](5) NULL
    , [AFJXTX] [VARCHAR](25) NULL
    , [AFJSTX] [VARCHAR](25) NULL
    , [AFJTTX] [VARCHAR](16) NULL
    , [AFJUTX] [VARCHAR](16) NULL
    , [AFEKST] [VARCHAR](1) NULL
    , [AFELST] [VARCHAR](1) NULL
    , [AFJVTX] [VARCHAR](40) NULL
    , [AFJWTX] [VARCHAR](30) NULL
    , [AFJYTX] [VARCHAR](2) NULL
    , [AFCDCE] [VARCHAR](12) NULL
    , [AFFOCD] [VARCHAR](3) NULL
    , [AFFPCD] [VARCHAR](3) NULL
    , [AFDPCD] [VARCHAR](5) NULL
    , [AFCICD] [VARCHAR](10) NULL
    , [AFJSNB] [VARCHAR](10) NULL
    , [AFJZTX] [VARCHAR](15) NULL
    , [AFIBAN] [VARCHAR](34) NULL
    , [AFBOCI] VARCHAR(11) NULL
    , [AFDWCD] [VARCHAR](10) NULL
    , [AFGRTX] [VARCHAR](2) NULL
    , [AFCACD] [VARCHAR](3) NULL
    , [AFCCAT] [VARCHAR](4) NULL
    , [AFOGCD] [VARCHAR](2) NULL
    , [AFYJSS] [VARCHAR](1) NULL
    , [AFFDTX] [VARCHAR](10) NULL
    , [AFAZDT] [DATETIME] NULL
    , [AFACTM] [DATETIME] NULL
    , MET_CODCONTO VARCHAR(7) NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( MET_CODCONTO
                , [AFFNCD] -- [VARCHAR](11) NOT NULL
                , [AFJMTX] -- [VARCHAR](40) NULL
                , [AFJNTX] -- [VARCHAR](30) NULL
                , [AFJOTX] -- [VARCHAR](30) NULL
                , [AFJPTX] -- [VARCHAR](25) NULL
                , [AFGICD] -- [VARCHAR](2) NULL
                , [AFJRTX] -- [VARCHAR](5) NULL
                , [AFJXTX] -- [VARCHAR](25) NULL
                , [AFJSTX] -- [VARCHAR](25) NULL
                , [AFJTTX] -- [VARCHAR](16) NULL
                , [AFJUTX] -- [VARCHAR](16) NULL
                , [AFEKST] -- [VARCHAR](1) NULL
                , [AFELST] -- [VARCHAR](1) NULL
                , [AFJVTX] -- [VARCHAR](40) NULL
                , [AFJWTX] -- [VARCHAR](30) NULL
                , [AFJYTX] -- [VARCHAR](2) NULL
                , [AFCDCE] -- [VARCHAR](12) NULL
                , [AFFOCD] -- [VARCHAR](3) NULL
                , [AFFPCD] -- [VARCHAR](3) NULL
                , [AFDPCD] -- [VARCHAR](5) NULL
                , [AFCICD] -- [VARCHAR](10) NULL
                , [AFJSNB] -- [VARCHAR](10) NULL
                , [AFJZTX] -- [VARCHAR](15) NULL
                , [AFIBAN] -- [VARCHAR](34) NULL
                , [AFBOCI] -- VARCHAR(11) NULL
                , [AFDWCD] -- [VARCHAR](10) NULL
                , [AFGRTX] -- [VARCHAR](2) NULL
                , [AFCACD] -- [VARCHAR](3) NULL
                , [AFCCAT] -- [VARCHAR](4) NULL
                , [AFOGCD] -- [VARCHAR](2) NULL
                , [AFYJSS] -- [VARCHAR](1) NULL
                , [AFFDTX] -- [VARCHAR](10) NULL
                , [AFAZDT] -- [DATETIME] NULL
                , [AFACTM] -- [DATETIME] NULL
                )
                SELECT  A.CODCONTO
                      , REPLACE(A.CODCONTO, ' ', '') AS AFFNCD
                      , LEFT(A.DSCCONTO1, 40) AS AFJMTX
                      , LEFT(A.INDIRIZZO, 30) AS AFJNTX
                      , '' AS AFJOTX
                      , LEFT(A.LOCALITA, 25) AS AFJPTX
                      , LEFT(A.PROVINCIA, 2) AS AFGICD
                      , LEFT(A.CAP, 5) AS AFJRTX
                      , REPLACE(A.CODCONTO, ' ', '') AS AFJXTX
                      , '' AS AFJSTX
                      , '' AS AFJTTX
                      , LEFT(A.PARTITAIVA, 16) AS AFJUTX
                      , CASE TN.CODICEISO
                          WHEN 'IT' THEN 'I'
                          ELSE 'E'
                        END AS AFEKST
                      , '' AS AFELST
                      , '' AS AFJVTX
                      , '' AS AFJWTX
                      , ISNULL(BC.CIN, '') AS AFJYTX
                      , REPLACE(A.CODCONTO, ' ', '') AS AFCDCE
                      , ISNULL(TN.CODICEISO, '') AS AFFOCD
                      , '' AS AFFPCD
                      , '' AS AFDPCD
                      , RIGHT(ISNULL(BC.ABI, ''), 5) AS AFCICD
                      , ISNULL(BC.CAB, '') AS AFJSNB
                      , ISNULL(BC.CONTOCORRENTE, '') AS AFJZTX
                      , ISNULL(BC.CODICEIBAN, '') AS AFIBAN
                      , ISNULL(BC.CODICEBIC, '') AS AFBOCI
                      , '' AS AFDWCD
                      , @codiceAzienda AS AFGRTX
                      , '' AS AFCACD
                      , ISNULL(RIS.CODCATEGORIA, 0) AS AFCCAT
                      , '' AS AFOGCD
                      , 'N' AS AFYJSS
                      , LEFT(ISNULL(A.UTENTEMODIFICA, ''), 10) AS AFFDTX
                      , A.DATAMODIFICA AS AFAZDT
                      , A.DATAMODIFICA AS AFACTM
                FROM    dbo.ANAGRAFICACF AS A
                        INNER JOIN dbo.ANAGRAFICARISERVATICF AS RIS ON A.CODCONTO = RIS.CODCONTO
                                                              AND RIS.ESERCIZIO = ( SELECT
                                                              MAX(CODICE)
                                                              FROM
                                                              dbo.TABESERCIZI
                                                              )
                        LEFT OUTER JOIN dbo.BANCAAPPCF AS BC ON A.CODCONTO = BC.CODCONTO
                                                              AND RIS.BANCAANAGR = BC.CODICE
                        LEFT OUTER JOIN dbo.TABNAZIONI AS TN ON A.CODNAZIONE = TN.CODICE
                WHERE   A.TIPOCONTO = 'F'
        
        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_ANFO] TO [Metodo98]
    AS [dbo];

