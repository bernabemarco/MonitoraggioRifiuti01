CREATE TABLE [dbo].[ContrattiArt_CON] (
    [RIFPROGRESSIVO] DECIMAL (5)  NOT NULL,
    [NRRIGA]         DECIMAL (5)  NOT NULL,
    [Posizione]      INT          NOT NULL,
    [FlagRiga]       SMALLINT     NULL,
    [Articolo]       VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    [ESCLUDI]        SMALLINT     DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiArt_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiArt_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiArt_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiArt_CON] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiArt_CON] TO [Metodo98]
    AS [dbo];

