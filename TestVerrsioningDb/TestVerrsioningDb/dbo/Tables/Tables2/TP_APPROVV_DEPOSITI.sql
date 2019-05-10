CREATE TABLE [dbo].[TP_APPROVV_DEPOSITI] (
    [CodArticolo]              VARCHAR (50)    NOT NULL,
    [CodDeposito]              VARCHAR (10)    NOT NULL,
    [CodFornPref]              VARCHAR (7)     NOT NULL,
    [ScortaMinimaCalcolata]    DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LivelloRiordinoCalcolato] DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LottoRiordinoCalcolato]   DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ScortaMinimaForzato]      DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LivelloRiordinoForzato]   DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [LottoRiordinoForzato]     DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [UsaValoreForzato]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica]           VARCHAR (25)    NOT NULL,
    [DataModifica]             DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_APPROVV_DEPOSITI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_APPROVV_DEPOSITI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_APPROVV_DEPOSITI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_APPROVV_DEPOSITI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_APPROVV_DEPOSITI] TO [Metodo98]
    AS [dbo];

