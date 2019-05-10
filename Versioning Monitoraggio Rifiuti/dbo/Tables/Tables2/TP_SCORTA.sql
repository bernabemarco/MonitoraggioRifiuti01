CREATE TABLE [dbo].[TP_SCORTA] (
    [CodArticolo]              VARCHAR (50)    NOT NULL,
    [CodDeposito]              VARCHAR (10)    NOT NULL,
    [CodFornPref]              VARCHAR (7)     NOT NULL,
    [ScortaSicurezza]          DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LivelloRiordinoCalcolato] DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LivelloRiordinoForzato]   DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [UsaValoreForzato]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica]           VARCHAR (25)    NOT NULL,
    [DataModifica]             DATETIME        NOT NULL,
    [SCORTASICUREZZAFORZATO]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_SCORTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_SCORTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_SCORTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_SCORTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_SCORTA] TO [Metodo98]
    AS [dbo];

