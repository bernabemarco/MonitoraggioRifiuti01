CREATE TABLE [dbo].[TP_TMP_CCVM] (
    [Fornitore] VARCHAR (7)     NOT NULL,
    [Deposito]  VARCHAR (10)    NOT NULL,
    [Anno]      INT             NOT NULL,
    [Mese]      SMALLINT        NOT NULL,
    [Articolo]  VARCHAR (50)    NOT NULL,
    [Tipo]      CHAR (3)        NOT NULL,
    [Quantita1] DECIMAL (19, 4) NULL,
    [Quantita2] DECIMAL (19, 4) NULL,
    [UM1]       CHAR (2)        NULL,
    [UM2]       CHAR (2)        NULL,
    PRIMARY KEY CLUSTERED ([Fornitore] ASC, [Deposito] ASC, [Anno] ASC, [Mese] ASC, [Articolo] ASC, [Tipo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TMP_CCVM] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TMP_CCVM] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TMP_CCVM] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TMP_CCVM] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TMP_CCVM] TO [Metodo98]
    AS [dbo];

