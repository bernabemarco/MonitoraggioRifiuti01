

CREATE FUNCTION dbo.SST_IMG_GET_PDCO ( )
RETURNS @table TABLE
    (
      [S7FECD] [VARCHAR](12) NOT NULL
    , [S7JGTX] [VARCHAR](40) NULL
    , [S7EHST] [VARCHAR](1) NULL
    , [S7FHST] [VARCHAR](1) NULL
    , [S7FIST] [VARCHAR](1) NULL
    , [S7Y9SS] [VARCHAR](1) NULL
    , [S7K9CD] [VARCHAR](5) NULL
    , [S7ZASS] [VARCHAR](2) NULL
    , [S7CISU] [VARCHAR](1) NULL
    , [S7BFSU] [VARCHAR](1) NULL
    , [S7BGSU] [VARCHAR](1) NULL
    , [S7BHSU] [VARCHAR](1) NULL
    , [S7BISU] [VARCHAR](1) NULL
    , [S7BJSU] [VARCHAR](1) NULL
    , [S7BKSU] [VARCHAR](1) NULL
    , [S7BLSU] [VARCHAR](1) NULL
    , [S7BMSU] [VARCHAR](1) NULL
    , [S7BNSU] [VARCHAR](1) NULL
    , [S7EGST] [VARCHAR](1) NULL
    , [S7FDTX] [VARCHAR](10) NULL
    , [S7AZDT] [DATETIME] NULL
    , [S7ACTM] [DATETIME] NULL
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
                , [S7FECD] -- [varchar](12) NOT NULL
                , [S7JGTX] -- [varchar](40) NULL
                , [S7EHST] -- [varchar](1) NULL,
                , [S7FHST] -- [varchar](1) NULL,
                , [S7FIST] -- [varchar](1) NULL,
                , [S7Y9SS] -- [varchar](1) NULL,
                , [S7K9CD] -- [varchar](5) NULL,
                , [S7ZASS] -- [varchar](2) NULL,
                , [S7CISU] -- [varchar](1) NULL,
                , [S7BFSU] -- [varchar](1) NULL,
                , [S7BGSU] -- [varchar](1) NULL,
                , [S7BHSU] -- [varchar](1) NULL,
                , [S7BISU] -- [varchar](1) NULL,
                , [S7BJSU] -- [varchar](1) NULL,
                , [S7BKSU] -- [varchar](1) NULL,
                , [S7BLSU] -- [varchar](1) NULL,
                , [S7BMSU] -- [varchar](1) NULL,
                , [S7BNSU] -- [varchar](1) NULL,
                , [S7EGST] -- [varchar](1) NULL,
                , [S7FDTX] -- [varchar](10) NULL,
                , [S7AZDT] -- [datetime] NULL,
                , [S7ACTM] -- [datetime] NULL
                )
                SELECT  G.CODCONTO
                      , REPLACE(G.CODCONTO, ' ', '') AS [S7FECD]
                      , LEFT(G.DSCCONTO1, 40) AS [S7JGTX]
                      , 'S' AS S7EHST
                      , 'N' AS S7FHST
                      , TM.TIPO AS S7FIST
                      , '' AS S7Y9SS
                      , '' AS S7K9CD
                      , '' AS S7ZASS
                      , 'O' AS S7CISU
                      , 'O' AS [S7BFSU]
                      , 'O' AS [S7BGSU]
                      , 'O' AS [S7BHSU]
                      , 'O' AS [S7BISU]
                      , 'O' AS [S7BJSU]
                      , 'O' AS [S7BKSU]
                      , 'O' AS [S7BLSU]
                      , 'O' AS [S7BMSU]
                      , 'O' AS [S7BNSU]
                      , '' AS S7EGST
                      , LEFT(ISNULL(G.UTENTEMODIFICA, ''), 10) AS [S7FDTX]
                      , G.DATAMODIFICA AS [S7AZDT]
                      , G.DATAMODIFICA AS [S7ACTM]
                FROM    dbo.ANAGRAFICAGENERICI AS G
                        INNER JOIN dbo.TABMASTRI AS TM ON G.CODMASTRO = TM.CODICE
                WHERE   TM.TIPO IN ( 'E', 'P' )
                        OR G.CODCONTO IN ( SELECT   CODCONTORIF
                                           FROM     dbo.ANAGRAFICABANCHE )  
                        -- G.UTILIZZOINGOLD = 1 
                UNION ALL
                SELECT  G.CODCONTO
                      , REPLACE(G.CODCONTO, ' ', '') AS [S7FECD]
                      , LEFT(G.DSCCONTO1, 40) AS [S7JGTX]
                      , 'S' AS S7EHST
                      , 'N' AS S7FHST
                      , 'P' AS S7FIST
                      , '' AS S7Y9SS
                      , '' AS S7K9CD
                      , '' AS S7ZASS
                      , 'O' AS S7CISU
                      , 'O' AS [S7BFSU]
                      , 'O' AS [S7BGSU]
                      , 'O' AS [S7BHSU]
                      , 'O' AS [S7BISU]
                      , 'O' AS [S7BJSU]
                      , 'O' AS [S7BKSU]
                      , 'O' AS [S7BLSU]
                      , 'O' AS [S7BMSU]
                      , 'O' AS [S7BNSU]
                      , '' AS S7EGST
                      , LEFT(ISNULL(G.UTENTEMODIFICA, ''), 10) AS [S7FDTX]
                      , G.DATAMODIFICA AS [S7AZDT]
                      , G.DATAMODIFICA AS [S7ACTM]
                FROM    dbo.ANAGRAFICACF AS G

        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_PDCO] TO [Metodo98]
    AS [dbo];

