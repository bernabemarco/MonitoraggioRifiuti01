


-- FINE RIF.A#12602


----------------------------------------------------------
-- Anomalia 12631
----------------------------------------------------------
CREATE FUNCTION [dbo].[SST_IMG_GET_SCAD] ( )
RETURNS @table TABLE
    (
      [SCCDAZ] [VARCHAR](2) NOT NULL
    , [SCFLCF] [VARCHAR](1) NOT NULL
    , [SCCDCF] [VARCHAR](11) NOT NULL
    , [SCKEYU] [VARCHAR](50) NOT NULL
                             PRIMARY KEY
    , [SCAADC] [INT] NOT NULL
    , [SCTPDC] [VARCHAR](1) NOT NULL
    , [SCPRDC] [VARCHAR](2) NOT NULL
    , [SCCDDO] [VARCHAR](15) NOT NULL
    , [SCNURA] [INT] NOT NULL
    , [SCCDFF] [VARCHAR](15) NOT NULL
    , [SCDTSD] [DATETIME] NULL
    , [SCCDDI] [VARCHAR](3) NULL
    , [SCIMDV] [DECIMAL](15, 2) NULL
    , [SCIMBS] [DECIMAL](15, 2) NULL
    , [SCIMCM] [DECIMAL](12, 6) NULL
    , [SCDTDF] [DATETIME] NULL
    , [SCIMDC] [DECIMAL](15, 2) NULL
    , [SCCOPC] [VARCHAR](10) NULL
    , [SCCOPG] [VARCHAR](10) NULL
    , [SCAAPA] [INT] NULL
    , [SCNUPA] [VARCHAR](15) NULL
    , [SCCTAN] [VARCHAR](10) NULL
    , [SCTPIP] [VARCHAR](10) NULL
    , [SCCDAG] [VARCHAR](11) NULL
    , [SCSSFO] [VARCHAR](1) NULL
    , [SCSCFB] [VARCHAR](11) NULL
    , [SCDESN] [VARCHAR](40) NULL
    , [SCNUSC] [INT] NULL
    , [SCTIOP] [VARCHAR](1) NULL
    , [SCELAB] [VARCHAR](1) NULL
    , [SCERRO] [VARCHAR](1) NULL
    , [SCDERR] [VARCHAR](60) NULL
    , [SCIXCI] [VARCHAR](10) NULL
    , [SCCICD] [VARCHAR](10) NULL
    , [SCJSNB] [VARCHAR](10) NULL
    , [SCCOTT] [VARCHAR](15) NULL
    , [SCIYCI] [VARCHAR](34) NULL
    , [SCG5CI] [VARCHAR](15) NULL
    , [SCG6CI] [VARCHAR](15) NULL
    , [SCA4VM] [DECIMAL](13, 2) NULL
    , [SCA5VM] [DECIMAL](13, 2) NULL
    , [SCA6VM] [DECIMAL](13, 2) NULL
    , [SCA7VM] [DECIMAL](13, 2) NULL
    , [SCA8VM] [DECIMAL](13, 2) NULL
    , [SCA9VM] [DECIMAL](13, 2) NULL
    , [SCAON1] [INT] NULL
    , [SCBAVM] [DECIMAL](13, 2) NULL
    , [SCBBVM] [DECIMAL](13, 2) NULL
    , [SCADPT] [DECIMAL](5, 2) NULL
    , [SCAEPT] [DECIMAL](5, 2) NULL
    , [SCBCVM] [DECIMAL](13, 2) NULL
    , [SCBDVM] [DECIMAL](13, 2) NULL
    , [SCTIRE] [VARCHAR](5) NULL
    , [SCIYCE] [VARCHAR](3) NULL
    , [SCSWI1] [VARCHAR](11) NULL
    , [SCUT11] [VARCHAR](30) NULL
    , [SCUTT2] [VARCHAR](30) NULL
    , [SCUTT3] [VARCHAR](30) NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( [SCCDAZ] -- [VARCHAR](2) NOT NULL
                , [SCFLCF] -- [VARCHAR](1) NOT NULL
                , [SCCDCF] -- [VARCHAR](11) NOT NULL
                , [SCKEYU] -- [VARCHAR](50) NOT NULL  PRIMARY KEY
                , [SCAADC] -- [INT] NOT NULL
                , [SCTPDC] -- [VARCHAR](1) NOT NULL
                , [SCPRDC] -- [VARCHAR](2) NOT NULL
                , [SCCDDO] -- [VARCHAR](15) NOT NULL
                , [SCNURA] -- [INT] NOT NULL
                , [SCCDFF] -- [VARCHAR](15) NOT NULL
                , [SCDTSD] -- [DATETIME] NULL
                , [SCCDDI] -- [VARCHAR](3) NULL
                , [SCIMDV] -- [DECIMAL](15, 2) NULL
                , [SCIMBS] -- [DECIMAL](15, 2) NULL
                , [SCIMCM] -- [DECIMAL](12, 6) NULL
                , [SCDTDF] -- [DATETIME] NULL
                , [SCIMDC] -- [DECIMAL](15, 2) NULL
                , [SCCOPC] -- [VARCHAR](10) NULL
                , [SCCOPG] -- [VARCHAR](10) NULL
                , [SCAAPA] -- [INT] NULL
                , [SCNUPA] -- [VARCHAR](15) NULL
                , [SCCTAN] -- [VARCHAR](10) NULL
                , [SCTPIP] -- [VARCHAR](10) NULL
                , [SCCDAG] -- [VARCHAR](11) NULL
                , [SCSSFO] -- [VARCHAR](1) NULL
                , [SCSCFB] -- [VARCHAR](11) NULL
                , [SCDESN] -- [VARCHAR](40) NULL
                , [SCNUSC] -- [INT] NULL
                , [SCTIOP] -- [VARCHAR](1) NULL
                , [SCELAB] -- [VARCHAR](1) NULL
                , [SCERRO] -- [VARCHAR](1) NULL
                , [SCDERR] -- [VARCHAR](60) NULL
                , [SCIXCI] -- [VARCHAR](10) NULL
                , [SCCICD] -- [VARCHAR](10) NULL
                , [SCJSNB] -- [VARCHAR](10) NULL
                , [SCCOTT] -- [VARCHAR](15) NULL
                , [SCIYCI] -- [VARCHAR](34) NULL
                , [SCG5CI] -- [VARCHAR](15) NULL
                , [SCG6CI] -- [VARCHAR](15) NULL
                , [SCA4VM] -- [DECIMAL](13, 2) NULL
                , [SCA5VM] -- [DECIMAL](13, 2) NULL
                , [SCA6VM] -- [DECIMAL](13, 2) NULL
                , [SCA7VM] -- [DECIMAL](13, 2) NULL
                , [SCA8VM] -- [DECIMAL](13, 2) NULL
                , [SCA9VM] -- [DECIMAL](13, 2) NULL
                , [SCAON1] -- [INT] NULL
                , [SCBAVM] -- [DECIMAL](13, 2) NULL
                , [SCBBVM] -- [DECIMAL](13, 2) NULL
                , [SCADPT] -- [DECIMAL](5, 2) NULL
                , [SCAEPT] -- [DECIMAL](5, 2) NULL
                , [SCBCVM] -- [DECIMAL](13, 2) NULL
                , [SCBDVM] -- [DECIMAL](13, 2) NULL
                , [SCTIRE] -- [VARCHAR](5) NULL
                , [SCIYCE] -- [VARCHAR](3) NULL
                , [SCSWI1] -- [VARCHAR](11) NULL
                , [SCUT11] -- [VARCHAR](30) NULL
                , [SCUTT2] -- [VARCHAR](30) NULL
                , [SCUTT3] -- [VARCHAR](30) NULL
                )
                SELECT  @codiceAzienda AS SCCDAZ
                      , LEFT(SC.CODCLIFOR, 1) AS SCFLCF
                      , REPLACE(SC.CODCLIFOR, ' ', '') AS SCCDCF
                      , SC.PROGRESSIVO AS SCKEYU
                      , SC.ANNODOC AS SCAADC
                      , 'F' AS SCTPDC -- TODO: Verificare la tipologia
                      , '' AS SCPRDC
                      , right(ISNULL(SC.NUMEROPROT, ''),8) AS SCCDDO    -- Anomalia 100424
                      , SC.NUMSCAD AS SCNURA
                      , SC.NUMRIF AS SCCDFF
                      , SC.DATASCADENZA AS SCDTSD
                      , TC.DIVISA AS SCCDDI
                      , ( CASE WHEN ( ( SC.SCADATTPASS <> 0
                                        AND SUBSTRING(SC.CODCLIFOR, 1, 1) = 'F'
                                      )
                                      OR ( SC.SCADATTPASS = 0
                                           AND SUBSTRING(SC.CODCLIFOR, 1, 1) <> 'F'
                                         )
                                    ) THEN ( SC.IMPORTOSCEURO * -1 )
                               ELSE SC.IMPORTOSCEURO
                          END ) AS SCIMDV
                      , ( CASE WHEN ( ( SC.SCADATTPASS <> 0
                                        AND SUBSTRING(SC.CODCLIFOR, 1, 1) = 'F'
                                      )
                                      OR ( SC.SCADATTPASS = 0
                                           AND SUBSTRING(SC.CODCLIFOR, 1, 1) <> 'F'
                                         )
                                    ) THEN ( SC.IMPORTOSCEURO * -1 )
                               ELSE SC.IMPORTOSCEURO
                          END ) AS SCIMBS
                      , SC.VALCAMBIO AS SCIMCM
                      , SC.DATAFATTURA AS SCDTDF
                      , ( CASE WHEN ( ( SC.SCADATTPASS <> 0
                                        AND SUBSTRING(SC.CODCLIFOR, 1, 1) = 'F'
                                      )
                                      OR ( SC.SCADATTPASS = 0
                                           AND SUBSTRING(SC.CODCLIFOR, 1, 1) <> 'F'
                                         )
                                    ) THEN ( SC.TOTFATTEURO * -1 )
                               ELSE SC.TOTFATTEURO
                          END ) AS SCIMDC
                      , '' AS SCCOPC
                      , '' AS SCCOPG -- TODO: Condizione di pagamento...
                      , SC.ANNODOC AS SCAAPA
                      , '0' AS SCNUPA
                      , ISNULL(RIS.CODCATEGORIA, 0) AS SCCTAN
                      , ISNULL(TE.TIPOPAGGETES, '') AS SCTPIP
                      , ISNULL(SC.CODAGE1, '') AS SCCDAG
                      , CASE ISNULL(SC.STATOSCADENZA, 0)
                          WHEN 0 THEN 'N'
                          ELSE 'C'
                        END AS SCSSFO
                      , REPLACE(SC.CODCLIFOR, ' ', '') AS SCSCFB
                      , LEFT(ISNULL(SC.NOTE, ''), 40) AS SCDESN
                      , 0 AS SCNUSC
                      , 'I' AS SCTIOP
                      , 'N' AS SCELAB
                      , 'N' AS SCERRO
                      , '' AS SCDERR
                      , ISNULL(AB.GOLD_BAIN_BIDPCD, '') AS SCIXCI
                      , RIGHT(ISNULL(BCF.ABI, ''), 5) AS SCCICD
                      , ISNULL(BCF.CAB, '') AS SCJSNB
                      , ISNULL(BCF.CONTOCORRENTE, '') AS SCCOTT
                      , ISNULL(BCF.CODICEIBAN, '') AS SCIYCI
                      , '' AS SCG5CI
                      , '' AS SCG6CI
                      , ( CASE WHEN ( ( SC.SCADATTPASS <> 0
                                        AND SUBSTRING(SC.CODCLIFOR, 1, 1) = 'F'
                                      )
                                      OR ( SC.SCADATTPASS = 0
                                           AND SUBSTRING(SC.CODCLIFOR, 1, 1) <> 'F'
                                         )
                                    ) THEN ( SC.IMPORTOSCEURO * -1 )
                               ELSE SC.IMPORTOSCEURO
                          END )
                        - ( CASE WHEN ( ( SC.SCADATTPASS <> 0
                                          AND SUBSTRING(SC.CODCLIFOR, 1, 1) = 'F'
                                        )
                                        OR ( SC.SCADATTPASS = 0
                                             AND SUBSTRING(SC.CODCLIFOR, 1, 1) <> 'F'
                                           )
                                      ) THEN ( SC.IMPONIBSCEURO * -1 )
                                 ELSE SC.IMPONIBSCEURO
                            END ) AS SCA4VM
                      , 0 AS SCA5VM -- TODO: Importo spese esenti
                      , 0 AS SCA6VM
                      , 0 AS SCA7VM
                      , 0 AS SCA8VM
                      , 0 AS SCA9VM
                      , 0 AS SCAON1
                      , 0 AS SCBAVM
                      , 0 AS SCBBVM
                      , 0 AS SCADPT
                      , 0 AS SCAEPT
                      , 0 AS SCBCVM
                      , 0 AS SCBDVM
                      , '' AS SCTIRE
                      , '' AS SCIYCE
                      , ISNULL(BCF.CODICEBIC, '') AS SCSWI1
                      , '' AS SCUT11
                      , '' AS SCUTT2
                      , '' AS SCUTT3
                FROM    dbo.TABSCADENZE AS SC
                        LEFT OUTER JOIN dbo.ANAGRAFICACF AS ACF ON SC.CODCLIFOR = ACF.CODCONTO
                        LEFT OUTER JOIN dbo.TABCAMBI AS TC ON SC.CODCAMBIO = TC.CODICE
                        LEFT OUTER JOIN dbo.BANCAAPPCF AS BCF ON SC.CODCLIFOR = BCF.CODCONTO
                                                              AND SC.BANCAAPPOGGIO = BCF.CODICE
                        LEFT OUTER JOIN dbo.TIPIEFFETTI AS TE ON SC.TIPOEFFETTO=TE.EFFETTO                                      
                        LEFT OUTER JOIN dbo.ANAGRAFICABANCHE AS AB ON SC.BANCAINC = AB.CODBANCA
                        LEFT OUTER JOIN dbo.TABNAZIONI AS TN ON ACF.CODNAZIONE = TN.CODICE
                        LEFT OUTER JOIN dbo.ANAGRAFICARISERVATICF AS RIS ON SC.CODCLIFOR = RIS.CODCONTO
                                                              AND SC.ESERCIZIO = RIS.ESERCIZIO
                WHERE   ( SC.CODCLIFOR LIKE 'C%'
                          OR SC.CODCLIFOR LIKE 'F%'
                        )
                        AND SC.ESITO IN ( 0, 3 )

        RETURN 
    END



GO
GRANT DELETE
    ON OBJECT::[dbo].[SST_IMG_GET_SCAD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SST_IMG_GET_SCAD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SST_IMG_GET_SCAD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_SCAD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SST_IMG_GET_SCAD] TO [Metodo98]
    AS [dbo];

