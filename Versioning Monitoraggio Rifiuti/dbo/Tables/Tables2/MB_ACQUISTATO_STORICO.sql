﻿CREATE TABLE [dbo].[MB_ACQUISTATO_STORICO] (
    [PROGRESSIVO]    DECIMAL (10)    IDENTITY (1, 1) NOT NULL,
    [DATA]           DECIMAL (8)     NOT NULL,
    [CODARTICOLO]    VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [NRRIFPARTITA]   VARCHAR (20)    NOT NULL,
    [Codice]         VARCHAR (5)     DEFAULT ('') NOT NULL,
    [TIPO]           SMALLINT        DEFAULT ((0)) NOT NULL,
    [UM]             VARCHAR (3)     NOT NULL,
    [QTA]            DECIMAL (16, 6) NOT NULL,
    [VALORENETTO]    DECIMAL (19, 4) NOT NULL,
    [VALORELORDO]    DECIMAL (19, 4) NOT NULL,
    [VALOREPREMIO]   DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [ULTIMO]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MB_ACQUISTATO_STORICO]
    ON [dbo].[MB_ACQUISTATO_STORICO]([TIPO] ASC, [DATA] ASC, [CODDEPOSITO] ASC, [CODARTICOLO] ASC, [NRRIFPARTITA] ASC, [Codice] ASC, [UM] ASC)
    INCLUDE([QTA], [VALORELORDO], [VALORENETTO], [VALOREPREMIO]);


GO
CREATE NONCLUSTERED INDEX [IDX_MB_ACQUISTATO_STORICO_CODARTICOLO_NRRIFPARTITA]
    ON [dbo].[MB_ACQUISTATO_STORICO]([CODARTICOLO] ASC, [NRRIFPARTITA] ASC)
    INCLUDE([DATA], [CODDEPOSITO], [UM], [QTA], [VALORENETTO], [ULTIMO]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_ACQUISTATO_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_ACQUISTATO_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_ACQUISTATO_STORICO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_ACQUISTATO_STORICO] TO [Metodo98]
    AS [dbo];
