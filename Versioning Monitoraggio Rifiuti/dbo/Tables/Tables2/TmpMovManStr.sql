CREATE TABLE [dbo].[TmpMovManStr] (
    [Terminale]      VARCHAR (3)     NOT NULL,
    [Progressivo]    DECIMAL (10)    NOT NULL,
    [Cespite]        VARCHAR (10)    NOT NULL,
    [Tipo]           DECIMAL (5)     DEFAULT (0) NULL,
    [Descrizione]    VARCHAR (80)    NULL,
    [DtaMovimento]   DATETIME        NULL,
    [NumGGPossesso]  SMALLINT        DEFAULT (0) NULL,
    [NumGGAnnoFisc]  SMALLINT        DEFAULT (0) NULL,
    [ImpMovimento]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpCompetenza]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmInz]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImpImmFin]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [TmpMovManStr_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [Terminale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TmpMovManStr] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TmpMovManStr] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TmpMovManStr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TmpMovManStr] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TmpMovManStr] TO [Metodo98]
    AS [dbo];

