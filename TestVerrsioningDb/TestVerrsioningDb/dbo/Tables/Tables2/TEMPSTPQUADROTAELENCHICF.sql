﻿CREATE TABLE [dbo].[TEMPSTPQUADROTAELENCHICF] (
    [IDSESSIONE]     DECIMAL (5)  NOT NULL,
    [NRPAGINA]       SMALLINT     NOT NULL,
    [CODFISCDITTA]   VARCHAR (16) NULL,
    [NRMODELLO]      VARCHAR (8)  NULL,
    [NRRECFA]        INT          NULL,
    [NRRECSA]        INT          NULL,
    [NRRECBLACKLIST] INT          NULL,
    [NRRECNONRES]    INT          NULL,
    [NRRECACQNONRES] INT          NULL,
    [NRRECFE]        INT          NULL,
    [NRRECFERIEP]    INT          NULL,
    [NRRECFR]        INT          NULL,
    [NRRECFRRIEP]    INT          NULL,
    [NRRECNE]        INT          NULL,
    [NRRECNR]        INT          NULL,
    [NRRECDF]        INT          NULL,
    [NRRECFN]        INT          NULL,
    [NRRECSE]        INT          NULL,
    [NRRECTU]        INT          NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TEMPSTPQUADROTAELENCHICF] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRPAGINA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPQUADROTAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPQUADROTAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPQUADROTAELENCHICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPQUADROTAELENCHICF] TO [Metodo98]
    AS [dbo];
