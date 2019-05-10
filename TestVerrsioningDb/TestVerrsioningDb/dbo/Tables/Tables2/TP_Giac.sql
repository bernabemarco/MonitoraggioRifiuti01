CREATE TABLE [dbo].[TP_Giac] (
    [CodArt]    VARCHAR (50)    NOT NULL,
    [Deposito]  VARCHAR (10)    NOT NULL,
    [Giacenza]  NUMERIC (16, 6) NULL,
    [Ordinato]  NUMERIC (16, 6) NULL,
    [Impegnato] NUMERIC (16, 6) NULL,
    [NumOrdFor] NUMERIC (4)     NULL,
    PRIMARY KEY CLUSTERED ([CodArt] ASC, [Deposito] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Giac] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Giac] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Giac] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Giac] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Giac] TO [Metodo98]
    AS [dbo];

