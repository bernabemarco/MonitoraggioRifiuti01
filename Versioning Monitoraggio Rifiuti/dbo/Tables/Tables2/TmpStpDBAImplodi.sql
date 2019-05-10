CREATE TABLE [dbo].[TmpStpDBAImplodi] (
    [IDSESSIONE]  DECIMAL (5)  NOT NULL,
    [CODICE]      VARCHAR (50) NOT NULL,
    [IDRIGA]      DECIMAL (10) NOT NULL,
    [RIFTESTADBA] DECIMAL (10) NULL,
    [RIFRIGADBA]  INT          NULL,
    [LIVELLO]     SMALLINT     NULL,
    CONSTRAINT [PK_IMPL] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [CODICE] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TmpStpDBAImplodi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TmpStpDBAImplodi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TmpStpDBAImplodi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TmpStpDBAImplodi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TmpStpDBAImplodi] TO [Metodo98]
    AS [dbo];

