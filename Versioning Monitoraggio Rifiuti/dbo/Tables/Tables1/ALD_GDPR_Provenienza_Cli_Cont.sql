CREATE TABLE [dbo].[ALD_GDPR_Provenienza_Cli_Cont] (
    [IdCodice]       VARCHAR (6)   NOT NULL,
    [DescrProvCli]   VARCHAR (100) NULL,
    [NoteProvCli]    VARCHAR (100) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    CONSTRAINT [PK_ALD_GDPR_Provenienza_Cli_Cont] PRIMARY KEY CLUSTERED ([IdCodice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GDPR_Provenienza_Cli_Cont] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GDPR_Provenienza_Cli_Cont] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GDPR_Provenienza_Cli_Cont] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GDPR_Provenienza_Cli_Cont] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GDPR_Provenienza_Cli_Cont] TO [Metodo98]
    AS [dbo];

