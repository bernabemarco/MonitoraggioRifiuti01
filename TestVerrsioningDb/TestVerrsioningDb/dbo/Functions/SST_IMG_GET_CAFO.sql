

CREATE FUNCTION dbo.SST_IMG_GET_CAFO ( )
RETURNS @table TABLE
    (
      [SPCCAT] [VARCHAR](4) NOT NULL
                            PRIMARY KEY ,
      [SPDCAT] [VARCHAR](35) NULL ,
      [SPCECE] [VARCHAR](12) NULL ,
      [SPFDTX] [VARCHAR](10) NULL ,
      [SPAZDT] [DATETIME] NULL ,
      [SPACTM] [DATETIME] NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( [SPCCAT] -- [VARCHAR](4) NOT NULL                            
                  ,
                  [SPDCAT] -- [VARCHAR](35) NULL
                  ,
                  [SPCECE] -- [VARCHAR](12) NULL
                  ,
                  [SPFDTX] -- [VARCHAR](10) NULL
                  ,
                  [SPAZDT] -- [DATETIME] NULL
                  ,
                  [SPACTM] -- [DATETIME] NULL
                )
                SELECT  C.CODCATEGORIA AS FOCHCD ,
                        LEFT(ISNULL(C.DSCCATEGORIA, ''), 25) AS FODITX ,
                        '' AS FOCFCE ,
                        LEFT(ISNULL(C.UTENTEMODIFICA, ''), 10) AS FOFDTX ,
                        C.DATAMODIFICA AS FOAZDT ,
                        C.DATAMODIFICA AS FOACTM
                FROM    dbo.CATEGORIECF AS C
                WHERE   C.CODCATEGORIA IN (
                        SELECT  CODCATEGORIA
                        FROM    dbo.ANAGRAFICARISERVATICF AS RIS
                        WHERE   RIS.CODCONTO LIKE 'F%' )                        
        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_CAFO] TO [Metodo98]
    AS [dbo];

