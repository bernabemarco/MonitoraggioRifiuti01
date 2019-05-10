CREATE TABLE [dbo].[ALD_GDPR_Param_Privacy] (
    [IdPath]            INT           CONSTRAINT [DF_ALD_GDPR_Param_Privacy_IdPath] DEFAULT ((0)) NOT NULL,
    [PathAttConsCli]    VARCHAR (100) NULL,
    [PathAttConsRubCli] VARCHAR (100) NULL,
    [PathInformCli]     VARCHAR (100) NULL,
    [PathNomRicCli]     VARCHAR (100) NULL,
    [PathAttConsFor]    VARCHAR (100) NULL,
    [PathAttConsRubFor] VARCHAR (100) NULL,
    [PathInformFor]     VARCHAR (100) NULL,
    [PathAttConsCond]   VARCHAR (100) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)  NULL,
    [DATAMODIFICA]      DATETIME      NULL,
    CONSTRAINT [PK_ALD_GDPR_Param_Privacy] PRIMARY KEY CLUSTERED ([IdPath] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GDPR_Param_Privacy] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GDPR_Param_Privacy] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GDPR_Param_Privacy] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GDPR_Param_Privacy] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GDPR_Param_Privacy] TO [Metodo98]
    AS [dbo];

