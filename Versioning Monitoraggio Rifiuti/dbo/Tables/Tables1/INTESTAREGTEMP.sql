﻿CREATE TABLE [dbo].[INTESTAREGTEMP] (
    [NRTERMINALE]    DECIMAL (5)  NOT NULL,
    [PAGINA]         INT          NOT NULL,
    [TIPOREGISTRO]   VARCHAR (50) NULL,
    [RAGSOC]         VARCHAR (80) NULL,
    [INDIRIZZO]      VARCHAR (80) NULL,
    [LOCALITA]       VARCHAR (80) NULL,
    [CAP]            VARCHAR (8)  NULL,
    [CODICEFISCALE]  VARCHAR (16) NULL,
    [PARTITAIVA]     VARCHAR (12) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_INTESTAREGTEMP] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [PAGINA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[INTESTAREGTEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[INTESTAREGTEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[INTESTAREGTEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[INTESTAREGTEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[INTESTAREGTEMP] TO [Metodo98]
    AS [dbo];

