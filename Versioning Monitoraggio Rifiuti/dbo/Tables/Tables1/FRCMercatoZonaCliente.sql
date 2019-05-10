CREATE TABLE [dbo].[FRCMercatoZonaCliente] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Zona]           DECIMAL (5)  NOT NULL,
    [CDRMercato]     VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Zona] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCMercatoZonaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCMercatoZonaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCMercatoZonaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCMercatoZonaCliente] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCMercatoZonaCliente] TO [Metodo98]
    AS [dbo];

