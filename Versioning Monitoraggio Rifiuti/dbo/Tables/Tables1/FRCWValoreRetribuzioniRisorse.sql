CREATE TABLE [dbo].[FRCWValoreRetribuzioniRisorse] (
    [NrTerminale]    DECIMAL (5)  NOT NULL,
    [IDRisorsa]      DECIMAL (10) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [IDRisorsa] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniRisorse] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWValoreRetribuzioniRisorse] TO [Metodo98]
    AS [dbo];

