CREATE TABLE [dbo].[Lkey] (
    [LkeyCNome]      VARCHAR (80) NOT NULL,
    [LkeyCTipo]      VARCHAR (1)  NULL,
    [LkeyIProprieta] VARCHAR (3)  DEFAULT ('S') NOT NULL,
    [lkeyCltab]      VARCHAR (80) DEFAULT ('') NOT NULL,
    [LkeyCFisLog]    VARCHAR (1)  DEFAULT ('F') NULL,
    CONSTRAINT [lkeyprimary] PRIMARY KEY CLUSTERED ([lkeyCltab] ASC, [LkeyCNome] ASC)
);

