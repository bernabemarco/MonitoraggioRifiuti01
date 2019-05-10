CREATE TABLE [dbo].[CRM_TipoDocPubblicati] (
    [Codice]         VARCHAR (3)   NOT NULL,
    [DscCRMTipoDoc]  VARCHAR (80)  NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_CRM_TipoDocPubblicati] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_TipoDocPubblicati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_TipoDocPubblicati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_TipoDocPubblicati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_TipoDocPubblicati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_TipoDocPubblicati] TO [Metodo98]
    AS [dbo];

