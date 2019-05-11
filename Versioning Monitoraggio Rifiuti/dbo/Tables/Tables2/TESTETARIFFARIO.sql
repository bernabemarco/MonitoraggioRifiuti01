﻿CREATE TABLE [dbo].[TESTETARIFFARIO] (
    [PROGRESSIVO]      DECIMAL (10)    NOT NULL,
    [CODICE]           VARCHAR (3)     NULL,
    [ESERCIZIO]        SMALLINT        NULL,
    [NUMERO]           DECIMAL (10)    NULL,
    [CODCLIENTE]       VARCHAR (7)     NULL,
    [DATA]             DATETIME        NULL,
    [UM]               VARCHAR (3)     NULL,
    [TERRITORI]        VARCHAR (100)   NULL,
    [MINIMOORDINABILE] DECIMAL (16, 6) NULL,
    [NOTE]             VARCHAR (100)   NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [PK_TESTETARIFFARIO] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_TESTETARIFFARIO" FOR TABLE "TESTETARIFFARIO"  */
CREATE TRIGGER TD_TESTETARIFFARIO ON  TESTETARIFFARIO FOR DELETE AS
BEGIN

DECLARE

@NUMROWS INT,
@ERRNO INT,
@ERRMSG VARCHAR(255)

SELECT @NUMROWS = @@ROWCOUNT
IF @NUMROWS = 0
RETURN

/* DELETE CASCADE */   /* per OGNI Tabella CHILD in Relazione */
/* DELETE ALL CHILDREN IN "RIGHETARIFFARIO" */

DELETE RIGHETARIFFARIO
FROM RIGHETARIFFARIO T2, DELETED T1
WHERE T2.RIFTESTA= T1.PROGRESSIVO

DELETE MAGGIORAZIONITARIFFARIO
FROM MAGGIORAZIONITARIFFARIO T2, DELETED T1
WHERE T2.RIFTESTA= T1.PROGRESSIVO

RETURN

/* ERRORS HANDLING */
ERROR:
RAISERROR (@ERRMSG, 1, 1)
ROLLBACK TRANSACTION

END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTETARIFFARIO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTETARIFFARIO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTETARIFFARIO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTETARIFFARIO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTETARIFFARIO] TO [Metodo98]
    AS [dbo];
