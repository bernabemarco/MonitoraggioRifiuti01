CREATE TABLE [dbo].[relgruppoEcom] (
    [IDRIGA]            DECIMAL (10) NOT NULL,
    [CODICE]            DECIMAL (5)  NOT NULL,
    [MACROCATEGORIA_ID] DECIMAL (5)  NULL,
    [CATEGORIA_ID]      DECIMAL (5)  NULL,
    [NomeImp]           VARCHAR (10) NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25) DEFAULT ('') NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    CONSTRAINT [PK_RELGRUPPOECOM] PRIMARY KEY CLUSTERED ([IDRIGA] ASC, [CODICE] ASC, [NomeImp] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[relgruppoEcom] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[relgruppoEcom] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[relgruppoEcom] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[relgruppoEcom] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[relgruppoEcom] TO [Metodo98]
    AS [dbo];

