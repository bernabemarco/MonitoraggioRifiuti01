﻿CREATE TABLE [dbo].[TEMPSTAMPALIFO] (
    [NRTERMINALE]         SMALLINT        NOT NULL,
    [CODART]              VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]         VARCHAR (10)    NOT NULL,
    [UM]                  VARCHAR (3)     NULL,
    [QTA]                 DECIMAL (16, 6) NULL,
    [VALUNIT]             DECIMAL (19, 6) NULL,
    [VALUNITEURO]         DECIMAL (19, 6) NULL,
    [NRIFPARTITA]         VARCHAR (15)    CONSTRAINT [DF_TEMPSTAMPALIFO_NRIFPARTITA] DEFAULT ('') NOT NULL,
    [ULTCOSTOORIGINEEURO] DECIMAL (19, 6) NULL,
    [ULTCOSTOORIGINE]     DECIMAL (19, 6) NULL,
    [DATAULTCOSTO]        DATETIME        NULL,
    [UMORIGINE]           VARCHAR (3)     NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [GIACINIZIALE]        DECIMAL (16, 6) NULL,
    [QTACARICO]           DECIMAL (16, 6) NULL,
    [QTASCARICO]          DECIMAL (16, 6) NULL,
    [ESERCIZIO]           DECIMAL (5)     CONSTRAINT [DF_TEMPSTAMPALIFO_ESERCIZIO] DEFAULT (0) NOT NULL,
    [VALCARICO]           DECIMAL (19, 6) NULL,
    [VALCARICOEURO]       DECIMAL (19, 6) NULL,
    CONSTRAINT [PK_TEMPSTAMPALIFO] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [ESERCIZIO] ASC, [CODART] ASC, [CODDEPOSITO] ASC, [NRIFPARTITA] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_QTA]
    ON [dbo].[TEMPSTAMPALIFO]([GIACINIZIALE] ASC, [QTACARICO] ASC, [QTASCARICO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190319-120103]
    ON [dbo].[TEMPSTAMPALIFO]([NRTERMINALE] ASC, [CODART] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPALIFO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPALIFO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPALIFO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPALIFO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPALIFO] TO [Metodo98]
    AS [dbo];
