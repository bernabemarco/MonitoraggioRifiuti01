﻿CREATE TABLE [dbo].[TABREVISIONI] (
    [VERSIONE]  INT NOT NULL,
    [REVISIONE] INT NOT NULL,
    CONSTRAINT [PK_TABREVISIONI] PRIMARY KEY CLUSTERED ([VERSIONE] ASC, [REVISIONE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABREVISIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABREVISIONI] TO [Metodo98]
    AS [dbo];

