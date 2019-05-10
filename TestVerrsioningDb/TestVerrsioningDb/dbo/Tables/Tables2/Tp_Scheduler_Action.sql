CREATE TABLE [dbo].[Tp_Scheduler_Action] (
    [Codice]         VARCHAR (5)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [Attiva]         SMALLINT     DEFAULT ((1)) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_Scheduler_Action] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_Scheduler_Action] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_Scheduler_Action] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_Scheduler_Action] TO [Metodo98]
    AS [dbo];

