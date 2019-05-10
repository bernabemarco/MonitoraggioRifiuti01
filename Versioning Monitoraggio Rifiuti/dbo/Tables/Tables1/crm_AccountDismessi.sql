CREATE TABLE [dbo].[crm_AccountDismessi] (
    [CodConto]            VARCHAR (7)   NOT NULL,
    [Descrizione]         VARCHAR (80)  NULL,
    [Piva]                VARCHAR (11)  NULL,
    [CF]                  VARCHAR (16)  NULL,
    [dtValutazioneCerved] SMALLDATETIME NULL,
    [Usato]               SMALLINT      DEFAULT ((0)) NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        SMALLDATETIME NOT NULL,
    [usatoDoc]            SMALLINT      DEFAULT ((0)) NULL,
    [usatoGemma]          SMALLINT      DEFAULT ((0)) NULL,
    [usatoMedicina]       SMALLINT      DEFAULT ((0)) NULL,
    [ScadenzeAperte]      SMALLINT      DEFAULT ((0)) NULL,
    [saldoCont]           SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [PK_crm_AccountDismessi] PRIMARY KEY CLUSTERED ([CodConto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[crm_AccountDismessi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[crm_AccountDismessi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[crm_AccountDismessi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[crm_AccountDismessi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[crm_AccountDismessi] TO [Metodo98]
    AS [dbo];

