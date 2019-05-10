CREATE TABLE [dbo].[CONTRATTI_CL_MANCRESO] (
    [PROGRESSIVO]             DECIMAL (10)    NOT NULL,
    [RIFPROGRESSIVO]          DECIMAL (10)    NOT NULL,
    [NRRIGA]                  INT             NOT NULL,
    [ESCLUSOLOGICAMENTE]      SMALLINT        DEFAULT ((0)) NULL,
    [BOLISPERC]               SMALLINT        DEFAULT ((0)) NOT NULL,
    [DESCRIZIONE]             VARCHAR (500)   DEFAULT ('') NULL,
    [VALORE]                  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PERIODICITALIQUIDAZIONE] INT             DEFAULT ((0)) NULL,
    [TIPO]                    SMALLINT        DEFAULT ((0)) NULL,
    [CODSCONTO]               VARCHAR (5)     DEFAULT ('') NULL,
    [PRCAG1]                  SMALLINT        DEFAULT ((0)) NULL,
    [PRCAG2]                  SMALLINT        DEFAULT ((0)) NULL,
    [PRCAG3]                  SMALLINT        DEFAULT ((0)) NULL,
    [TIPODOC]                 VARCHAR (3)     DEFAULT ('') NULL,
    [IVA]                     VARCHAR (3)     DEFAULT ('') NULL,
    [PAGAMENTO]               VARCHAR (4)     DEFAULT ('') NULL,
    [SOTTOCONTOCONTABILE]     VARCHAR (7)     DEFAULT ('') NULL,
    [LiqIntestaCFFatt]        SMALLINT        DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO


CREATE TRIGGER  TD_CONTRATTI_CL_MANCRESO ON CONTRATTI_CL_MANCRESO
FOR DELETE 
AS

      DELETE CONTRATTI_CL
      FROM   CONTRATTI_CL T2, DELETED T1
      WHERE  T2.RIFPROGRESSIVO= T1.RIFPROGRESSIVO
             AND T2.NRRIGA =T1.NRRIGA





GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_CL_MANCRESO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_CL_MANCRESO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_CL_MANCRESO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_CL_MANCRESO] TO [Metodo98]
    AS [dbo];

