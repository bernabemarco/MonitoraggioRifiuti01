CREATE TABLE [dbo].[Tp_ElencoVariazioniFull] (
    [MODCHIAVE]     VARCHAR (25) NOT NULL,
    [Codice]        VARCHAR (50) NOT NULL,
    [GRUPPOPRZPART] DECIMAL (5)  NOT NULL,
    PRIMARY KEY CLUSTERED ([MODCHIAVE] ASC, [Codice] ASC, [GRUPPOPRZPART] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_ElencoVariazioniFull] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_ElencoVariazioniFull] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_ElencoVariazioniFull] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_ElencoVariazioniFull] TO [Metodo98]
    AS [dbo];

