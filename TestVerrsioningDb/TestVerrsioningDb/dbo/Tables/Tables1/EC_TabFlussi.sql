CREATE TABLE [dbo].[EC_TabFlussi] (
    [Progressivo]    DECIMAL (10) NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [DaData]         DATETIME     NULL,
    [AData]          DATETIME     NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_Flussi] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabFlussi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabFlussi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabFlussi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabFlussi] TO [Metodo98]
    AS [dbo];

