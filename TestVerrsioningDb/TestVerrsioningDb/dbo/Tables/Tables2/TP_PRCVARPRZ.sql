﻿CREATE TABLE [dbo].[TP_PRCVARPRZ] (
    [CODICE]      VARCHAR (50)   NOT NULL,
    [DESCRIZIONE] VARCHAR (80)   NULL,
    [TIPO]        SMALLINT       NULL,
    [PERCENTUALE] DECIMAL (5, 2) NULL,
    CONSTRAINT [PK_TP_PRCVARPRZ] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PRCVARPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PRCVARPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PRCVARPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PRCVARPRZ] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PRCVARPRZ] TO [Metodo98]
    AS [dbo];

