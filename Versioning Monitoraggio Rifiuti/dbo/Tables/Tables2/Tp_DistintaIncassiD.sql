CREATE TABLE [dbo].[Tp_DistintaIncassiD] (
    [CodiceTestata] NUMERIC (10)    NOT NULL,
    [CodiceRiga]    NUMERIC (18)    NOT NULL,
    [TipoPagamento] SMALLINT        NULL,
    [TipoPezzi]     SMALLINT        NULL,
    [ImportoEuro]   NUMERIC (19, 6) NULL,
    [Quantita]      DECIMAL (16, 6) NULL,
    [Descrizione]   VARCHAR (200)   NULL,
    CONSTRAINT [PK_Tp_DistintaIncassiD] PRIMARY KEY CLUSTERED ([CodiceTestata] ASC, [CodiceRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_DistintaIncassiD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_DistintaIncassiD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_DistintaIncassiD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_DistintaIncassiD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_DistintaIncassiD] TO [Metodo98]
    AS [dbo];

