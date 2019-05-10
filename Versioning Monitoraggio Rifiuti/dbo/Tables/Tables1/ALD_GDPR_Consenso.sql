CREATE TABLE [dbo].[ALD_GDPR_Consenso] (
    [Codice]         VARCHAR (1)  DEFAULT ('N') NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NULL,
    [DATAMODIFICA]   DATETIME     NULL,
    CONSTRAINT [PK_ALD_GDPR_Consenso] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GDPR_Consenso] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GDPR_Consenso] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GDPR_Consenso] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GDPR_Consenso] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GDPR_Consenso] TO [Metodo98]
    AS [dbo];

