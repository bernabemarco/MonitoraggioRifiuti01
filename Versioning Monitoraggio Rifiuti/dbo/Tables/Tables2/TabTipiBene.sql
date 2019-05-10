CREATE TABLE [dbo].[TabTipiBene] (
    [Codice]         DECIMAL (5)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [Tipo]           SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [TabTipiBene_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [Tipo_Check] CHECK ([Tipo] = 2 or [Tipo] = 1 or [Tipo] = 0)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabTipiBene] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabTipiBene] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabTipiBene] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabTipiBene] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabTipiBene] TO [Metodo98]
    AS [dbo];

