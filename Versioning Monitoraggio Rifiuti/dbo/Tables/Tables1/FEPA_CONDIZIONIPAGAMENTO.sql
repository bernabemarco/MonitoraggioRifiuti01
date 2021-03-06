﻿CREATE TABLE [dbo].[FEPA_CONDIZIONIPAGAMENTO] (
    [Codice]         VARCHAR (4)  NOT NULL,
    [Descrizione]    VARCHAR (50) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FEPA_CONDIZIONIPAGAMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FEPA_CONDIZIONIPAGAMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FEPA_CONDIZIONIPAGAMENTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FEPA_CONDIZIONIPAGAMENTO] TO [Metodo98]
    AS [dbo];

