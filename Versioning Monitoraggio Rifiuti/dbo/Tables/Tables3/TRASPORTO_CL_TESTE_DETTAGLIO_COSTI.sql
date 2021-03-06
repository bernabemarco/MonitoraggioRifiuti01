﻿CREATE TABLE [dbo].[TRASPORTO_CL_TESTE_DETTAGLIO_COSTI] (
    [RIFPROGRESSIVO] DECIMAL (18)    NOT NULL,
    [CODICE]         VARCHAR (5)     NOT NULL,
    [VALORE]         DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [CODICE] ASC),
    CONSTRAINT [FK_TRASPORTO_CL_TESTE_DETTAGLIO_COSTI_TRASPORTO_CL_TESTE] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TRASPORTO_CL_TESTE] ([PROGRESSIVO]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CL_TESTE_DETTAGLIO_COSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CL_TESTE_DETTAGLIO_COSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CL_TESTE_DETTAGLIO_COSTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CL_TESTE_DETTAGLIO_COSTI] TO [Metodo98]
    AS [dbo];

