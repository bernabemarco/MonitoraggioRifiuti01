﻿CREATE TABLE [dbo].[TMPTRACCDOCPRELEVATI] (
    [IDSESSIONE]  DECIMAL (5)  NOT NULL,
    [PROGRESSIVO] DECIMAL (10) NOT NULL,
    CONSTRAINT [PK_TMPTRACCDOCPRELEVATI] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPTRACCDOCPRELEVATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPTRACCDOCPRELEVATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPTRACCDOCPRELEVATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPTRACCDOCPRELEVATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPTRACCDOCPRELEVATI] TO [Metodo98]
    AS [dbo];

