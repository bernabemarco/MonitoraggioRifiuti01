﻿CREATE TABLE [dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] (
    [RIFPROGRESSIVO]     DECIMAL (10)    DEFAULT (0) NOT NULL,
    [CONTRATTO]          DECIMAL (10)    DEFAULT (0) NOT NULL,
    [RIFINCONDIZIONATO]  DECIMAL (18)    DEFAULT (0) NOT NULL,
    [RIGAINCONDIZIONATO] INT             DEFAULT (0) NOT NULL,
    [CONSUNTIVO]         DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [CONTRATTO] ASC, [RIFINCONDIZIONATO] ASC, [RIGAINCONDIZIONATO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOINCONDPERC] TO [Metodo98]
    AS [dbo];

