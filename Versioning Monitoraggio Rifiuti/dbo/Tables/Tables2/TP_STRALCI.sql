CREATE TABLE [dbo].[TP_STRALCI] (
    [IDTestaS] NUMERIC (10) NOT NULL,
    [IDRigaS]  INT          NOT NULL,
    [Stato]    CHAR (1)     NOT NULL,
    [Utente]   CHAR (25)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_TP_STRALCI]
    ON [dbo].[TP_STRALCI]([IDTestaS] ASC, [IDRigaS] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_STRALCI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_STRALCI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_STRALCI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_STRALCI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_STRALCI] TO [Metodo98]
    AS [dbo];

