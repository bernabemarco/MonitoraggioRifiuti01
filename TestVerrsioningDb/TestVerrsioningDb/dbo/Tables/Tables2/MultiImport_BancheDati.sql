CREATE TABLE [dbo].[MultiImport_BancheDati] (
    [CODICE]                VARCHAR (10)  NOT NULL,
    [DESCRIZIONE]           VARCHAR (80)  NOT NULL,
    [MASTER]                SMALLINT      NOT NULL,
    [Address]               VARCHAR (50)  NOT NULL,
    [Username]              VARCHAR (50)  NOT NULL,
    [Password]              VARCHAR (50)  NOT NULL,
    [PassiveMode]           SMALLINT      NOT NULL,
    [RemoteFolderArticoli]  VARCHAR (255) NOT NULL,
    [RemoteFolderCategorie] VARCHAR (255) NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]          DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO

/*  INSERT TRIGGER "TIU_MultiImport_BancheDati" FOR TABLE "MultiImport_BancheDati"  */
CREATE TRIGGER TIU_MultiImport_BancheDati ON MultiImport_BancheDati 
AFTER INSERT , UPDATE AS
BEGIN
    DECLARE
       @MASTER	 SMALLINT,
       @BANCADATI VARCHAR(10),
       @MAXCARD  INT,
       @NUMROWS  INT,
       @NUMNULL  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    	
	SELECT @BANCADATI = CODICE, @MASTER = MASTER FROM INSERTED

    	IF @MASTER = 1
		BEGIN
			UPDATE MultiImport_BancheDati SET Master = 0 WHERE Codice <> @BANCADATI
		END
        
    RETURN
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[MultiImport_BancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MultiImport_BancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MultiImport_BancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MultiImport_BancheDati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MultiImport_BancheDati] TO [Metodo98]
    AS [dbo];

