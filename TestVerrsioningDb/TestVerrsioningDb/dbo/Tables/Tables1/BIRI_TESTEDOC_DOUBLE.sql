CREATE TABLE [dbo].[BIRI_TESTEDOC_DOUBLE] (
    [PROGRESSIVO]    DECIMAL (10) NULL,
    [ESERCIZIO]      DECIMAL (5)  NULL,
    [TIPODOC]        VARCHAR (3)  NULL,
    [NUMERODOC]      DECIMAL (10) NULL,
    [NUMRIFDOC]      VARCHAR (17) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    [DATAMODIFICA]   DATETIME     NULL
);


GO




CREATE TRIGGER [dbo].[BIRI_TU_TESTEDOC_DOUBLE] ON  [dbo].[BIRI_TESTEDOC_DOUBLE] WITH EXECUTE AS OWNER
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @body NVARCHAR(MAX) = N'';
		 
--IF EXISTS (SELECT  TOP (1)   COUNT(NUMRIFDOC) AS CONTEGGIO, NUMRIFDOC FROM BIRI_TESTEDOC_DOUBLE GROUP BY NUMRIFDOC HAVING (COUNT(NUMRIFDOC) > 1)) 

IF EXISTS (

SELECT        TOP (1) COUNT(NUMRIFDOC) AS CONTEGGIO, NUMRIFDOC, TIPODOC
FROM            BIRI_TESTEDOC_DOUBLE
GROUP BY NUMRIFDOC, TIPODOC
HAVING        (COUNT(NUMRIFDOC) > 1) AND (TIPODOC <> 'RFS'))



BEGIN
		SELECT  @body = concat ('Progr: ', PROGRESSIVO, ' Esercizio: ', ESERCIZIO, ' TipoDoc: ',TIPODOC,' Numerodoc: ', NUMERODOC,' NumRifDoc: ', NUMRIFDOC, ' - ', UTENTEMODIFICA, '-', DATAMODIFICA) FROM inserted
        EXEC msdb.dbo.sp_send_dbmail
          @recipients = 'mbernabe@grupposicura.it; Assistenza.Informatica@grupposicura.it',
          @profile_name = 'DatabaseMail',
          @subject = 'Attenzione Record Doppi!!!', 
          @body = @body;
    END

    -- Insert statements for trigger here

END



