﻿CREATE TABLE [dbo].[TP_CALENDARIOCOMMERCIALE] (
    [ANNOCAL]        NUMERIC (18)   NOT NULL,
    [MESECAL]        NUMERIC (18)   NOT NULL,
    [GIORNOCAL]      NUMERIC (18)   NOT NULL,
    [CODDITTA]       VARCHAR (25)   NULL,
    [DATACAL]        DATETIME       NULL,
    [FESTIVO]        SMALLINT       DEFAULT (0) NULL,
    [ORELAV]         NUMERIC (6, 4) NULL,
    [DAORA1T]        DATETIME       NULL,
    [AORA1T]         DATETIME       NULL,
    [SOSTA1T]        DATETIME       NULL,
    [DAORA2T]        DATETIME       NULL,
    [AORA2T]         DATETIME       NULL,
    [SOSTA2T]        DATETIME       NULL,
    [DAORA3T]        DATETIME       NULL,
    [AORA3T]         DATETIME       NULL,
    [SOSTA3T]        DATETIME       NULL,
    [DAORA4T]        DATETIME       NULL,
    [AORA4T]         DATETIME       NULL,
    [SOSTA4T]        DATETIME       NULL,
    [UTENTEMODIFICA] VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([ANNOCAL] ASC, [MESECAL] ASC, [GIORNOCAL] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_CALENDARIOCOMMERCIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_CALENDARIOCOMMERCIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_CALENDARIOCOMMERCIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_CALENDARIOCOMMERCIALE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_CALENDARIOCOMMERCIALE] TO [Metodo98]
    AS [dbo];
