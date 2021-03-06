﻿CREATE TABLE [dbo].[ALD_TargetAsaAgenti2] (
    [Ditta]              VARCHAR (50)    NOT NULL,
    [CodAgente2]         VARCHAR (7)     NOT NULL,
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
    CONSTRAINT [PK_ALD_TargetAsaAgenti2] PRIMARY KEY CLUSTERED ([Ditta] ASC, [CodAgente2] ASC, [AnnoTarget] ASC, [MeseTarget] ASC, [IdAsa] ASC, [idOrFatt] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TargetAsaAgenti2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TargetAsaAgenti2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TargetAsaAgenti2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TargetAsaAgenti2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TargetAsaAgenti2] TO [Metodo98]
    AS [dbo];

