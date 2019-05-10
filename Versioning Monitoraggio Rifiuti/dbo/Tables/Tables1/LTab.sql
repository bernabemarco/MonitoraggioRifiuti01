CREATE TABLE [dbo].[LTab] (
    [LTabCNomeBreve]  VARCHAR (5)    NULL,
    [LTabCNomeLungo]  VARCHAR (80)   NOT NULL,
    [LTabDHelpString] VARCHAR (1024) NULL,
    [LTabWAttributi]  VARCHAR (80)   NULL,
    [LTabBLoggare]    VARCHAR (1)    NULL,
    [LtabIProprieta]  VARCHAR (3)    DEFAULT ('S') NOT NULL,
    [LTabWNomePkUte]  VARCHAR (80)   NULL,
    [LTabAbilitaIR]   INT            CONSTRAINT [LTabAbilitaIRdflt] DEFAULT ((0)) NULL,
    CONSTRAINT [ltabprimary] PRIMARY KEY CLUSTERED ([LTabCNomeLungo] ASC)
);

