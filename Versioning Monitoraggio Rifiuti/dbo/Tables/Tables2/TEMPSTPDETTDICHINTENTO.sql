﻿CREATE TABLE [dbo].[TEMPSTPDETTDICHINTENTO] (
    [PROGDICH_DI1]          VARCHAR (16)    NULL,
    [PROGDICHRICEV_DI1]     VARCHAR (16)    NULL,
    [PARTITAIVA_DI1]        VARCHAR (16)    NULL,
    [RAGIONESOCIALE_DI1]    VARCHAR (80)    NULL,
    [RAGIONESOCIALE2_DI1]   VARCHAR (80)    NULL,
    [INDIRIZZO_DI1]         VARCHAR (80)    NULL,
    [LOCALITA_DI1]          VARCHAR (80)    NULL,
    [PROVINCIA_DI1]         VARCHAR (2)     NULL,
    [FLGSOLAOPERAZIONE_DI1] SMALLINT        NULL,
    [FLGPERIMPORTO_DI1]     SMALLINT        NULL,
    [FLGNELPERIODO_DI1]     SMALLINT        NULL,
    [PERIODDA_DI1]          DATETIME        NULL,
    [PERIODOA_DI1]          DATETIME        NULL,
    [IMPORTO_DI1]           DECIMAL (19, 4) NULL,
    [PROGDICH_DI2]          VARCHAR (16)    NULL,
    [PROGDICHRICEV_DI2]     VARCHAR (16)    NULL,
    [PARTITAIVA_DI2]        VARCHAR (16)    NULL,
    [RAGIONESOCIALE_DI2]    VARCHAR (80)    NULL,
    [RAGIONESOCIALE2_DI2]   VARCHAR (80)    NULL,
    [INDIRIZZO_DI2]         VARCHAR (80)    NULL,
    [LOCALITA_DI2]          VARCHAR (80)    NULL,
    [PROVINCIA_DI2]         VARCHAR (2)     NULL,
    [FLGSOLAOPERAZIONE_DI2] SMALLINT        NULL,
    [FLGPERIMPORTO_DI2]     SMALLINT        NULL,
    [FLGNELPERIODO_DI2]     SMALLINT        NULL,
    [PERIODDA_DI2]          DATETIME        NULL,
    [PERIODOA_DI2]          DATETIME        NULL,
    [IMPORTO_DI2]           DECIMAL (19, 4) NULL,
    [PROGDICH_DI3]          VARCHAR (16)    NULL,
    [PROGDICHRICEV_DI3]     VARCHAR (16)    NULL,
    [PARTITAIVA_DI3]        VARCHAR (16)    NULL,
    [RAGIONESOCIALE_DI3]    VARCHAR (80)    NULL,
    [RAGIONESOCIALE2_DI3]   VARCHAR (80)    NULL,
    [INDIRIZZO_DI3]         VARCHAR (80)    NULL,
    [LOCALITA_DI3]          VARCHAR (80)    NULL,
    [PROVINCIA_DI3]         VARCHAR (2)     NULL,
    [FLGSOLAOPERAZIONE_DI3] SMALLINT        NULL,
    [FLGPERIMPORTO_DI3]     SMALLINT        NULL,
    [FLGNELPERIODO_DI3]     SMALLINT        NULL,
    [PERIODDA_DI3]          DATETIME        NULL,
    [PERIODOA_DI3]          DATETIME        NULL,
    [IMPORTO_DI3]           DECIMAL (19, 4) NULL,
    [PROGDICH_DI4]          VARCHAR (16)    NULL,
    [PROGDICHRICEV_DI4]     VARCHAR (16)    NULL,
    [PARTITAIVA_DI4]        VARCHAR (16)    NULL,
    [RAGIONESOCIALE_DI4]    VARCHAR (80)    NULL,
    [RAGIONESOCIALE2_DI4]   VARCHAR (80)    NULL,
    [INDIRIZZO_DI4]         VARCHAR (80)    NULL,
    [LOCALITA_DI4]          VARCHAR (80)    NULL,
    [PROVINCIA_DI4]         VARCHAR (2)     NULL,
    [FLGSOLAOPERAZIONE_DI4] SMALLINT        NULL,
    [FLGPERIMPORTO_DI4]     SMALLINT        NULL,
    [FLGNELPERIODO_DI4]     SMALLINT        NULL,
    [PERIODDA_DI4]          DATETIME        NULL,
    [PERIODOA_DI4]          DATETIME        NULL,
    [IMPORTO_DI4]           DECIMAL (19, 4) NULL,
    [CODFISCALE]            VARCHAR (16)    NULL,
    [PROGMODULO]            SMALLINT        NULL,
    [IDSESSIONE]            SMALLINT        NOT NULL,
    [NRRIGA]                SMALLINT        NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTPDETTDICHINTENTO] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGNELPERIODO_DI1] CHECK ([FLGNELPERIODO_DI1] = 1 or [FLGNELPERIODO_DI1] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGNELPERIODO_DI2] CHECK ([FLGNELPERIODO_DI2] = 1 or [FLGNELPERIODO_DI2] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGNELPERIODO_DI3] CHECK ([FLGNELPERIODO_DI3] = 1 or [FLGNELPERIODO_DI3] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGNELPERIODO_DI4] CHECK ([FLGNELPERIODO_DI4] = 1 or [FLGNELPERIODO_DI4] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGPERIMPORTO_DI1] CHECK ([FLGPERIMPORTO_DI1] = 1 or [FLGPERIMPORTO_DI1] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGPERIMPORTO_DI2] CHECK ([FLGPERIMPORTO_DI2] = 1 or [FLGPERIMPORTO_DI2] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGPERIMPORTO_DI3] CHECK ([FLGPERIMPORTO_DI3] = 1 or [FLGPERIMPORTO_DI3] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGPERIMPORTO_DI4] CHECK ([FLGPERIMPORTO_DI4] = 1 or [FLGPERIMPORTO_DI4] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGSOLAOPERAZIONE_DI1] CHECK ([FLGSOLAOPERAZIONE_DI1] = 1 or [FLGSOLAOPERAZIONE_DI1] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGSOLAOPERAZIONE_DI2] CHECK ([FLGSOLAOPERAZIONE_DI2] = 1 or [FLGSOLAOPERAZIONE_DI2] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGSOLAOPERAZIONE_DI3] CHECK ([FLGSOLAOPERAZIONE_DI3] = 1 or [FLGSOLAOPERAZIONE_DI3] = 0),
    CONSTRAINT [CHK_TEMPSTPDETTDICHINTENTO_FLGSOLAOPERAZIONE_DI4] CHECK ([FLGSOLAOPERAZIONE_DI4] = 1 or [FLGSOLAOPERAZIONE_DI4] = 0)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPDETTDICHINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPDETTDICHINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPDETTDICHINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPDETTDICHINTENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPDETTDICHINTENTO] TO [Metodo98]
    AS [dbo];

