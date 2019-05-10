CREATE TABLE [dbo].[TabCausaliCes] (
    [Codice]           DECIMAL (5)  DEFAULT (0) NOT NULL,
    [Descrizione]      VARCHAR (80) NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    [FDOANNOPREC]      SMALLINT     CONSTRAINT [DF_TABCAUSALICES_FDOANNOPREC] DEFAULT (0) NOT NULL,
    [CALCPMVALENZE]    SMALLINT     NULL,
    [DATAINISUPERAMM]  DATETIME     NULL,
    [DATAFINESUPERAMM] DATETIME     NULL,
    [DATAINIIPERAMM]   DATETIME     NULL,
    [DATAFINEIPERAMM]  DATETIME     NULL,
    CONSTRAINT [TabCausaliCes_PK] PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabCausaliCes] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabCausaliCes] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabCausaliCes] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabCausaliCes] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabCausaliCes] TO [Metodo98]
    AS [dbo];

