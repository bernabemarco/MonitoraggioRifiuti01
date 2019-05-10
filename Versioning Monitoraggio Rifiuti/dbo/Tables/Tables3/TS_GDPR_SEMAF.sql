CREATE TABLE [dbo].[TS_GDPR_SEMAF] (
    [RowId]                    INT          CONSTRAINT [TS_GDPR_SEMAF_DF_RowId] DEFAULT ((0)) NOT NULL,
    [LastExecution]            DATETIME     NULL,
    [SenderId]                 VARCHAR (64) NULL,
    [SenderMachine]            VARCHAR (50) NULL,
    [LastSuccesfullyExecution] DATETIME     NULL,
    [LastSentLogId]            NUMERIC (18) NULL,
    [LastUUID]                 VARCHAR (50) NULL,
    [IsToReset]                CHAR (1)     CONSTRAINT [TS_GDPR_SEMAF_DF_IsToReset] DEFAULT ('0') NOT NULL,
    CONSTRAINT [XPKTS_GDPR_SEMAF] PRIMARY KEY CLUSTERED ([RowId] ASC),
    CONSTRAINT [TS_GDPR_SEMAF_DF_CK_RowId] CHECK ([RowId]>=(0))
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TS_GDPR_SEMAF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TS_GDPR_SEMAF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TS_GDPR_SEMAF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TS_GDPR_SEMAF] TO [Metodo98]
    AS [dbo];

