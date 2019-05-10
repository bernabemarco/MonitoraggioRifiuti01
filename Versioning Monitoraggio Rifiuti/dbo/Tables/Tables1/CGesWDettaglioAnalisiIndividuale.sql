CREATE TABLE [dbo].[CGesWDettaglioAnalisiIndividuale] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [CodDestinazione]  VARCHAR (10)    NOT NULL,
    [CodConto]         VARCHAR (20)    NOT NULL,
    [ImportoVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo01]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo02]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo03]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo04]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo05]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo06]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo07]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo08]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo09]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo10]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo11]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Importo12]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoTotale]    DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodDestinazione] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWDettaglioAnalisiIndividuale] TO [Metodo98]
    AS [dbo];

