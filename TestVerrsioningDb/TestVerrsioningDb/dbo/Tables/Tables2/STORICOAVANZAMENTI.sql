﻿CREATE TABLE [dbo].[STORICOAVANZAMENTI] (
    [PROGRESSIVO]           DECIMAL (10)    NOT NULL,
    [RIFMOVPRINCIPALE]      DECIMAL (10)    NULL,
    [ESERCIZIO]             NUMERIC (5)     NOT NULL,
    [DATAMOV]               DATETIME        NULL,
    [TIPOMOVIMENTO]         SMALLINT        DEFAULT (0) NOT NULL,
    [CODCAUSALE]            NUMERIC (5)     NOT NULL,
    [ANNOBOLLA]             SMALLINT        NOT NULL,
    [NUMEROBOLLA]           INT             NOT NULL,
    [TIPOBOLLA]             SMALLINT        DEFAULT (0) NOT NULL,
    [CDLAVORO]              VARCHAR (5)     NOT NULL,
    [MACCHINA]              VARCHAR (5)     NOT NULL,
    [DATAINIZIOSETUP]       DATETIME        NULL,
    [ORAINIZIOSETUP]        DATETIME        NULL,
    [DATAFINESETUP]         DATETIME        NULL,
    [ORAFINESETUP]          DATETIME        NULL,
    [ORESETUP]              DECIMAL (16, 6) DEFAULT (0) NULL,
    [DATAINIZIOMACCHINA]    DATETIME        NULL,
    [ORAINIZIOMACCHINA]     DATETIME        NULL,
    [DATAFINEMACCHINA]      DATETIME        NULL,
    [ORAFINEMACCHINA]       DATETIME        NULL,
    [OREMACCHINA]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [DATAINIZIOUOMO]        DATETIME        NULL,
    [ORAINIZIOUOMO]         DATETIME        NULL,
    [DATAFINEUOMO]          DATETIME        NULL,
    [ORAFINEUOMO]           DATETIME        NULL,
    [OREUOMO]               DECIMAL (16, 6) DEFAULT (0) NULL,
    [DATAINIZIODURATA]      DATETIME        NULL,
    [ORAINIZIODURATA]       DATETIME        NULL,
    [DATAFINEDURATA]        DATETIME        NULL,
    [ORAFINEDURATA]         DATETIME        NULL,
    [OREDURATA]             DECIMAL (16, 6) DEFAULT (0) NULL,
    [DATAINIZIOMOVNE]       DATETIME        NULL,
    [ORAINIZIOMOVNE]        DATETIME        NULL,
    [DATAFINEMOVNE]         DATETIME        NULL,
    [ORAFINEMOVNE]          DATETIME        NULL,
    [OREMOVIMENTAZIONE]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [COSTOSETUP]            DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOSETUPAGG]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [DSCCOSTOSETUP]         VARCHAR (30)    NULL,
    [COSTOMACCHINA]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOMACCHINAAGG]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [DSCCOSTOMACCHINA]      VARCHAR (30)    NULL,
    [COSTOUOMO]             DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOUOMOAGG]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [DSCCOSTOUOMO]          VARCHAR (30)    NULL,
    [COSTOINDIRETTO]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOINDIRETTOAGG]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [DSCCOSTOINDIRETTO]     VARCHAR (30)    NULL,
    [COSTOESTERNO]          DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOESTERNOAGG]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [DSCCOSTOESTERNO]       VARCHAR (30)    NULL,
    [QTAVERSATA]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTARILAVORATA]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [QTASCARTATA]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [UM]                    VARCHAR (3)     NOT NULL,
    [STATOOPERAZIONE]       SMALLINT        DEFAULT (0) NULL,
    [CODSQUADRA]            VARCHAR (5)     NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [COSTOSETUPEURO]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOSETUPAGGEURO]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOMACCHINAEURO]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOMACCHINAAGGEURO]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOUOMOEURO]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOUOMOAGGEURO]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOINDIRETTOEURO]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOINDIRETTOAGGEURO] DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOESTERNOEURO]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [COSTOESTERNOAGGEURO]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [QTALAVORATA]           DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTALAVORATA] DEFAULT (0) NULL,
    [QTALAVORATAFASE]       DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTALAVORATAFASE] DEFAULT (0) NULL,
    [QTADELTALAVORATA]      DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTADELTALAVORATA] DEFAULT (0) NULL,
    [QTAVERSATAFASE]        DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTAVERSATAFASE] DEFAULT (0) NULL,
    [QTASCARTATAFASE]       DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTASCARTATAFASE] DEFAULT (0) NULL,
    [QTARILAVORATAFASE]     DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTARILAVORATAFASE] DEFAULT (0) NULL,
    [UMFASE]                VARCHAR (3)     NULL,
    [QTATRASFERITA]         DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTATRASFERITA] DEFAULT (0) NULL,
    [QTATRASFERITAFASE]     DECIMAL (16, 6) CONSTRAINT [DF_STORICOAVANZAMENTI_QTATRASFERITAFASE] DEFAULT (0) NULL,
    [RIFTESTADOCUMENTO]     DECIMAL (10)    NULL,
    [RIFRIGADOCUMENTO]      INT             NULL,
    [MOVIMENTOAUTOMATICO]   SMALLINT        CONSTRAINT [DF_STORICOAVANZAMENTI_MOVIMENTOAUTOMATICO] DEFAULT (0) NULL,
    [PARTITA]               VARCHAR (15)    CONSTRAINT [DF_STORICOAVANZAMENTI_PARTITA] DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
/* DELETE TRIGGER "TD_STORICOAVANZAMENTI" FOR TABLE "STORICOAVANZAMENTI" */
CREATE TRIGGER TD_STORICOAVANZAMENTI ON  STORICOAVANZAMENTI FOR DELETE AS
BEGIN

DECLARE
@NUMROWS INT,
@ERRNO INT,
@ERRMSG VARCHAR(255)

SELECT @NUMROWS = @@ROWCOUNT
IF @NUMROWS = 0
RETURN

/* DELETE CASCADE */   /* per OGNI Tabella CHILD in Relazione */
/* DELETE ALL CHILDREN IN "EXTRAAVANZAMENTI" */
DELETE EXTRAAVANZAMENTI
FROM EXTRAAVANZAMENTI T2, DELETED T1
WHERE T2.RIFPROGRESSIVO = T1.PROGRESSIVO

RETURN

/* ERRORS HANDLING */
ERROR:
RAISERROR (@ERRMSG, 1, 1)
ROLLBACK TRANSACTION

END

GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOAVANZAMENTI] TO [Metodo98]
    AS [dbo];

