CREATE TABLE [dbo].[TP_PERIODI_CALCOLATI] (
    [Periodo]        INT          NOT NULL,
    [Inizio]         DATETIME     NOT NULL,
    [Fine]           DATETIME     NOT NULL,
    [Osservazione]   INT          DEFAULT ((0)) NOT NULL,
    [GiorniLavoro]   INT          DEFAULT ((0)) NOT NULL,
    [GiorniPeriodo]  INT          DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    [Cambiato]       SMALLINT     DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Periodo] ASC, [Inizio] ASC, [Osservazione] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PERIODI_CALCOLATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PERIODI_CALCOLATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PERIODI_CALCOLATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PERIODI_CALCOLATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PERIODI_CALCOLATI] TO [Metodo98]
    AS [dbo];

