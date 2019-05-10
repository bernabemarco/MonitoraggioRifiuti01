CREATE TABLE [dbo].[GDPR_Registry] (
    [Identifier]            VARCHAR (200) CONSTRAINT [DF_GDPR_Registry_Identifier] DEFAULT (newid()) NOT NULL,
    [CUser_code]            VARCHAR (200) NOT NULL,
    [TSID_CompanyCode]      VARCHAR (200) NOT NULL,
    [TSID_InstallationCode] VARCHAR (200) NOT NULL,
    [TSID_EnvironmentCode]  VARCHAR (200) NOT NULL,
    [Status]                INT           NULL,
    [URI]                   VARCHAR (800) NULL,
    [DataVerify]            DATETIME      NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GDPR_Registry] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GDPR_Registry] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GDPR_Registry] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GDPR_Registry] TO [Metodo98]
    AS [dbo];

