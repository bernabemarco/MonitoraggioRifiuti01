CREATE TABLE [dbo].[BudWAnalisiScostamenti] (
    [NrTerminale]          DECIMAL (5)  NOT NULL,
    [StagioneRif]          VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoStagioneRif]      VARCHAR (3)  DEFAULT ('') NULL,
    [TipologiaProdottoRif] VARCHAR (5)  DEFAULT ('') NULL,
    [AmbienteRif]          DECIMAL (5)  DEFAULT ('') NULL,
    [StagioneCon]          VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoStagioneCon]      VARCHAR (3)  DEFAULT ('') NULL,
    [TipologiaProdottoCon] VARCHAR (5)  DEFAULT ('') NULL,
    [AmbienteCon]          DECIMAL (5)  DEFAULT ('') NULL,
    [LivelloBudget]        SMALLINT     DEFAULT (0) NULL,
    [UtenteModifica]       VARCHAR (25) NOT NULL,
    [DataModifica]         DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWAnalisiScostamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWAnalisiScostamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWAnalisiScostamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWAnalisiScostamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWAnalisiScostamenti] TO [Metodo98]
    AS [dbo];

