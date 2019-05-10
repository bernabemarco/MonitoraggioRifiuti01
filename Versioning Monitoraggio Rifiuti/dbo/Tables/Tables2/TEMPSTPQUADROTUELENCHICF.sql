﻿CREATE TABLE [dbo].[TEMPSTPQUADROTUELENCHICF] (
    [IDSESSIONE]     DECIMAL (5)  NOT NULL,
    [NRPAGINA]       SMALLINT     NOT NULL,
    [CODFISCDITTA]   VARCHAR (16) NULL,
    [NRMODELLO]      VARCHAR (8)  NULL,
    [COGNOME1]       VARCHAR (24) NULL,
    [NOME1]          VARCHAR (20) NULL,
    [DATANASCITA1]   DATETIME     NULL,
    [COMUNENASCITA1] VARCHAR (40) NULL,
    [PROVNASCITA1]   VARCHAR (2)  NULL,
    [CITTA1]         VARCHAR (40) NULL,
    [CODSTATOEST1]   SMALLINT     NULL,
    [INDIRIZZO1]     VARCHAR (80) NULL,
    [DATADOC1]       DATETIME     NULL,
    [DATAREG1]       DATETIME     NULL,
    [NRFATTURA1]     VARCHAR (15) NULL,
    [IMPONIB1]       DECIMAL (10) NULL,
    [IMPOSTA1]       DECIMAL (10) NULL,
    [COGNOME2]       VARCHAR (24) NULL,
    [NOME2]          VARCHAR (20) NULL,
    [DATANASCITA2]   DATETIME     NULL,
    [COMUNENASCITA2] VARCHAR (40) NULL,
    [PROVNASCITA2]   VARCHAR (2)  NULL,
    [CITTA2]         VARCHAR (40) NULL,
    [CODSTATOEST2]   SMALLINT     NULL,
    [INDIRIZZO2]     VARCHAR (80) NULL,
    [DATADOC2]       DATETIME     NULL,
    [DATAREG2]       DATETIME     NULL,
    [NRFATTURA2]     VARCHAR (15) NULL,
    [IMPONIB2]       DECIMAL (10) NULL,
    [IMPOSTA2]       DECIMAL (10) NULL,
    [COGNOME3]       VARCHAR (24) NULL,
    [NOME3]          VARCHAR (20) NULL,
    [DATANASCITA3]   DATETIME     NULL,
    [COMUNENASCITA3] VARCHAR (40) NULL,
    [PROVNASCITA3]   VARCHAR (2)  NULL,
    [CITTA3]         VARCHAR (40) NULL,
    [CODSTATOEST3]   SMALLINT     NULL,
    [INDIRIZZO3]     VARCHAR (80) NULL,
    [DATADOC3]       DATETIME     NULL,
    [DATAREG3]       DATETIME     NULL,
    [NRFATTURA3]     VARCHAR (15) NULL,
    [IMPONIB3]       DECIMAL (10) NULL,
    [IMPOSTA3]       DECIMAL (10) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TEMPSTPQUADROTUELENCHICF] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRPAGINA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPQUADROTUELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPQUADROTUELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPQUADROTUELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPQUADROTUELENCHICF] TO [Metodo98]
    AS [dbo];

