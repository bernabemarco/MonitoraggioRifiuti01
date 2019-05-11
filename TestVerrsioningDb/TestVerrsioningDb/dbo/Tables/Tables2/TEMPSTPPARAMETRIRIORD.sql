﻿CREATE TABLE [dbo].[TEMPSTPPARAMETRIRIORD] (
    [CODART]          VARCHAR (50)    NULL,
    [UM]              VARCHAR (3)     NULL,
    [LOTTORIORD]      DECIMAL (16, 6) NULL,
    [LIVELLORIORD]    DECIMAL (16, 6) NULL,
    [SCORTA]          DECIMAL (16, 6) NULL,
    [CONSUMOANNUO]    DECIMAL (16, 6) NULL,
    [MESICAMPIONE]    SMALLINT        NULL,
    [CONSUMOMESICAMP] DECIMAL (16, 6) NULL,
    [COSTOORDINE]     DECIMAL (19, 6) NULL,
    [COSTOART]        DECIMAL (19, 6) NULL,
    [COSTOARTEURO]    DECIMAL (19, 6) NULL,
    [TASSOMANTSCORTA] DECIMAL (8, 5)  NULL,
    [GGLAV]           SMALLINT        NULL,
    [GGCOPERTURA]     SMALLINT        NULL,
    [LEADTIME]        DECIMAL (16, 6) NULL,
    [FATTORESCOST]    DECIMAL (16, 6) NULL,
    [IDSESSIONE]      INT             NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPPARAMETRIRIORD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPPARAMETRIRIORD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPPARAMETRIRIORD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPPARAMETRIRIORD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPPARAMETRIRIORD] TO [Metodo98]
    AS [dbo];
