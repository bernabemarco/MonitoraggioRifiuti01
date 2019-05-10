CREATE TABLE [dbo].[EC_CambioStato_Tmp] (
    [IdSessione]       DECIMAL (5)  NOT NULL,
    [Progressivo]      DECIMAL (18) NOT NULL,
    [RifProgressivoPN] DECIMAL (10) NOT NULL,
    [SelRiconc]        SMALLINT     NULL,
    [Descrizione]      VARCHAR (80) NULL,
    [Utentemodifica]   VARCHAR (25) NOT NULL,
    [Datamodifica]     DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_CambioStato_Tmp] PRIMARY KEY CLUSTERED ([IdSessione] ASC, [Progressivo] ASC, [RifProgressivoPN] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_CambioStato_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_CambioStato_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_CambioStato_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_CambioStato_Tmp] TO [Metodo98]
    AS [dbo];

