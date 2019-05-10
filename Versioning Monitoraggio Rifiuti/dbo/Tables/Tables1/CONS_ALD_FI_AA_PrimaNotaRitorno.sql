CREATE TABLE [dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] (
    [Esito]          VARCHAR (2)    NULL,
    [IdSocieta]      VARCHAR (4)    NOT NULL,
    [NumeroDoc]      DECIMAL (10)   NOT NULL,
    [NumeroDocSAP]   VARCHAR (10)   NOT NULL,
    [ESERCIZIO]      DECIMAL (5)    NULL,
    [txtLog]         VARCHAR (1000) NULL,
    [UtenteModifica] VARCHAR (25)   NOT NULL,
    [DataModifica]   DATETIME       NOT NULL,
    CONSTRAINT [PK_CONS_ALD_FI_AA_PrimaNotaRitorno] PRIMARY KEY CLUSTERED ([IdSocieta] ASC, [NumeroDoc] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_PrimaNotaRitorno] TO [Metodo98]
    AS [dbo];

