CREATE TABLE [dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] (
    [Esito]          VARCHAR (10)   NULL,
    [IdSocieta]      VARCHAR (4)    NOT NULL,
    [CodConto]       VARCHAR (7)    NOT NULL,
    [NumDDV]         DECIMAL (5)    DEFAULT ((0)) NOT NULL,
    [CodiceSap]      VARCHAR (10)   NULL,
    [rifRagSoc]      VARCHAR (70)   NULL,
    [codBlocco]      VARCHAR (1)    NULL,
    [SocietaPartner] VARCHAR (6)    NULL,
    [ContoMastro]    VARCHAR (10)   NULL,
    [GruppoConti]    VARCHAR (4)    NULL,
    [PivaCodFiscale] VARCHAR (16)   NULL,
    [PIva]           VARCHAR (11)   NULL,
    [txtLog]         VARCHAR (1000) NULL,
    [UtenteModifica] VARCHAR (25)   NOT NULL,
    [DataModifica]   DATETIME       NOT NULL,
    [CodiceRiga]     VARCHAR (1)    DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_CONS_ALD_FI_AA_Clienti_Ritorno] PRIMARY KEY CLUSTERED ([IdSocieta] ASC, [CodConto] ASC, [NumDDV] ASC, [DataModifica] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_FI_AA_Clienti_Ritorno] TO [Metodo98]
    AS [dbo];

