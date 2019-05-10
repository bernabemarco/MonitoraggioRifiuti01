CREATE TABLE [dbo].[EC_MovimentiEcPn] (
    [Progressivo]      DECIMAL (18) NOT NULL,
    [RifProgressivoPN] DECIMAL (18) NOT NULL,
    [RifRigaPN]        SMALLINT     NOT NULL,
    [RifProgressivoEC] DECIMAL (18) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    CONSTRAINT [PK_EC_MovimentiEcPn] PRIMARY KEY CLUSTERED ([Progressivo] ASC, [RifProgressivoPN] ASC, [RifRigaPN] ASC, [RifProgressivoEC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_MovimentiEcPn] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_MovimentiEcPn] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_MovimentiEcPn] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_MovimentiEcPn] TO [Metodo98]
    AS [dbo];

