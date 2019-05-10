﻿CREATE TABLE [dbo].[CONTRATTICL_DATEDOC] (
    [RIFPROGRESSIVOCL]  DECIMAL (10)    NOT NULL,
    [RIFPROGRESSIVO]    DECIMAL (10)    NOT NULL,
    [NRRIGA]            INT             NOT NULL,
    [FLAGRIGA]          SMALLINT        NULL,
    [POSIZIONE]         INT             NULL,
    [DATAEMISSIONE]     DATETIME        NULL,
    [VALORE]            DECIMAL (19, 6) NULL,
    [EMESSO]            SMALLINT        CONSTRAINT [DF_CONTRATTICL_DATEDOC_EMESSO] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [RIFPROGRESSIVODOC] DECIMAL (10)    NULL,
    [VALOREEFFETTIVO]   DECIMAL (19, 6) NULL,
    [DATAEFFETTIVA]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVOCL] ASC, [RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTICL_DATEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTICL_DATEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTICL_DATEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTICL_DATEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTICL_DATEDOC] TO [Metodo98]
    AS [dbo];

