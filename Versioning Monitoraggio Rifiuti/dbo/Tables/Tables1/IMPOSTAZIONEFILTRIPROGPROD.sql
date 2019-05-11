﻿CREATE TABLE [dbo].[IMPOSTAZIONEFILTRIPROGPROD] (
    [NOMEIMPOSTAZIONE]        VARCHAR (50)   NOT NULL,
    [NOMEUTENTE]              VARCHAR (25)   NOT NULL,
    [FILTROARTICOLI]          VARCHAR (2000) NULL,
    [FILTROCLIENTI]           VARCHAR (2000) NULL,
    [FILTROFORNITORI]         VARCHAR (2000) NULL,
    [CLI_APPLICAFILTROART]    SMALLINT       NULL,
    [CLI_APPLICAFILTROANA]    SMALLINT       NULL,
    [CLI_FILTRODATACONSEGNA]  SMALLINT       NULL,
    [CLI_DATACONSEGNA]        DATETIME       NULL,
    [FOR_APPLICAFILTROART]    SMALLINT       NULL,
    [FOR_APPLICAFILTROANA]    SMALLINT       NULL,
    [FOR_FILTRODATACONSEGNA]  SMALLINT       NULL,
    [FOR_DATACONSEGNA]        DATETIME       NULL,
    [FOR_FILTROTIPORIGA]      SMALLINT       NULL,
    [PROD_APPLICAFILTROART]   SMALLINT       NULL,
    [PROD_APPLICAFILTROANA]   SMALLINT       NULL,
    [PROD_FILTRODATACONSEGNA] SMALLINT       NULL,
    [PROD_DATACONSEGNA]       DATETIME       NULL,
    [PROD_FILTROTIPORIGA]     SMALLINT       NULL,
    [UTENTEMODIFICA]          VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]            DATETIME       NULL,
    [PROD_APPLICAFILTROANA2]  SMALLINT       NULL,
    PRIMARY KEY CLUSTERED ([NOMEIMPOSTAZIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IMPOSTAZIONEFILTRIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IMPOSTAZIONEFILTRIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[IMPOSTAZIONEFILTRIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IMPOSTAZIONEFILTRIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IMPOSTAZIONEFILTRIPROGPROD] TO [Metodo98]
    AS [dbo];
