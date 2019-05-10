CREATE TABLE [dbo].[SL_LIQ_PROVV] (
    [Progressivo]  DECIMAL (10) NOT NULL,
    [tipoprovv]    INT          NOT NULL,
    [annoscadenza] INT          NOT NULL,
    [trimestre]    INT          NOT NULL,
    [UTENTE]       VARCHAR (25) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_LIQ_PROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_LIQ_PROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_LIQ_PROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_LIQ_PROVV] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_LIQ_PROVV] TO [Metodo98]
    AS [dbo];

