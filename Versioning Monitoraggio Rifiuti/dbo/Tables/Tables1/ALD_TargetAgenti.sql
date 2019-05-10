CREATE TABLE [dbo].[ALD_TargetAgenti] (
    [Ditta]              VARCHAR (50)    NOT NULL,
    [CodAgente]          VARCHAR (7)     NOT NULL,
    [AnnoTarget]         SMALLINT        NOT NULL,
    [MeseTarget]         SMALLINT        NOT NULL,
    [FamigliaId]         SMALLINT        NOT NULL,
    [ImportoTarget]      DECIMAL (19, 4) CONSTRAINT [DF_ALD_TargetAgenti_ImportoTarget] DEFAULT (0) NULL,
    [UtenteModfica]      VARCHAR (25)    NOT NULL,
    [DataModifica]       SMALLDATETIME   NOT NULL,
    [ValoreDelVenduto]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [Forecast3_9]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [Forecast6_6]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [Forecast9_3]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [TargetCommisionato] DECIMAL (19, 4) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TargetAgenti] PRIMARY KEY CLUSTERED ([Ditta] ASC, [CodAgente] ASC, [AnnoTarget] ASC, [MeseTarget] ASC, [FamigliaId] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TargetAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TargetAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TargetAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TargetAgenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TargetAgenti] TO [Metodo98]
    AS [dbo];

