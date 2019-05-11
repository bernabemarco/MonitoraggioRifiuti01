﻿CREATE TABLE [dbo].[TEMPSTPQUADROSAELENCHICF] (
    [IDSESSIONE]     DECIMAL (5)  NOT NULL,
    [NRPAGINA]       SMALLINT     NOT NULL,
    [CODFISCDITTA]   VARCHAR (16) NULL,
    [NRMODELLO]      VARCHAR (8)  NULL,
    [CODFISCALE1]    VARCHAR (16) NULL,
    [NROPERAZ1]      INT          NULL,
    [IMPORTO1]       DECIMAL (10) NULL,
    [FLGNOLEGGIO1]   VARCHAR (1)  NULL,
    [CODFISCALE2]    VARCHAR (16) NULL,
    [NROPERAZ2]      INT          NULL,
    [IMPORTO2]       DECIMAL (10) NULL,
    [FLGNOLEGGIO2]   VARCHAR (1)  NULL,
    [CODFISCALE3]    VARCHAR (16) NULL,
    [NROPERAZ3]      INT          NULL,
    [IMPORTO3]       DECIMAL (10) NULL,
    [FLGNOLEGGIO3]   VARCHAR (1)  NULL,
    [CODFISCALE4]    VARCHAR (16) NULL,
    [NROPERAZ4]      INT          NULL,
    [IMPORTO4]       DECIMAL (10) NULL,
    [FLGNOLEGGIO4]   VARCHAR (1)  NULL,
    [CODFISCALE5]    VARCHAR (16) NULL,
    [NROPERAZ5]      INT          NULL,
    [IMPORTO5]       DECIMAL (10) NULL,
    [FLGNOLEGGIO5]   VARCHAR (1)  NULL,
    [CODFISCALE6]    VARCHAR (16) NULL,
    [NROPERAZ6]      INT          NULL,
    [IMPORTO6]       DECIMAL (10) NULL,
    [FLGNOLEGGIO6]   VARCHAR (1)  NULL,
    [CODFISCALE7]    VARCHAR (16) NULL,
    [NROPERAZ7]      INT          NULL,
    [IMPORTO7]       DECIMAL (10) NULL,
    [FLGNOLEGGIO7]   VARCHAR (1)  NULL,
    [CODFISCALE8]    VARCHAR (16) NULL,
    [NROPERAZ8]      INT          NULL,
    [IMPORTO8]       DECIMAL (10) NULL,
    [FLGNOLEGGIO8]   VARCHAR (1)  NULL,
    [CODFISCALE9]    VARCHAR (16) NULL,
    [NROPERAZ9]      INT          NULL,
    [IMPORTO9]       DECIMAL (10) NULL,
    [FLGNOLEGGIO9]   VARCHAR (1)  NULL,
    [CODFISCALE10]   VARCHAR (16) NULL,
    [NROPERAZ10]     INT          NULL,
    [IMPORTO10]      DECIMAL (10) NULL,
    [FLGNOLEGGIO10]  VARCHAR (1)  NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TEMPSTPQUADROSAELENCHICF] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRPAGINA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPQUADROSAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPQUADROSAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPQUADROSAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPQUADROSAELENCHICF] TO [Metodo98]
    AS [dbo];
