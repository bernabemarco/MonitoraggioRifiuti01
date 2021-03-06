﻿CREATE TABLE [dbo].[TRASPORTO_CAD_FILTRI] (
    [PROGRESSIVO]        DECIMAL (18) NOT NULL,
    [RIFPROGRESSIVOTV]   DECIMAL (5)  DEFAULT ((0)) NULL,
    [RIFPROGRESSIVOSPED] DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodZonaSpedizione]  VARCHAR (10) DEFAULT ('') NOT NULL,
    [CodZona]            DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodRegione]         VARCHAR (4)  DEFAULT ('') NOT NULL,
    [Provincia]          VARCHAR (2)  DEFAULT ('') NOT NULL,
    [CodSettore]         DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodCategoria]       DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodGruppoPrezzi]    DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodClienteFatt]     VARCHAR (7)  DEFAULT ('') NOT NULL,
    [CodCliente]         VARCHAR (7)  DEFAULT ('') NOT NULL,
    [CodDestinazione]    DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodGruppoArt]       DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodCategoriaArt]    DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodCategoriaStat]   DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodGruppoPrezziArt] DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodFamiglia]        DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodReparto]         DECIMAL (5)  DEFAULT ((0)) NOT NULL,
    [CodArt]             VARCHAR (50) DEFAULT ('') NOT NULL,
    [CodDeposito1]       VARCHAR (10) DEFAULT ('') NOT NULL,
    [CodDeposito2]       VARCHAR (10) DEFAULT ('') NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (30) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [FK_TRASPORTO_CAD_FILTRI_TRASPORTO_CAD] FOREIGN KEY ([RIFPROGRESSIVOSPED]) REFERENCES [dbo].[TRASPORTO_CAD] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_TRASPORTO_CAD_FILTRI_TRASPORTO_CAD_TREEVIEW] FOREIGN KEY ([RIFPROGRESSIVOTV]) REFERENCES [dbo].[TRASPORTO_CAD_TREEVIEW] ([PROGRESSIVO]) ON DELETE SET DEFAULT
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD_FILTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD_FILTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRASPORTO_CAD_FILTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD_FILTRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD_FILTRI] TO [Metodo98]
    AS [dbo];

