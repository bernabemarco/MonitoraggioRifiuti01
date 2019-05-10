CREATE TABLE [dbo].[CGesInputTransazioni] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [Ambiente]          VARCHAR (3)     DEFAULT ('') NULL,
    [CodContoRaccordo]  VARCHAR (30)    DEFAULT ('') NULL,
    [CodConto]          VARCHAR (20)    DEFAULT ('') NULL,
    [CodDestinazione]   VARCHAR (10)    DEFAULT ('') NULL,
    [TipoTransazione]   SMALLINT        DEFAULT (0) NULL,
    [Usa]               SMALLINT        DEFAULT (0) NULL,
    [Calcolo]           SMALLINT        DEFAULT (0) NULL,
    [AnnoInizio]        DECIMAL (5)     DEFAULT (0) NULL,
    [MeseInizio]        INT             DEFAULT (0) NULL,
    [AnnoFine]          DECIMAL (5)     DEFAULT (0) NULL,
    [MeseFine]          INT             DEFAULT (0) NULL,
    [CodDistribuzione]  VARCHAR (3)     DEFAULT ('') NULL,
    [ValoreVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [DataRegistrazione] DATETIME        NULL,
    [Note]              VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesInputTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesInputTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesInputTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesInputTransazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesInputTransazioni] TO [Metodo98]
    AS [dbo];

