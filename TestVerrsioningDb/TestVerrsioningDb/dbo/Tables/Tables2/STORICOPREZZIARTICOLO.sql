﻿CREATE TABLE [dbo].[STORICOPREZZIARTICOLO] (
    [TIPOPREZZO]         CHAR (1)        DEFAULT ('F') NOT NULL,
    [CODARTICOLO]        VARCHAR (50)    NOT NULL,
    [DATA]               DATETIME        NOT NULL,
    [ULTIMO]             SMALLINT        DEFAULT (0) NULL,
    [CODCLIFOR]          VARCHAR (7)     NULL,
    [UM]                 VARCHAR (3)     NOT NULL,
    [QUANTITA]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [PREZZOLIRE]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [PREZZOEURO]         DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [CODPAGAMENTO]       VARCHAR (4)     NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [RIFSTORICOMAG]      DECIMAL (10)    DEFAULT (0) NULL,
    [SPESERIPMAGLIRE]    DECIMAL (19, 4) CONSTRAINT [DF_STORICOPREZZIARTICOLO_SPESERIPMAGLIRE] DEFAULT (0) NULL,
    [SPESERIPMAGEURO]    DECIMAL (19, 4) CONSTRAINT [DF_STORICOPREZZIARTICOLO_SPESERIPMAGEURO] DEFAULT (0) NULL,
    [PREZZORIGHEDOC]     DECIMAL (19, 6) CONSTRAINT [DF_STORICOPREZZIARTICOLO_PREZZORIGHEDOC] DEFAULT (0) NULL,
    [PREZZORIGHEDOCEURO] DECIMAL (19, 6) CONSTRAINT [DF_STORICOPREZZIART_PRZRIGHEDOCEURO] DEFAULT (0) NULL,
    CONSTRAINT [PK_STORICOPREZZIARTICOLO] PRIMARY KEY CLUSTERED ([TIPOPREZZO] ASC, [CODARTICOLO] ASC, [DATA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_TIPOPREZZO_STORICOP] CHECK ([TIPOPREZZO] = 'F' or [TIPOPREZZO] = 'C'),
    CONSTRAINT [CKC_ULTIMO_STORICOP] CHECK ([ULTIMO] = 0 or [ULTIMO] = 1)
);


GO
CREATE NONCLUSTERED INDEX [STPREZZI_ULTPREZZOVERO]
    ON [dbo].[STORICOPREZZIARTICOLO]([TIPOPREZZO] ASC, [CODARTICOLO] ASC, [ULTIMO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STPREZZI_ARTICOLO]
    ON [dbo].[STORICOPREZZIARTICOLO]([CODARTICOLO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STPREZZI_CLIFOR]
    ON [dbo].[STORICOPREZZIARTICOLO]([CODCLIFOR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [STPREZZI_PAG]
    ON [dbo].[STORICOPREZZIARTICOLO]([CODPAGAMENTO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[STORICOPREZZIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOPREZZIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOPREZZIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOPREZZIARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOPREZZIARTICOLO] TO [Metodo98]
    AS [dbo];

