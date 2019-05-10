CREATE TABLE [dbo].[CGesWContiRaccordo] (
    [IDSessione]        DECIMAL (5)   NOT NULL,
    [Codice]            VARCHAR (30)  NOT NULL,
    [Descrizione]       VARCHAR (80)  DEFAULT ('') NULL,
    [CodConto1]         VARCHAR (20)  DEFAULT ('') NULL,
    [CodConto2]         VARCHAR (20)  DEFAULT ('') NULL,
    [CodConto3]         VARCHAR (20)  DEFAULT ('') NULL,
    [CodDistribuzione]  VARCHAR (3)   DEFAULT ('') NULL,
    [CodDistribuzione2] VARCHAR (3)   DEFAULT ('') NULL,
    [CodDistribuzione3] VARCHAR (3)   DEFAULT ('') NULL,
    [Usa]               SMALLINT      DEFAULT (0) NULL,
    [InverteSegno]      SMALLINT      DEFAULT (0) NULL,
    [Note]              VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)  NOT NULL,
    [DataModifica]      DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSessione] ASC, [Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWContiRaccordo] TO [Metodo98]
    AS [dbo];

