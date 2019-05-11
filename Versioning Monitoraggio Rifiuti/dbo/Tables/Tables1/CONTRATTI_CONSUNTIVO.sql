﻿CREATE TABLE [dbo].[CONTRATTI_CONSUNTIVO] (
    [PROGRESSIVO]      DECIMAL (10)    IDENTITY (1, 1) NOT NULL,
    [RIFCONTRATTO]     DECIMAL (10)    NULL,
    [UM]               VARCHAR (3)     NULL,
    [QTA]              DECIMAL (18)    NULL,
    [CONSUNTIVOINCOND] DECIMAL (19, 6) NULL,
    [QTA2]             DECIMAL (18)    NULL,
    [CONSUNTIVOCOND]   DECIMAL (19, 6) NULL,
    [NOTE]             VARCHAR (500)   NULL,
    [VALOREPREMIO]     DECIMAL (19, 6) NULL,
    [CLIFOR]           VARCHAR (7)     NULL,
    [DESCCLIFOR]       VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CONSUNTIVO] TO [Metodo98]
    AS [dbo];
