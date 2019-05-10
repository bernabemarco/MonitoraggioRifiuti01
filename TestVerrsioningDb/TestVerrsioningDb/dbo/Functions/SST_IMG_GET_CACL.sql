

CREATE FUNCTION dbo.SST_IMG_GET_CACL ( )
RETURNS @table TABLE
    (
      [FOCHCD] [VARCHAR](4) NOT NULL
                            PRIMARY KEY ,
      [FODITX] [VARCHAR](25) NULL ,
      [FOCFCE] [VARCHAR](12) NULL ,
      [FOFDTX] [VARCHAR](10) NULL ,
      [FOAZDT] [DATETIME] NULL ,
      [FOACTM] [DATETIME] NULL
    )
AS
    BEGIN

        DECLARE @codiceAzienda VARCHAR(2)
        SET @codiceAzienda = ''

        SELECT TOP 1
                @codiceAzienda = CodiceAzienda
        FROM    dbo.SST_IMG_TABCONFIGURAZIONE AS TC

        INSERT  INTO @table
                ( [FOCHCD] -- [varchar](4) NOT NULL PRIMARY KEY
                  ,
                  [FODITX] -- [varchar](25) NULL
                  ,
                  [FOCFCE] -- [varchar](12) NULL
                  ,
                  [FOFDTX] -- [varchar](10) NULL
                  ,
                  [FOAZDT] -- [datetime] NULL
                  ,
                  [FOACTM] -- [datetime] NULL
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
                        WHERE   RIS.CODCONTO LIKE 'C%' )                        
        RETURN 
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SST_IMG_GET_CACL] TO [Metodo98]
    AS [dbo];

