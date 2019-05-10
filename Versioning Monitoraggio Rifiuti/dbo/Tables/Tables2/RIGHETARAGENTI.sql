﻿CREATE TABLE [dbo].[RIGHETARAGENTI] (
    [RIFPROGRESSIVO]   DECIMAL (9)     NOT NULL,
    [CODICE]           VARCHAR (50)    NOT NULL,
    [CODICEDETT]       VARCHAR (50)    NOT NULL,
    [DESCRIZIONE]      VARCHAR (100)   NULL,
    [FILTRO]           INT             CONSTRAINT [DF_RIGHETARAGENTI_FILTRO] DEFAULT ((-1)) NOT NULL,
    [UM]               DECIMAL (5)     NULL,
    [M01VAL]           DECIMAL (16, 6) NULL,
    [M01CONS]          DECIMAL (16, 6) NULL,
    [M01PREC]          DECIMAL (16, 6) NULL,
    [M02VAL]           DECIMAL (16, 6) NULL,
    [M02CONS]          DECIMAL (16, 6) NULL,
    [M02PREC]          DECIMAL (16, 6) NULL,
    [M03VAL]           DECIMAL (16, 6) NULL,
    [M03CONS]          DECIMAL (16, 6) NULL,
    [M03PREC]          DECIMAL (16, 6) NULL,
    [M04VAL]           DECIMAL (16, 6) NULL,
    [M04CONS]          DECIMAL (16, 6) NULL,
    [M04PREC]          DECIMAL (16, 6) NULL,
    [M05VAL]           DECIMAL (16, 6) NULL,
    [M05CONS]          DECIMAL (16, 6) NULL,
    [M05PREC]          DECIMAL (16, 6) NULL,
    [M06VAL]           DECIMAL (16, 6) NULL,
    [M06CONS]          DECIMAL (16, 6) NULL,
    [M06PREC]          DECIMAL (16, 6) NULL,
    [M07VAL]           DECIMAL (16, 6) NULL,
    [M07CONS]          DECIMAL (16, 6) NULL,
    [M07PREC]          DECIMAL (16, 6) NULL,
    [M08VAL]           DECIMAL (16, 6) NULL,
    [M08CONS]          DECIMAL (16, 6) NULL,
    [M08PREC]          DECIMAL (16, 6) NULL,
    [M09VAL]           DECIMAL (16, 6) NULL,
    [M09CONS]          DECIMAL (16, 6) NULL,
    [M09PREC]          DECIMAL (16, 6) NULL,
    [M10VAL]           DECIMAL (16, 6) NULL,
    [M10CONS]          DECIMAL (16, 6) NULL,
    [M10PREC]          DECIMAL (16, 6) NULL,
    [M11VAL]           DECIMAL (16, 6) NULL,
    [M11CONS]          DECIMAL (16, 6) NULL,
    [M11PREC]          DECIMAL (16, 6) NULL,
    [M12VAL]           DECIMAL (16, 6) NULL,
    [M12CONS]          DECIMAL (16, 6) NULL,
    [M12PREC]          DECIMAL (16, 6) NULL,
    [TOTVAL]           DECIMAL (16, 6) NULL,
    [TOTCONS]          DECIMAL (16, 6) NULL,
    [TOTPREC]          DECIMAL (16, 6) NULL,
    [GESTPREMIO]       SMALLINT        NULL,
    [TIPOPREMIO]       SMALLINT        NULL,
    [VALOREPREMIO]     DECIMAL (16, 6) NULL,
    [VINCOLO]          SMALLINT        NULL,
    [DESCRENASARCO]    VARCHAR (255)   NULL,
    [IMPORTOLIQUIDATO] SMALLINT        NULL,
    [DATALIQUIDAZIONE] DATETIME        NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [PK_RIGHETARAGENTI] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [CODICE] ASC, [CODICEDETT] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_RIGHETARAGENTI_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TESTATARAGENTI] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHETARAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHETARAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHETARAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHETARAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHETARAGENTI] TO [Metodo98]
    AS [dbo];

