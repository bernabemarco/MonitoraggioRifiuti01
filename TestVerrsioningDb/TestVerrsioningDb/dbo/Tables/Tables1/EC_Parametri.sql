CREATE TABLE [dbo].[EC_Parametri] (
    [Progressivo]     DECIMAL (5)   NOT NULL,
    [CodContoDef]     VARCHAR (7)   NULL,
    [CodCausaleDef]   DECIMAL (10)  NULL,
    [Utentemodifica]  VARCHAR (25)  NOT NULL,
    [Datamodifica]    DATETIME      NOT NULL,
    [PathBackup]      VARCHAR (250) DEFAULT ('') NOT NULL,
    [GestioneDataReg] SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EC_Parametri] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_Parametri] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_Parametri] TO [Metodo98]
    AS [dbo];

