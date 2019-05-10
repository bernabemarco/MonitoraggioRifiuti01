CREATE TABLE [dbo].[BudWDistribuzioneArticoliMesiBudget] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [Articolo]       VARCHAR (50)    NOT NULL,
    [Anno]           DECIMAL (5)     NOT NULL,
    [Mese]           INT             NOT NULL,
    [Quantita]       DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Articolo] ASC, [Anno] ASC, [Mese] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[BudWDistribuzioneArticoliMesiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[BudWDistribuzioneArticoliMesiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[BudWDistribuzioneArticoliMesiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[BudWDistribuzioneArticoliMesiBudget] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[BudWDistribuzioneArticoliMesiBudget] TO [Metodo98]
    AS [dbo];

