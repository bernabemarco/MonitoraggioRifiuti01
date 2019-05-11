﻿CREATE TABLE [dbo].[TP_ANAGRAFICABUYER] (
    [CODICE]          VARCHAR (7)  NOT NULL,
    [DESCRIZIONE]     VARCHAR (80) NULL,
    [SUPERVISOR]      SMALLINT     NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    [USERID]          VARCHAR (25) NULL,
    [AGGIORNALISTINO] SMALLINT     DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO

CREATE TRIGGER [dbo].[TD_TP_ANAGRAFICABUYER] ON [dbo].[TP_ANAGRAFICABUYER] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    /*  DELETE ALL CHILDREN IN "TP_CONFIGURAZIONIBUYER"  */
    DELETE TP_CONFIGURAZIONIBUYER
    FROM   TP_CONFIGURAZIONIBUYER T2, DELETED T1
    WHERE  T2.CODBUYER = T1.CODICE
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ANAGRAFICABUYER] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ANAGRAFICABUYER] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ANAGRAFICABUYER] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ANAGRAFICABUYER] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ANAGRAFICABUYER] TO [Metodo98]
    AS [dbo];
