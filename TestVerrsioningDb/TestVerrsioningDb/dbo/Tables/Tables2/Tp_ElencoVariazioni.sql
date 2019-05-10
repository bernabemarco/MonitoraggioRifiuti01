CREATE TABLE [dbo].[Tp_ElencoVariazioni] (
    [MODCHIAVE]     VARCHAR (25) NOT NULL,
    [Codice]        VARCHAR (50) NOT NULL,
    [GRUPPOPRZPART] DECIMAL (5)  NOT NULL,
    CONSTRAINT [PK_Tp_ElencoVariazioni] PRIMARY KEY NONCLUSTERED ([MODCHIAVE] ASC, [Codice] ASC, [GRUPPOPRZPART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_ElencoVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_ElencoVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_ElencoVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_ElencoVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_ElencoVariazioni] TO [Metodo98]
    AS [dbo];

