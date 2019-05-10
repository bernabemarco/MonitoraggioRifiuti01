﻿CREATE TABLE [dbo].[TESTELISTACONS] (
    [PROGRESSIVO]    DECIMAL (10)  NOT NULL,
    [ESERCIZIO]      DECIMAL (5)   NULL,
    [CODICELISTA]    VARCHAR (3)   NOT NULL,
    [NUMEROLISTA]    INT           NOT NULL,
    [DATAEMISSIONE]  DATETIME      NULL,
    [STATOCHIUSO]    SMALLINT      CONSTRAINT [DF_TESTELISTACONS_STATOCHIUSO] DEFAULT (0) NULL,
    [NOTE]           VARCHAR (100) NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMOVIMENTO]  DATETIME      NULL,
    CONSTRAINT [PK_TESTELISTACONS] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TESTELISTACONS_STATOCHIUSO] CHECK ([STATOCHIUSO] = 0 or [STATOCHIUSO] = 1)
);


GO
/* DELETE TRIGGER "TD_TESTELISTACONS" FOR TABLE "TESTELISTACONS" */
CREATE TRIGGER TD_TESTELISTACONS ON TESTELISTACONS FOR DELETE AS
BEGIN

DECLARE
@NUMROWS INT,
@ERRNO INT,
@ERRMSG VARCHAR(255)

SELECT @NUMROWS = @@ROWCOUNT
IF @NUMROWS = 0
RETURN

/* DELETE CASCADE */   /* per OGNI Record CHILD in Relazione */
/* DELETE ALL CHILDREN IN "RIGHELISTACONS" */
DELETE RIGHELISTACONS
FROM RIGHELISTACONS T2, DELETED T1
WHERE T2.IDTESTA = T1.PROGRESSIVO

RETURN

/* ERRORS HANDLING */
ERROR:
RAISERROR (@ERRMSG, 1, 1)
ROLLBACK TRANSACTION

END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TESTELISTACONS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TESTELISTACONS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TESTELISTACONS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TESTELISTACONS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TESTELISTACONS] TO [Metodo98]
    AS [dbo];

