CREATE TABLE [dbo].[ALD_TargetAsaRicavi] (
    [Ditta]              VARCHAR (50)    NOT NULL,
    [AnnoTarget]         SMALLINT        NOT NULL,
    [MeseTarget]         SMALLINT        NOT NULL,
    [IdAsa]              VARCHAR (2)     NOT NULL,
    [idOrFatt]           SMALLINT        NOT NULL,
    [ImportoTarget]      DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [UtenteModfica]      VARCHAR (25)    NOT NULL,
    [DataModifica]       SMALLDATETIME   NOT NULL,
    [Forecast3_9]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [Forecast6_6]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [Forecast9_3]        DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [TargetCommisionato] DECIMAL (19, 4) DEFAULT ((0)) NULL,
    [TargetRicavo]       DECIMAL (19, 4) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TargetGenericiRicavi] PRIMARY KEY CLUSTERED ([Ditta] ASC, [AnnoTarget] ASC, [MeseTarget] ASC, [IdAsa] ASC, [idOrFatt] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TargetAsaRicavi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TargetAsaRicavi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TargetAsaRicavi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TargetAsaRicavi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TargetAsaRicavi] TO [Metodo98]
    AS [dbo];

