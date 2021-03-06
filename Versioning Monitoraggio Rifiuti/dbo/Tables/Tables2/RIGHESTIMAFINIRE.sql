﻿CREATE TABLE [dbo].[RIGHESTIMAFINIRE] (
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [NRRIGA]         INT             NOT NULL,
    [CODLIVS1]       VARCHAR (24)    NULL,
    [CODLIVELLO]     VARCHAR (20)    NULL,
    [LIVPADRES1]     VARCHAR (24)    NULL,
    [LIVS1]          SMALLINT        NULL,
    [POSIZIONENODO]  DECIMAL (5)     NULL,
    [POSIZIONE]      DECIMAL (5)     NULL,
    [TIPONODO]       SMALLINT        NULL,
    [CODFOGLIA]      VARCHAR (50)    NULL,
    [DESCRIZIONE]    VARCHAR (255)   NULL,
    [FLGARTICOLO]    SMALLINT        NULL,
    [VOCECOSTO]      VARCHAR (3)     NULL,
    [FORMULA]        VARCHAR (255)   NULL,
    [UMGEST]         VARCHAR (3)     NULL,
    [QTAGESTIONE]    DECIMAL (16, 6) NULL,
    [BUDGET]         DECIMAL (19, 6) NULL,
    [BUDGETVAL]      DECIMAL (19, 6) NULL,
    [EARNEDVAL]      DECIMAL (19, 6) NULL,
    [CONSUNTIVO]     DECIMAL (19, 6) NULL,
    [AVANZAMENTO]    DECIMAL (8, 5)  NULL,
    [PESO]           DECIMAL (8, 5)  NULL,
    [EFFCOSTI]       DECIMAL (16, 6) NULL,
    [EFFCOSTIFINIRE] DECIMAL (16, 6) NULL,
    [EFFTEMPI]       DECIMAL (16, 6) NULL,
    [VARIANZA]       DECIMAL (16, 6) NULL,
    [COSTOAFINIRE]   DECIMAL (19, 6) NULL,
    [GGAFINIRE]      DECIMAL (5)     NULL,
    [DATAFINEPREV]   DATETIME        NULL,
    [DATAINIBUDGET]  DATETIME        NULL,
    [DATAFINEBUDGET] DATETIME        NULL,
    [GGBUDGET]       DECIMAL (5)     NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [NRRIGAPADRE]    INT             NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC),
    CONSTRAINT [FK_RIGHESTIMAFINIRE_RIFPROGRESSIVO] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TESTESTIMAFINIRE] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHESTIMAFINIRE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHESTIMAFINIRE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHESTIMAFINIRE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHESTIMAFINIRE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHESTIMAFINIRE] TO [Metodo98]
    AS [dbo];

