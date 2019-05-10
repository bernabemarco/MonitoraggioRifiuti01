CREATE TABLE [dbo].[FRC_CP_WSchedaCostoDettaglio] (
    [NrTerminale]    DECIMAL (5)     NOT NULL,
    [ID]             INT             NOT NULL,
    [Riga]           INT             NOT NULL,
    [Posizione]      INT             NOT NULL,
    [Descrizione]    VARCHAR (100)   DEFAULT ('') NULL,
    [Grassetto]      SMALLINT        DEFAULT ((0)) NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Percentuale]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ID] ASC, [Riga] ASC, [Posizione] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoDettaglio] TO [Metodo98]
    AS [dbo];

