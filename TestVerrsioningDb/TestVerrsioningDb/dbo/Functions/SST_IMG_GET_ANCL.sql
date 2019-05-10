

CREATE FUNCTION dbo.SST_IMG_GET_ANCL ( )
RETURNS @table TABLE
    (
      [FACMCD] [VARCHAR](11) NOT NULL
                             PRIMARY KEY
    , [FAKCTX] [VARCHAR](40) NULL
    , [FAKETX] [VARCHAR](30) NULL
    , [FAKDTX] [VARCHAR](25) NULL
    , [FADRTX] [VARCHAR](5) NULL
    , [FAGGCD] [VARCHAR](2) NULL
    , [FAALST] [VARCHAR](1) NULL
    , [FADTTX] [VARCHAR](16) NULL
    , [FAASDT] [DATETIME] NULL
    , [FABLNB] [DECIMAL](13, 2) NULL
    , [FAANST] [VARCHAR](1) NULL
    , [FAEOST] [VARCHAR](1) NULL
    , [FAAPST] [VARCHAR](1) NULL
    , [FAEQTX] [VARCHAR](12) NULL
    , [FAAYDT] [DATETIME] NULL
    , [FAERTX] [VARCHAR](16) NULL
    , [FAJJTX] [VARCHAR](16) NULL
    , [FAASST] [VARCHAR](1) NULL
    , [FAAUST] [VARCHAR](1) NULL
    , [FAGXTX] [VARCHAR](2) NULL
    , [FAGYTX] [VARCHAR](10) NULL
    , [FAJKTX] [VARCHAR](25) NULL
    , [FAC0TX] [VARCHAR](5) NULL
    , [FAEDST] [VARCHAR](1) NULL
    , [FACGCE] [VARCHAR](12) NULL
    , [FACFCD] [VARCHAR](3) NULL
    , [FACGCD] [VARCHAR](3) NULL
    , [FACHCD] [VARCHAR](4) NULL
    , [FACICD] [VARCHAR](10) NULL
    , [FAJSNB] [VARCHAR](10) NULL
    , [FATRTX] [VARCHAR](15) NULL
    , [FAIBAN] [VARCHAR](34) NULL
    , [FAFMCD] [VARCHAR](3) NULL
    , [FAASCD] [VARCHAR](3) NULL
    , [FADWCD] [VARCHAR](10) NULL
    , [FAGRTX] [VARCHAR](2) NULL
    , [FADECD] [VARCHAR](11) NULL
    , [FACACD] [VARCHAR](3) NULL
    , [FABJCE] [VARCHAR](3) NULL
    , [FAFDTX] [VARCHAR](10) NULL
    , [FAAZDT] [DATETIME] NULL
    , [FAACTM] [DATETIME] NULL
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
                , FACMCD
                , FAKCTX
                , FAKETX
                , FAKDTX
                , FADRTX
                , FAGGCD
                , FAALST
                , FADTTX
                , FAASDT
                , FABLNB
                , FAANST
                , FAEOST
                , FAAPST
                , FAEQTX
                , FAAYDT
                , FAERTX
                , FAJJTX
                , FAASST
                , FAAUST
                , FAGXTX
                , FAGYTX
                , FAJKTX
                , FAC0TX
                , FAEDST
                , FACGCE
                , FACFCD
                , FACGCD
                , FACHCD
                , FACICD
                , FAJSNB
                , FATRTX
                , FAIBAN
                , FAFMCD
                , FAASCD
                , FADWCD
                , FAGRTX
                , FADECD
                , FACACD
                , FABJCE
                , FAFDTX
                , FAAZDT
                , FAACTM
                )
                SELECT  A.CODCONTO
                      , REPLACE(A.CODCONTO, ' ', '') AS FACMCD
                      , LEFT(A.DSCCONTO1, 40) AS FAKCTX
                      , LEFT(A.INDIRIZZO, 30) AS FAKETX
                      , LEFT(A.LOCALITA, 25) AS FAKDTX
                      , LEFT(A.CAP, 5) AS FADRTX
                      , LEFT(A.PROVINCIA, 2) AS FAGGCD
                      , '' AS FAALST
                      , '' AS FADTTX
                      , CONVERT(DATETIME, '18991230') AS FAASDT
                      , RIS.FIDOEURO AS FABLNB
                      , 'N' AS FAANST
                      , CASE TN.CODICEISO
                          WHEN 'IT' THEN 'I'
                          ELSE 'E'
                        END AS FAEOST
                      , CASE RIS.STATOCONTABILITA
                          WHEN 2 THEN 'S'
                          ELSE 'N'
                        END AS FAAPST
                      , '' AS FAEQTX
                      , CONVERT(DATETIME, '18991230') AS FAAYDT
                      , LEFT(A.PARTITAIVA, 16) AS FAERTX
                      , LEFT(A.CODFISCALE, 16) AS FAJJTX
                      , 'N' AS FAASST
                      , '' AS FAAUST
                      , '' AS FAGXTX
                      , '' AS FAGYTX
                      , LEFT(A.DSCCONTO1, 25) AS FAJKTX
                      , '' AS FAC0TX
                      , '' AS FAEDST
                      , REPLACE(A.CODCONTO, ' ', '') AS FACGCE
                      , '' AS FACFCD
                      , '' AS FACGCD
                      , RIGHT('0000'+ISNULL(cast(RIS.CODCATEGORIA as varchar), ''),4) AS FACHCD
                      , RIGHT(ISNULL(BC.ABI, ''), 5) AS FACICD
                      , ISNULL(BC.CAB, '') AS FAJSNB
                      , ISNULL(BC.CONTOCORRENTE, '') AS FATRTX
                      , ISNULL(BC.CODICEIBAN, '') AS FAIBAN
                      , ISNULL(TN.CODICEISO, '') AS FAFMCD
                      , '' AS FAASCD
                      , '' AS FADWCD
                      , @codiceAzienda AS FAGRTX
                      , '' AS FADECD
                      , '' AS FACACD
                      , '' AS FABJCE
                      , LEFT(ISNULL(A.UTENTEMODIFICA, ''), 10) AS FAFDTX
                      , A.DATAMODIFICA
                      , A.DATAMODIFICA
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
                WHERE   A.TIPOCONTO = 'C'
        
        RETURN 
    END


GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_ANCL] TO [Metodo98]
    AS [dbo];

