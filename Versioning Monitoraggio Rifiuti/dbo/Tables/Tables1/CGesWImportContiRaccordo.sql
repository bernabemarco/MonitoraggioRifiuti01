﻿CREATE TABLE [dbo].[CGesWImportContiRaccordo] (
    [Progressivo]       DECIMAL (10)  NOT NULL,
    [Codice]            VARCHAR (30)  DEFAULT ('') NULL,
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
    [DataRegistrazione] DATETIME      NULL,
    [FlagVal]           SMALLINT      DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200) DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)  NOT NULL,
    [DataModifica]      DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWImportContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWImportContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWImportContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWImportContiRaccordo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWImportContiRaccordo] TO [Metodo98]
    AS [dbo];

