﻿CREATE TABLE [dbo].[TDA_FUNZIONIFEEDBACK] (
    [RIFCAUSALE]     DECIMAL (5)  NOT NULL,
    [PRIORITA]       INT          NOT NULL,
    [FUNZIONE]       DECIMAL (5)  NULL,
    [TIPO]           SMALLINT     NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [TIPOTERMINALE]  SMALLINT     NULL,
    [OBBLIGATORIA]   SMALLINT     NULL,
    PRIMARY KEY CLUSTERED ([RIFCAUSALE] ASC, [PRIORITA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_ACCESSICAUSALIFEEDBACK_CAUSALIFEEDBACK] FOREIGN KEY ([RIFCAUSALE]) REFERENCES [dbo].[TDA_CAUSALIFEEDBACK] ([CODICE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_FUNZIONIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_FUNZIONIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_FUNZIONIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_FUNZIONIFEEDBACK] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_FUNZIONIFEEDBACK] TO [Metodo98]
    AS [dbo];

