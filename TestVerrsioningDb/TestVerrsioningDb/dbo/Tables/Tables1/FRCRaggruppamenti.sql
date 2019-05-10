CREATE TABLE [dbo].[FRCRaggruppamenti] (
    [Ambiente]       VARCHAR (3)   NOT NULL,
    [Riga]           INT           NOT NULL,
    [NomeCampo]      VARCHAR (80)  DEFAULT ('') NULL,
    [Usa]            SMALLINT      DEFAULT ((0)) NULL,
    [Usa2]           SMALLINT      DEFAULT ((0)) NULL,
    [Ordinamento]    INT           DEFAULT ((0)) NULL,
    [Ordinamento2]   INT           DEFAULT ((0)) NULL,
    [Somma]          SMALLINT      DEFAULT ((0)) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [EscludiVar]     SMALLINT      DEFAULT ((0)) NULL,
    [UnFilePerOgni]  SMALLINT      DEFAULT ((0)) NULL,
    [EuroSuUM]       SMALLINT      DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCRaggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCRaggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCRaggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCRaggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCRaggruppamenti] TO [Metodo98]
    AS [dbo];

