CREATE TABLE [dbo].[Tp_Scheduler_Error] (
    [ID]             DECIMAL (12)   NOT NULL,
    [ActionID]       DECIMAL (10)   NOT NULL,
    [ActionCod]      VARCHAR (10)   NOT NULL,
    [ErrorID]        VARCHAR (50)   DEFAULT ('') NOT NULL,
    [ErrorMessage]   VARCHAR (8000) NOT NULL,
    [ErrorDate]      DATETIME       NOT NULL,
    [State]          SMALLINT       DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)   NOT NULL,
    [DataModifica]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_Scheduler_Error] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_Scheduler_Error] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_Scheduler_Error] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_Scheduler_Error] TO [Metodo98]
    AS [dbo];

