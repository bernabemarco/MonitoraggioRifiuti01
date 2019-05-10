CREATE TABLE [dbo].[SL_TabFamiglie] (
    [CODICE]         SMALLINT     NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_TabFamiglie] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_TabFamiglie] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_TabFamiglie] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_TabFamiglie] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_TabFamiglie] TO [Metodo98]
    AS [dbo];

