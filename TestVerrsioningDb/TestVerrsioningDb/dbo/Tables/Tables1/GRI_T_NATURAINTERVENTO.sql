﻿CREATE TABLE [dbo].[GRI_T_NATURAINTERVENTO] (
    [IdTipoIntervento] SMALLINT      NOT NULL,
    [Descrizione]      VARCHAR (80)  NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_GRI_T_NATURAINTERVENTO] PRIMARY KEY CLUSTERED ([IdTipoIntervento] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_T_NATURAINTERVENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_T_NATURAINTERVENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_T_NATURAINTERVENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_T_NATURAINTERVENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_T_NATURAINTERVENTO] TO [Metodo98]
    AS [dbo];
