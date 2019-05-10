﻿CREATE TABLE [dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] (
    [CODICE]              DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]         VARCHAR (80) NOT NULL,
    [TIPOCONTO]           SMALLINT     NOT NULL,
    [TipoDestinazioneUso] SMALLINT     DEFAULT ((0)) NOT NULL,
    [UtenteModifica]      VARCHAR (25) NOT NULL,
    [DataModifica]        DATETIME     NOT NULL,
    CONSTRAINT [PK__MB_RAGGR__CC87C0AA136BDEB9] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 80)
);


GO


CREATE TRIGGER [dbo].[TD_MB_RAGGRUPPAMENTO_CODICI_TESTE] ON dbo.MB_RAGGRUPPAMENTO_CODICI_TESTE FOR DELETE AS
BEGIN

    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0
        RETURN
       
    /*  DELETE ALL CHILDREN IN "MB_RAGGRUPPAMENTO_CODICI_RIGHE"  */
    DELETE MB_RAGGRUPPAMENTO_CODICI_RIGHE
    FROM   MB_RAGGRUPPAMENTO_CODICI_RIGHE T2, DELETED T1
    WHERE  T2.CODRAGGRUPPAMENTO = T1.CODICE
    RETURN

/*  ERRORS HANDLING  */

ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_RAGGRUPPAMENTO_CODICI_TESTE] TO [Metodo98]
    AS [dbo];

