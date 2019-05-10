﻿CREATE TABLE [dbo].[TEMPPRELIEVODOC] (
    [IDSESSIONE]    INT          NOT NULL,
    [IDTESTA]       DECIMAL (10) NOT NULL,
    [IDRIGA]        INT          NOT NULL,
    [IDCONSEGNA]    VARCHAR (10) NULL,
    [PROGRRIGACONS] INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPPRELIEVODOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPPRELIEVODOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPPRELIEVODOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPPRELIEVODOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPPRELIEVODOC] TO [Metodo98]
    AS [dbo];

