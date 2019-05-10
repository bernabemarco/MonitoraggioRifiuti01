CREATE TABLE [dbo].[FRCValoreRetribuzioni] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [Ambiente]       VARCHAR (3)     DEFAULT ('') NULL,
    [Anno]           INT             DEFAULT ((0)) NULL,
    [IDRisorsa]      DECIMAL (10)    DEFAULT ((0)) NULL,
    [MeseInizio]     INT             DEFAULT ((0)) NULL,
    [MeseFine]       INT             DEFAULT ((0)) NULL,
    [VoceCosto]      VARCHAR (20)    DEFAULT ('') NULL,
    [Valore]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCValoreRetribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCValoreRetribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCValoreRetribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCValoreRetribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCValoreRetribuzioni] TO [Metodo98]
    AS [dbo];

