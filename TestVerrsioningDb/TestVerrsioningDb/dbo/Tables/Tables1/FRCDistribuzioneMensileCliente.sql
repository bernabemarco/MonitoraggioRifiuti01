CREATE TABLE [dbo].[FRCDistribuzioneMensileCliente] (
    [Ambiente]            VARCHAR (3)  NOT NULL,
    [Cliente]             VARCHAR (7)  NOT NULL,
    [CodiceDistribuzione] VARCHAR (3)  DEFAULT ('') NULL,
    [UtenteModifica]      VARCHAR (25) NOT NULL,
    [DataModifica]        DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Cliente] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDistribuzioneMensileCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDistribuzioneMensileCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDistribuzioneMensileCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDistribuzioneMensileCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDistribuzioneMensileCliente] TO [Metodo98]
    AS [dbo];

