CREATE TABLE [dbo].[BIRI_DESTINAZIONIDIVERSE_UPDATE] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [datainserted]         DATETIME      DEFAULT (getdate()) NOT NULL,
    [CurrentUser]          VARCHAR (900) NULL,
    [CODCONTO]             VARCHAR (7)   NULL,
    [CODICE]               DECIMAL (5)   NULL,
    [RAGIONESOCIALE]       VARCHAR (80)  NULL,
    [INDIRIZZO]            VARCHAR (80)  NULL,
    [CAP]                  VARCHAR (8)   NULL,
    [LOCALITA]             VARCHAR (80)  NULL,
    [PROVINCIA]            VARCHAR (4)   NULL,
    [TELEFONO]             VARCHAR (25)  NULL,
    [FAX]                  VARCHAR (25)  NULL,
    [CODDEPOSITO]          VARCHAR (10)  NULL,
    [CODDEPOSITOCOLL]      VARCHAR (10)  NULL,
    [CODDEPCOMP]           VARCHAR (10)  NULL,
    [CODDEPCOMPCOLL]       VARCHAR (10)  NULL,
    [INOLTROTRASP]         SMALLINT      NULL,
    [UTENTEMODIFICA]       VARCHAR (25)  NULL,
    [DATAMODIFICA]         DATETIME      NULL,
    [ZonaSped]             VARCHAR (10)  NULL,
    [CodSettoreGiriVisite] VARCHAR (7)   NULL,
    [email]                VARCHAR (50)  NULL,
    [IdAmmnistratore]      SMALLINT      NULL,
    [codRelazione]         VARCHAR (11)  NULL,
    [CentroCompentenza]    VARCHAR (10)  NULL,
    [codIstatComune]       VARCHAR (6)   NULL,
    [CODNAZIONE]           DECIMAL (5)   NULL,
    [CODDEST_EDI]          VARCHAR (10)  NULL,
    [codiceSapDest]        VARCHAR (10)  NULL,
    [StatoExportDDVSap]    SMALLINT      NULL,
    [Dismesso]             SMALLINT      NULL,
    [NoExport]             SMALLINT      NULL,
    [CodiceComplesso]      VARCHAR (30)  NULL,
    [RSPPdiRif_D]          SMALLINT      NULL,
    [MedicodiRif_D]        SMALLINT      NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC) WITH (PAD_INDEX = ON, IGNORE_DUP_KEY = ON)
);


GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[BIRI_TI_DESTINAZIONIDIVERSE_UPDATE] ON [dbo].[BIRI_DESTINAZIONIDIVERSE_UPDATE] WITH EXECUTE AS OWNER FOR INSERT  AS 
BEGIN
    DECLARE
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255),
	   @body NVARCHAR(MAX) = N'Numero di variazioni effettuate - ';


  
    IF EXISTS (SELECT        COUNT(CurrentUser) AS UTENTE
				FROM            BIRI_DESTINAZIONIDIVERSE_UPDATE
				WHERE        (convert(varchar(10), datainserted, 103) = CONVERT(VARCHAR(10), GETDATE(), 103))
				GROUP BY CurrentUser
				HAVING        (COUNT(CurrentUser) > 200))
	
BEGIN
		SELECT  @body = COUNT(CurrentUser) FROM inserted

		SELECT  @body = @body + ' Variazioni dallo stesso utente nella tabella DestinazioniDiverse VERIFICARE!!'
        EXEC msdb.dbo.sp_send_dbmail
          @recipients = 'mbernabe@grupposicura.it; Assistenza.Informatica@grupposicura.it',
          @profile_name = 'DatabaseMail',
          @subject = 'Variazioni Destinazioni Diverse!!!', 
          @body = @body;
    END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR(@ERRMSG,1, 1)
    ROLLBACK  TRANSACTION
END


