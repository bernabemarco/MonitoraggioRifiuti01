CREATE TABLE [dbo].[ACQ_STATI] (
    [PROFILO]        VARCHAR (10) NOT NULL,
    [CODICE]         INT          NULL,
    [DESCRIZIONE]    VARCHAR (50) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROFILO] ASC)
);


GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE TRIGGER [dbo].[CANCPROF]
   ON  [dbo].[ACQ_STATI]
   FOR DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @CODICEPROFILO VARCHAR(10)
	
	SELECT @CODICEPROFILO = PROFILO FROM DELETED

	BEGIN TRAN

		DELETE FROM ACQ_STATIDETT WHERE RIFPROFILO = @CODICEPROFILO	

		IF @@ERROR = 0 
		
			BEGIN		

				DELETE FROM ACQ_STATIOFFERTA WHERE RIFPROFILO = @CODICEPROFILO

				IF @@ERROR > 0 GOTO ERRORE									
				
				
			END			

		ELSE

			BEGIN
			
				GOTO ERRORE				

			END

	COMMIT TRAN		

	GOTO FINE

ERRORE:

	ROLLBACK TRAN

FINE:

END



GO
GRANT DELETE
    ON OBJECT::[dbo].[ACQ_STATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACQ_STATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACQ_STATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACQ_STATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACQ_STATI] TO [Metodo98]
    AS [dbo];

