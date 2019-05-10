CREATE TABLE [dbo].[TP_PUNTOFISSORIORDINO] (
    [CodArticolo]              VARCHAR (50)    NOT NULL,
    [CodDeposito]              VARCHAR (10)    NOT NULL,
    [CodFornPref]              VARCHAR (7)     NOT NULL,
    [ScortaSicurezzaCalcolata] DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [QtaObiettivoCalcolata]    DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ScortaSicurezzaForzato]   DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [QtaObiettivoForzato]      DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [UsaValoreForzato]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica]           VARCHAR (25)    NOT NULL,
    [DataModifica]             DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PUNTOFISSORIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PUNTOFISSORIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PUNTOFISSORIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PUNTOFISSORIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PUNTOFISSORIORDINO] TO [Metodo98]
    AS [dbo];

