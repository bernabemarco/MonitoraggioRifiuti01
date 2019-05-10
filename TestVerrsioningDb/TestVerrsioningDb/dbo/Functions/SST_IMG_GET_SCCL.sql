

CREATE FUNCTION dbo.SST_IMG_GET_SCCL ( )
RETURNS @table TABLE
    (
      [SAEVNR] [INT] NOT NULL
                     PRIMARY KEY
    , [SAKPDT] [DATETIME] NULL
    , [SAASCD] [VARCHAR](3) NULL
    , [SACEVB] [DECIMAL](13, 2) NULL
    , [SAOUPR] [DECIMAL](12, 6) NULL
    , [SAOOPR] [DECIMAL](13, 2) NULL
    , [SANNVB] [DECIMAL](13, 2) NULL
    , [SAE2NR] [INT] NULL
    , [SAOPPR] [DECIMAL](13, 2) NULL
    , [SAOSPR] [DECIMAL](13, 2) NULL
    , [SADQSS] [VARCHAR](1) NULL
    , [SABKCE] [VARCHAR](2) NULL
    , [SAEWNR] [INT] NULL
    , [SABLCE] [VARCHAR](10) NULL
    , [SANMNR] [INT] NULL
    , [SAKQDT] [DATETIME] NULL
    , [SACFVB] [DECIMAL](13, 2) NULL
    , [SACTTX] [VARCHAR](30) NULL
    , [SACUTX] [VARCHAR](25) NULL
    , [SACVTX] [VARCHAR](30) NULL
    , [SADPCD] [VARCHAR](5) NULL
    , [SAKRDT] [DATETIME] NULL
    , [SADRSS] [VARCHAR](1) NULL
    , [SAOQPR] [DECIMAL](13, 2) NULL
    , [SAORPR] [INT] NULL
    , [SAKSDT] [DATETIME] NULL
    , [SAKTDT] [DATETIME] NULL
    , [SADUSS] [VARCHAR](3) NULL
    , [SADBSS] [VARCHAR](5) NULL
    , [SADWCD] [VARCHAR](10) NULL
    , [SAGRTX] [VARCHAR](2) NULL
    , [SABJCE] [VARCHAR](3) NULL
    , [SADECD] [VARCHAR](11) NULL
    , [SACACD] [VARCHAR](3) NULL
    , [SACMCD] [VARCHAR](11) NULL
    , [SACICD] [VARCHAR](10) NULL
    , [SAJSNB] [VARCHAR](10) NULL
    , [SABQCE] [VARCHAR](5) NULL
    , [SAEJSS] [VARCHAR](1) NULL
    , [SAKYDT] [DATETIME] NULL
    , [SABWCE] [VARCHAR](5) NULL
    , [SAFFNR] [INT] NULL
    , [SABVCE] [VARCHAR](5) NULL
    , [SAFGNR] [INT] NULL
    , [SAFINR] [INT] NULL
    , [SAGGCE] [VARCHAR](11) NULL
    , [SANNNR] [INT] NULL
    , [SANONR] [INT] NULL
    , [SAO7SS] [VARCHAR](1) NULL
    , [SAO8SS] [VARCHAR](1) NULL
    , [SAIBAN] [VARCHAR](34) NULL
    , [SAYRNB] [INT] NULL
    , [SAFDTX] [VARCHAR](10) NULL
    , [SAAZDT] [DATETIME] NULL
    , [SAACTM] [DATETIME] NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( [SAEVNR] -- [INT] NOT NULLPRIMARY KEY
                , [SAKPDT] -- [DATETIME] NULL
                , [SAASCD] -- [VARCHAR](3) NULL
                , [SACEVB] -- [DECIMAL](13, 2) NULL
                , [SAOUPR] -- [DECIMAL](12, 6) NULL
                , [SAOOPR] -- [DECIMAL](13, 2) NULL
                , [SANNVB] -- [DECIMAL](13, 2) NULL
                , [SAE2NR] -- [INT] NULL
                , [SAOPPR] -- [DECIMAL](13, 2) NULL
                , [SAOSPR] -- [DECIMAL](13, 2) NULL
                , [SADQSS] -- [VARCHAR](1) NULL
                , [SABKCE] -- [VARCHAR](2) NULL
                , [SAEWNR] -- [INT] NULL
                , [SABLCE] -- [VARCHAR](10) NULL
                , [SANMNR] -- [INT] NULL
                , [SAKQDT] -- [DATETIME] NULL
                , [SACFVB] -- [DECIMAL](13, 2) NULL
                , [SACTTX] -- [VARCHAR](30) NULL
                , [SACUTX] -- [VARCHAR](25) NULL
                , [SACVTX] -- [VARCHAR](30) NULL
                , [SADPCD] -- [VARCHAR](5) NULL
                , [SAKRDT] -- [DATETIME] NULL
                , [SADRSS] -- [VARCHAR](1) NULL
                , [SAOQPR] -- [DECIMAL](13, 2) NULL
                , [SAORPR] -- [INT] NULL
                , [SAKSDT] -- [DATETIME] NULL
                , [SAKTDT] -- [DATETIME] NULL
                , [SADUSS] -- [VARCHAR](3) NULL
                , [SADBSS] -- [VARCHAR](5) NULL
                , [SADWCD] -- [VARCHAR](10) NULL
                , [SAGRTX] -- [VARCHAR](2) NULL
                , [SABJCE] -- [VARCHAR](3) NULL
                , [SADECD] -- [VARCHAR](11) NULL
                , [SACACD] -- [VARCHAR](3) NULL
                , [SACMCD] -- [VARCHAR](11) NULL
                , [SACICD] -- [VARCHAR](10) NULL
                , [SAJSNB] -- [VARCHAR](10) NULL
                , [SABQCE] -- [VARCHAR](5) NULL
                , [SAEJSS] -- [VARCHAR](1) NULL
                , [SAKYDT] -- [DATETIME] NULL
                , [SABWCE] -- [VARCHAR](5) NULL
                , [SAFFNR] -- [INT] NULL
                , [SABVCE] -- [VARCHAR](5) NULL
                , [SAFGNR] -- [INT] NULL
                , [SAFINR] -- [INT] NULL
                , [SAGGCE] -- [VARCHAR](11) NULL
                , [SANNNR] -- [INT] NULL
                , [SANONR] -- [INT] NULL
                , [SAO7SS] -- [VARCHAR](1) NULL
                , [SAO8SS] -- [VARCHAR](1) NULL
                , [SAIBAN] -- [VARCHAR](34) NULL
                , [SAYRNB] -- [INT] NULL
                , [SAFDTX] -- [VARCHAR](10) NULL
                , [SAAZDT] -- [DATETIME] NULL
                , [SAACTM] -- [DATETIME] NULL
                )
                SELECT  SC.PROGRESSIVO AS SAEVNR
                      , SC.DATASCADENZA AS SAKPDT
                      , ISNULL(TC.DIVISA, '') AS SAASCD
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN 1
                               ELSE -1
                          END ) * SC.IMPORTOSCVAL AS SACEVB
                      , SC.VALCAMBIO AS SAOUPR
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN 1
                               ELSE -1
                          END ) * SC.IMPORTOSCEURO AS SAOOPR
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN 1
                               ELSE -1
                          END ) * SC.IMPORTOSCEURO AS SANNVB
                      , SC.NUMSCAD AS SAE2NR
                      , ( CASE WHEN SC.SCADATTPASS = 1 THEN 1
                               ELSE -1
                          END ) * ( SC.IMPORTOSCVAL - SC.IMPONIBSCVAL ) AS SAOPPR
                      , 0 AS SAOSPR
                      , CASE WHEN SC.SCADATTPASS = 1 THEN 'F'
                             ELSE 'N'
                        END AS SADQSS
                      , '' AS SABKCE
                      , SC.ANNODOC AS SAEWNR
                      , CONVERT(INT, LEFT(ISNULL(SC.NUMEROPROT, '0'), 8)) AS SABLCE
                      , CONVERT(INT, LEFT(ISNULL(SC.NUMEROPROT, '0'), 8)) AS SANMNR
                      , SC.DATAFATTURA AS SAKQDT
                      , SC.TOTFATTVAL AS SACFVB
                      , '' AS SACTTX
                      , '' AS SACUTX
                      , 'N' AS SACVTX -- TODO: Gestire la riemissione
                      , '' AS SADPCD -- Banca in cui vogliamo essere pagati
                      , CONVERT(DATETIME, '18991230') AS SAKRDT
                      , '' AS SADRSS
                      , 0 AS SAOQPR
                      , 0 AS SAORPR
                      , CONVERT(DATETIME, '18991230') AS SAKSDT
                      , CONVERT(DATETIME, '18991230') AS SAKTDT
                      , '' AS SADUSS
                      , 'DASC' AS SADBSS
                      , '' AS SADWCD
                      , @codiceAzienda AS SAGRTX
                      , ISNULL(SIT.GOLD_MORE_M0OGCD, '') AS SABJCE -- TODO: Da Tabella MOIN
                      , '' AS SADECD
                      , '' AS SACACD
                      , REPLACE(SC.CODCLIFOR, ' ', '') AS SACMCD
                      , RIGHT(ISNULL(BCF.ABI, ''), 5) AS SACICD -- TODO: Abi
                      , ISNULL(BCF.CAB, '') AS SAJSNB -- TODO: Cab
                      , '' AS SABQCE
                      , 'S' AS SAEJSS
                      , SC.DATASCADENZA AS SAKYDT
                      , '' AS SABWCE
                      , 0 AS SAFFNR
                      , '' AS SABVCE
                      , 0 AS SAFGNR
                      , 0 AS SAFINR
                      , '' AS SAGGCE
                      , SC.ESERCIZIO AS SANNNR
                      , ISNULL(SC.NUMDOC, 0) AS SANONR
                      , 'N' AS SAO7SS
                      , '' AS SAO8SS
                      , '' AS SAIBAN
                      , 0 AS SAYRNB
                      , LEFT(ISNULL(SC.UTENTEMODIFICA, ''), 10) AS SAFDTX
                      , SC.DATAMODIFICA AS SAAZDT
                      , SC.DATAMODIFICA AS SAACTM
                FROM    dbo.TABSCADENZE AS SC
                        LEFT OUTER JOIN dbo.ANAGRAFICACF AS ACF ON SC.CODCLIFOR = ACF.CODCONTO
                        LEFT OUTER JOIN dbo.TABCAMBI AS TC ON SC.CODCAMBIO = TC.CODICE
                        LEFT OUTER JOIN dbo.BANCAAPPCF AS BCF ON SC.CODCLIFOR = BCF.CODCONTO
                                                              AND SC.BANCAAPPOGGIO = BCF.CODICE
                        LEFT OUTER JOIN dbo.SST_IMG_TABTIPIEFFETTI AS SIT ON SC.TIPOEFFETTO = SIT.TipoEffetto
                        LEFT OUTER JOIN dbo.ANAGRAFICABANCHE AS AB ON SC.BANCAINC = AB.CODBANCA
                        LEFT OUTER JOIN dbo.TABNAZIONI AS TN ON ACF.CODNAZIONE = TN.CODICE
                WHERE   SC.CODCLIFOR LIKE 'C%'
                        AND SC.ESITO IN ( 0 )
        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_SCCL] TO [Metodo98]
    AS [dbo];

