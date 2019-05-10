

CREATE FUNCTION dbo.SST_IMG_GET_SCFO ( )
RETURNS @table TABLE
    (
      [T8SGNB] [INT] NOT NULL
                     PRIMARY KEY
    , [T8CTDT] [DATETIME] NULL
    , [T8CUDT] [DATETIME] NULL
    , [T8K4DT] [DATETIME] NULL
    , [T8I1ST] [VARCHAR](1) NULL
    , [T8I2ST] [VARCHAR](1) NULL
    , [T8KKCD] [VARCHAR](11) NULL
    , [T8DWCD] [VARCHAR](10) NULL
    , [T8CBVA] [DECIMAL](13, 2) NULL
    , [T8SHNB] [DECIMAL](13, 2) NULL
    , [T8FBAS] [DECIMAL](13, 2) NULL
    , [T8FDIV] [DECIMAL](13, 2) NULL
    , [T8CAMB] [DECIMAL](12, 6) NULL
    , [T8SICD] [VARCHAR](12) NULL
    , [T8VASC] [DECIMAL](12, 0) NULL
    , [T8VAPA] [DECIMAL](13, 2) NULL
    , [T8VADP] [DECIMAL](13, 2) NULL
    , [T8CVDT] [DATETIME] NULL
    , [T8DZVB] [DECIMAL](13, 2) NULL
    , [T8D0VB] [DECIMAL](13, 2) NULL
    , [T8JHST] [VARCHAR](1) NULL
    , [T8JIST] [VARCHAR](1) NULL
    , [T8B5SS] [VARCHAR](1) NULL
    , [T8DCYR] [INT] NULL
    , [T8DCPX] [VARCHAR](2) NULL
    , [T8DCSQ] [INT] NULL
    , [T8RATE] [INT] NULL
    , [T8OGCD] [VARCHAR](2) NULL
    , [T8CACD] [VARCHAR](3) NULL
    , [T8SPCD] [VARCHAR](3) NULL
    , [T8DPCD] [VARCHAR](5) NULL
    , [T8ASCD] [VARCHAR](3) NULL
    , [T8GRTX] [VARCHAR](2) NULL
    , [T8FNCD] [VARCHAR](11) NULL
    , [T8CCAT] [VARCHAR](4) NULL
    , [T8OKNR] [INT] NULL
    , [T8OLNR] [INT] NULL
    , [T8OMNR] [VARCHAR](10) NULL
    , [T8OONR] [VARCHAR](10) NULL
    , [T8I6TX] [VARCHAR](15) NULL
    , [T8IBAN] [VARCHAR](34) NULL
    , [T8I7TX] [VARCHAR](40) NULL
    , [T8B4SU] [VARCHAR](1) NULL
    , [T8BHNM] [INT] NULL
    , [T8FDTX] [VARCHAR](10) NULL
    , [T8AZDT] [DATETIME] NULL
    , [T8ACTM] [DATETIME] NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( [T8SGNB] -- [INT] NOT NULL PRIMARY KEY ,
                , [T8CTDT] -- [DATETIME] NULL ,
                , [T8CUDT] -- [DATETIME] NULL ,
                , [T8K4DT] -- [DATETIME] NULL ,
                , [T8I1ST] -- [VARCHAR](1) NULL ,
                , [T8I2ST] -- [VARCHAR](1) NULL ,
                , [T8KKCD] -- [VARCHAR](11) NULL ,
                , [T8DWCD] -- [VARCHAR](10) NULL ,
                , [T8CBVA] -- [DECIMAL](13, 2) NULL ,
                , [T8SHNB] -- [DECIMAL](13, 2) NULL ,
                , [T8FBAS] -- [DECIMAL](13, 2) NULL ,
                , [T8FDIV] -- [DECIMAL](13, 2) NULL ,
                , [T8CAMB] -- [DECIMAL](12, 6) NULL ,
                , [T8SICD] -- [VARCHAR](12) NULL ,
                , [T8VASC] -- [DECIMAL](12, 0) NULL ,
                , [T8VAPA] -- [DECIMAL](13, 2) NULL ,
                , [T8VADP] -- [DECIMAL](13, 2) NULL ,
                , [T8CVDT] -- [DATETIME] NULL ,
                , [T8DZVB] -- [DECIMAL](13, 2) NULL ,
                , [T8D0VB] -- [DECIMAL](13, 2) NULL ,
                , [T8JHST] -- [VARCHAR](1) NULL ,
                , [T8JIST] -- [VARCHAR](1) NULL ,
                , [T8B5SS] -- [VARCHAR](1) NULL ,
                , [T8DCYR] -- [INT] NULL ,
                , [T8DCPX] -- [VARCHAR](2) NULL ,
                , [T8DCSQ] -- [INT] NULL ,
                , [T8RATE] -- [INT] NULL ,
                , [T8OGCD] -- [VARCHAR](2) NULL ,
                , [T8CACD] -- [VARCHAR](3) NULL ,
                , [T8SPCD] -- [VARCHAR](3) NULL ,
                , [T8DPCD] -- [VARCHAR](5) NULL ,
                , [T8ASCD] -- [VARCHAR](3) NULL ,
                , [T8GRTX] -- [VARCHAR](2) NULL ,
                , [T8FNCD] -- [VARCHAR](11) NULL ,
                , [T8CCAT] -- [VARCHAR](4) NULL ,
                , [T8OKNR] -- [INT] NULL ,
                , [T8OLNR] -- [INT] NULL ,
                , [T8OMNR] -- [VARCHAR](10) NULL ,
                , [T8OONR] -- [VARCHAR](10) NULL ,
                , [T8I6TX] -- [VARCHAR](15) NULL ,
                , [T8IBAN] -- [VARCHAR](34) NULL ,
                , [T8I7TX] -- [VARCHAR](40) NULL ,
                , [T8B4SU] -- [VARCHAR](1) NULL ,
                , [T8BHNM] -- [INT] NULL ,
                , [T8FDTX] -- [VARCHAR](10) NULL ,
                , [T8AZDT] -- [DATETIME] NULL ,
                , [T8ACTM] -- [DATETIME] NULL
                )
                SELECT  SC.PROGRESSIVO AS [T8SGNB]
                      , SC.DATASCADENZA AS [T8CTDT]
                      , SC.DATAFATTURA AS [T8CUDT]
                      , CONVERT(DATETIME, '18991230') AS [T8K4DT]
                      , 'N' AS [T8I1ST]
                      , CASE WHEN TN.CODICEISO = 'IT' THEN 'I'
                             ELSE 'E'
                        END AS [T8I2ST]
                      , REPLACE(SC.CODCLIFOR, ' ', '') AS [T8KKCD]
                      , '' AS [T8DWCD]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCEURO AS [T8CBVA]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCVAL AS [T8SHNB]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCEURO AS [T8FBAS]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCVAL AS [T8FDIV]
                      , SC.VALCAMBIO AS [T8CAMB]
                      , LEFT(SC.NUMRIF, 12) AS [T8SICD]
                      , 0 AS [T8VASC]
                      , 0 AS [T8VAPA]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCEURO AS [T8VADP]
                      , SC.DATAFATTURA AS [T8CVDT]
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN -1
                               ELSE 1
                          END ) * SC.IMPORTOSCVAL AS [T8DZVB]
                      , 0 AS [T8D0VB]
                      , 'N' AS [T8JHST]
                      , 'D' AS [T8JIST]
                      , 'N' AS [T8B5SS]
                      , SC.ANNODOC AS [T8DCYR]
                      , ISNULL(SC.BIS, ' ') AS [T8DCPX]
                      , CONVERT(INT, LEFT(ISNULL(SC.NUMEROPROT, '0'), 8)) AS [T8DCSQ]
                      , SC.NUMSCAD AS [T8RATE]
                      , ISNULL(SIT.GOLD_MORE_M0OGCD, '') AS [T8OGCD]
                      , '' AS [T8CACD]
                      , '' AS [T8SPCD]
                      , ISNULL(AB.GOLD_BAIN_BIDPCD, '') AS [T8DPCD]
                      , ISNULL(TC.DIVISA, '') AS [T8ASCD]
                      , @codiceAzienda AS [T8GRTX]
                      , REPLACE(SC.CODCLIFOR, ' ', '') AS [T8FNCD]
                      , '' AS [T8CCAT]
                      , SC.ANNODOC AS [T8OKNR]
                      , 0 AS [T8OLNR]
                      , RIGHT(ISNULL(BCF.ABI, ''), 5) AS [T8OMNR] -- ABI Fornitore
                      , ISNULL(BCF.CAB, '') AS [T8OONR] -- CAB Fornitore 
                      , ISNULL(BCF.CONTOCORRENTE, '') AS [T8I6TX] -- CC Fornitore
                      , ISNULL(BCF.CODICEIBAN, '') AS [T8IBAN] -- IBAN Fornitore
                      , ISNULL(LEFT(SC.NOTE, 40), '') AS [T8I7TX]
                      , 'N' AS [T8B4SU]
                      , 0 AS [T8BHNM]
                      , LEFT(ISNULL(SC.UTENTEMODIFICA, ''), 10) AS [T8FDTX]
                      , SC.DATAMODIFICA AS [T8AZDT]
                      , SC.DATAMODIFICA AS [T8ACTM]
                FROM    dbo.TABSCADENZE AS SC
                        LEFT OUTER JOIN dbo.ANAGRAFICACF AS ACF ON SC.CODCLIFOR = ACF.CODCONTO
                        LEFT OUTER JOIN dbo.TABCAMBI AS TC ON SC.CODCAMBIO = TC.CODICE
                        LEFT OUTER JOIN dbo.BANCAAPPCF AS BCF ON SC.CODCLIFOR = BCF.CODCONTO
                                                              AND SC.BANCAAPPOGGIO = BCF.CODICE
                        LEFT OUTER JOIN dbo.SST_IMG_TABTIPIEFFETTI AS SIT ON SC.TIPOEFFETTO = SIT.TipoEffetto
                        LEFT OUTER JOIN dbo.ANAGRAFICABANCHE AS AB ON SC.BANCAINC = AB.CODBANCA
                        LEFT OUTER JOIN dbo.TABNAZIONI AS TN ON ACF.CODNAZIONE = TN.CODICE
                WHERE   SC.CODCLIFOR LIKE 'F%'
                        AND SC.ESITO IN ( 0 )
        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_SCFO] TO [Metodo98]
    AS [dbo];

