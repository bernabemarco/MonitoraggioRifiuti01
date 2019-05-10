CREATE TABLE [dbo].[CGCPMarginiCalcoloSchede] (
    [TipoScheda]     VARCHAR (5)     NOT NULL,
    [Aggregato]      VARCHAR (10)    NOT NULL,
    [TipoCosto]      DECIMAL (5)     NOT NULL,
    [PercMargine]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([TipoScheda] ASC, [Aggregato] ASC, [TipoCosto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPMarginiCalcoloSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPMarginiCalcoloSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPMarginiCalcoloSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPMarginiCalcoloSchede] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPMarginiCalcoloSchede] TO [Metodo98]
    AS [dbo];

