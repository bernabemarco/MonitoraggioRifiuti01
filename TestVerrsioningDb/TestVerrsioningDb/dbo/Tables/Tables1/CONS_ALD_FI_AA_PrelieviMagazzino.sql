CREATE TABLE [dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] (
    [ProgressivoStoricoMag] DECIMAL (10)    NOT NULL,
    [ESERCIZIO]             DECIMAL (5)     NULL,
    [PERIODO]               DECIMAL (5)     NULL,
    [CodArticolo]           VARCHAR (50)    NOT NULL,
    [RifCommessa]           VARCHAR (30)    NULL,
    [Qta]                   DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [ImportoEuroUPA]        DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [ImportoEuroCMP]        DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [CODCAUSALE]            DECIMAL (5)     NOT NULL,
    [ProgressivoMovCont]    DECIMAL (10)    NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          DATETIME        NOT NULL,
    [MovDefinitivo]         SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK_CONS_ALD_FI_AA_PrelieviMagazzino] PRIMARY KEY CLUSTERED ([ProgressivoStoricoMag] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrelieviMagazzino] TO [Metodo98]
    AS [dbo];

