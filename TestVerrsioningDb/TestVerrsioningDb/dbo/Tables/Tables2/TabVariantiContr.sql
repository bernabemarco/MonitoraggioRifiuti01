CREATE TABLE [dbo].[TabVariantiContr] (
    [RifProgressivo]   DECIMAL (10)    NOT NULL,
    [NumRiga]          SMALLINT        NOT NULL,
    [NomeImporto]      DECIMAL (5)     NULL,
    [OggettoVar]       VARCHAR (50)    NULL,
    [DataFormulazione] DATETIME        NULL,
    [DataAccettazione] DATETIME        NULL,
    [StatoVar]         SMALLINT        DEFAULT (0) NULL,
    [ImportoVar]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [CodDivisa]        SMALLINT        DEFAULT (0) NULL,
    [ValOfferta]       DECIMAL (13, 6) DEFAULT (1) NULL,
    [ValFormale]       DECIMAL (13, 6) DEFAULT (1) NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [TabVariantiContr_PK] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NumRiga] ASC),
    CONSTRAINT [FK_TABVARIANTICONTR_RIFPROGRESSIVO] FOREIGN KEY ([RifProgressivo]) REFERENCES [dbo].[AnagraficaCommesse] ([Progressivo]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabVariantiContr] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabVariantiContr] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabVariantiContr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabVariantiContr] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabVariantiContr] TO [Metodo98]
    AS [dbo];

