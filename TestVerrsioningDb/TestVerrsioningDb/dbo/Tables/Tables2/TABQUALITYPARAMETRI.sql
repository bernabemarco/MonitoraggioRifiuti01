﻿CREATE TABLE [dbo].[TABQUALITYPARAMETRI] (
    [PROGRESSIVO]        INT          NOT NULL,
    [TIPOTRASC_ART]      SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_TIPOTRASCART] DEFAULT ((0)) NOT NULL,
    [TIPORIS_ELEM]       SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_TIPORISELEM] DEFAULT ((0)) NOT NULL,
    [CLIENTE]            VARCHAR (7)  NULL,
    [FORNITORE]          VARCHAR (7)  NULL,
    [FLGACQPIENO]        SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGACQPIENO] DEFAULT ((1)) NOT NULL,
    [FLGTRASF]           SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGTRASF] DEFAULT ((1)) NOT NULL,
    [FLGLAVORAZ]         SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGLAVORAZ] DEFAULT ((1)) NOT NULL,
    [FLGAVANZINT]        SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGAVANZINT] DEFAULT ((1)) NOT NULL,
    [FLGVERSFINALE]      SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGVERSFINALE] DEFAULT ((1)) NOT NULL,
    [FLGNOTRASC]         SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGNOTRASC] DEFAULT ((0)) NOT NULL,
    [FLGARTTIP]          SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGARTTIP] DEFAULT ((0)) NOT NULL,
    [FLGLISTEMOVCLAV]    SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGLISTEMOVCLAV] DEFAULT ((0)) NOT NULL,
    [FLGLISTETRASFLOTTI] SMALLINT     CONSTRAINT [DF_TABQUALITYPARAMETRI_FLGLISTETRASFLOTTI] DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABQUALITYPARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABQUALITYPARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABQUALITYPARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABQUALITYPARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABQUALITYPARAMETRI] TO [Metodo98]
    AS [dbo];
