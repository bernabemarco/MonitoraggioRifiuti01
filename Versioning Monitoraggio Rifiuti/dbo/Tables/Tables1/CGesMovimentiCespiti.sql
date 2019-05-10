CREATE TABLE [dbo].[CGesMovimentiCespiti] (
    [Progressivo]      DECIMAL (10)    NOT NULL,
    [Ambiente]         VARCHAR (3)     DEFAULT ('') NULL,
    [AnnoInizio]       DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]       INT             DEFAULT (0) NULL,
    [AnnoFine]         DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]         INT             DEFAULT (0) NULL,
    [CodContoRaccordo] VARCHAR (30)    DEFAULT ('') NULL,
    [CodDestinazione]  VARCHAR (10)    DEFAULT ('') NULL,
    [Valore]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [NumTransazione1]  DECIMAL (10)    DEFAULT (0) NULL,
    [NumTransazione2]  DECIMAL (10)    DEFAULT (0) NULL,
    [NumTransazione3]  DECIMAL (10)    DEFAULT (0) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesMovimentiCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesMovimentiCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesMovimentiCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesMovimentiCespiti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesMovimentiCespiti] TO [Metodo98]
    AS [dbo];

