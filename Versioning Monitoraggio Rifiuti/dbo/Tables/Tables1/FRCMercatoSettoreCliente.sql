CREATE TABLE [dbo].[FRCMercatoSettoreCliente] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Settore]        DECIMAL (5)  NOT NULL,
    [CDRMercato]     VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Settore] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCMercatoSettoreCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCMercatoSettoreCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCMercatoSettoreCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCMercatoSettoreCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCMercatoSettoreCliente] TO [Metodo98]
    AS [dbo];

