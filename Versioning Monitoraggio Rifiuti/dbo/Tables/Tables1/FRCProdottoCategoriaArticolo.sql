﻿CREATE TABLE [dbo].[FRCProdottoCategoriaArticolo] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Categoria]      DECIMAL (5)  NOT NULL,
    [CDRProdotto]    VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Categoria] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCProdottoCategoriaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCProdottoCategoriaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCProdottoCategoriaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCProdottoCategoriaArticolo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCProdottoCategoriaArticolo] TO [Metodo98]
    AS [dbo];

