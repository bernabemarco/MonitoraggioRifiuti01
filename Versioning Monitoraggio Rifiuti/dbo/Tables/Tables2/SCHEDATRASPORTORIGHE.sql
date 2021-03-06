﻿CREATE TABLE [dbo].[SCHEDATRASPORTORIGHE] (
    [PROGRESSIVODOC] DECIMAL (10) NOT NULL,
    [IDRIGA]         DECIMAL (10) NOT NULL,
    [POSIZIONE]      SMALLINT     NOT NULL,
    [CODCCONTO]      VARCHAR (7)  NULL,
    [RAGSOC]         VARCHAR (80) NULL,
    [INDIRIZZO]      VARCHAR (80) NULL,
    [CAP]            VARCHAR (8)  NULL,
    [LOCALITA]       VARCHAR (80) NULL,
    [PROVINCIA]      VARCHAR (4)  NULL,
    [TELEFONO]       VARCHAR (25) NULL,
    [EMAIL]          VARCHAR (50) NULL,
    [CODNAZIONE]     DECIMAL (5)  NULL,
    [PARTITAIVA]     VARCHAR (12) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_SCHEDATRASPORTORIGHE] PRIMARY KEY CLUSTERED ([PROGRESSIVODOC] ASC, [POSIZIONE] ASC),
    CONSTRAINT [FK_SCHEDATRASPORTORIGHE] FOREIGN KEY ([PROGRESSIVODOC]) REFERENCES [dbo].[SCHEDATRASPORTO] ([PROGRESSIVODOC]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SCHEDATRASPORTORIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SCHEDATRASPORTORIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SCHEDATRASPORTORIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SCHEDATRASPORTORIGHE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SCHEDATRASPORTORIGHE] TO [Metodo98]
    AS [dbo];

